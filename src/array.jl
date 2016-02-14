type AFArray
  ptr::af_array

  function AFArray(ptr)
    a = new(ptr)
    finalizer(a, release)
    a
  end
end

function AFArray{T,N}(::Type{T}, dims::NTuple{N,Int})
  out = af_array[0]
  dims = dim_t[dims...]
  af_create_handle(out, N, dims, aftype(T))
  AFArray(out[1])
end
AFArray{T}(::Type{T}, dims...) = AFArray(T, dims)

function AFArray{T,N}(data::Array{T,N})
  out = af_array[0]
  dims = dim_t[size(data)...]
  af_create_array(out, data, N, dims, aftype(T))
  AFArray(out[1])
end

Base.unsafe_convert(::Type{af_array}, a::AFArray) = a.ptr

Base.show(io::IO, in::AFArray) = show(io, to_host(in))

function Base.size(in::AFArray)
  dims = dim_t[0, 0, 0, 0]
  af_get_dims(pointer(dims,1), pointer(dims,2), pointer(dims,3), pointer(dims,4), in)
  Int(dims[1]), Int(dims[2]), Int(dims[3]), Int(dims[4])
end
Base.size(in::AFArray, dim::Int) = size(in)[dim]

function Base.length(in::AFArray)
  out = dim_t[0]
  af_get_elements(out, in)
  Int(out[1])
end

function Base.eltype(in::AFArray)
  out = af_dtype[0]
  af_get_type(out, in)
  dtype = out[1]
  dtype == f32 && return Float32
  dtype == c32 && return Complex{Float32}
  dtype == f64 && return Float64
  dtype == c64 && return Complex{Float64}
  dtype == b8 && return Bool
  dtype == s32 && return Int32
  dtype == u32 && return UInt32
  dtype == u8 && return UInt8
  dtype == s64 && return Int64
  dtype == u64 && return UInt64
  throw("error: eltype")
end

function Base.ndims(in::AFArray)
  out = Cuint[0]
  af_get_numdims(out, in)
  Int(out[1])
end

Base.similar(in::AFArray) = AFArray(eltype(in), size(in))

function copy(in::AFArray)
  out = af_array[0]
  af_copy_array(out, in)
  AFArray(out[1])
end

eval(in::AFArray) = af_eval(in)

function to_host(in::AFArray)
  out = Array(eltype(in), size(in))
  af_get_data_ptr(out, in)
  out
end

function refcount(in::AFArray)
  out = Int32[0]
  af_get_data_ref_count(out, in)
  Int(out[1])
end

release(in::AFArray) = af_release_array(in)

function retain(in::AFArray)
  out = af_array[0]
  af_retain_array(out, in)
  AFArray(out[1])
end

#af_write_array

#function eye{T,N}(::Type{AFArray{T}}, dims::NTuple{N,Int})
#  out = af_array[0]
#  dims = dim_t[dims...]
#  af_identity(out, N, dims, aftype(T))
#  AFArray(out[1])
#end
#eye{T}(::Type{AFArray{T}}, dims...) = eye(T, dims)

#function iota{T,N}(::Type{AFArray{T}}, dims::NTuple{N,Int}, tdims::NTuple{N,Int})
#  out = af_array[0]
#  dims = dim_t[dims...]
#  tdims = dim_t[tdims...]
#  af_iota(out, N, dims, N, tdims, aftype(T))
#  AFArray(out[1])
#end

function Base.fill(::Type{AFArray}, value, dims)
  out = af_array[0]
  dims = dim_t[dims...]
  af_constant(out, value, length(dims), dims, aftype(typeof(value)))
  AFArray(out[1])
end

Base.zeros{T}(::Type{AFArray}, ::Type{T}, dims) = fill(AFArray, T(0), dims)
Base.zeros{T}(::Type{AFArray}, ::Type{T}, dims...) = zeros(AFArray, T, dims)
Base.zeros(in::AFArray) = fill(AFArray, eltype(in), size(in))

function Base.rand{T}(::Type{AFArray}, ::Type{T}, dims)
  out = af_array[0]
  dims = dim_t[dims...]
  af_randu(out, length(dims), dims, aftype(T))
  AFArray(out[1])
end
Base.rand{T}(::Type{AFArray}, ::Type{T}, dims...) = rand(AFArray, T, dims)

function Base.randn{T}(::Type{AFArray}, ::Type{T}, dims)
  out = af_array[0]
  dims = dim_t[dims...]
  af_randn(out, length(dims), dims, aftype(T))
  AFArray(out[1])
end
Base.randn{T}(::Type{AFArray}, ::Type{T}, dims...) = randn(AFArray, T, dims)

function cast{T}(in::AFArray, ::Type{T})
  out = af_array[0]
  af_cast(out, in, aftype(T))
  AFArray(out[1])
end

function Base.vec(in::AFArray)
  out = af_array[0]
  af_flat(out, in)
  AFArray(out[1])
end

function flip(in::AFArray, dim::Int)
  dim > 0 || throw("Invalid dimension: $(dim).")
  out = af_array[0]
  af_flip(out, in, dim-1)
  AFArray(out[1])
end

function Base.cat(ins::Vector{AFArray}, dim::Int)
  dim > 0 || throw("Invalid dimension: $(dim).")
  length(ins) == 0 && throw("Invalid input length: $(length(ins)).")
  out = af_array[0]
  af_join_many(out, dim-1, length(ins), ins)
  AFArray(out[1])
end

function Base.reshape(in::AFArray, dims)
  out = af_array[0]
  dims = dim_t[dims...]
  af_moddims(out, in, length(dims), dims)
  AFArray(out[1])
end
Base.reshape(in::AFArray, dims...) = reshape(in, dims)

function reorder(in::AFArray, x::Int, y::Int, z::Int, w::Int)
  out = af_array[0]
  af_reorder(out, in, x, y, z, w)
  AFArray(out[1])
end

function Base.transpose(in::AFArray; conjugate::Bool=false)
  out = af_array[0]
  af_transpose(out, in, conjugate)
  AFArray(out[1])
end

function available_backends()
  p = Cint[0]
  af_get_available_backends(p)
  v = Int(p[1])
  cpu = (v & AF_BACKEND_CPU) != 0
  cuda = (v & AF_BACKEND_CUDA) != 0
  opencl = (v & AF_BACKEND_OPENCL) != 0
  "cpu:$(cpu), cuda:$(cuda), opencl:$(opencl)"
end

function setbackend(backend::ASCIIString)
  be =
    backend == "cpu" ? AF_BACKEND_CPU :
    backend == "cuda" ? AF_BACKEND_CUDA : AF_BACKEND_OPENCL
  af_set_backend(be)
end

function lookup(in::AFArray, indices::AFArray, dim::Int)
  out = af_array[0]
  af_lookup(out, in, indices, dim-1)
  AFArray(out[1])
end
