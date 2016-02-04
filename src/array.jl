type AFArray
  ptr::af_array

  function AFArray(ptr)
    a = new(ptr)
    push!(af_buffer, a)
    #finalizer(a, release)
    a
  end
end

unsafe_convert(::Type{af_array}, a::AFArray) = a.ptr

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

show(io::IO, in::AFArray) = show(io, to_host(in))

function size(in::AFArray)
  dims = dim_t[0, 0, 0, 0]
  af_get_dims(pointer(dims,1), pointer(dims,2), pointer(dims,3), pointer(dims,4), in)
  dims[4] != 1 && return (Int(dims[1]), Int(dims[2]), Int(dims[3]), Int(dims[4]))
  dims[3] != 1 && return (Int(dims[1]), Int(dims[2]), Int(dims[3]))
  dims[2] != 1 && return (Int(dims[1]), Int(dims[2]))
  (Int(dims[1]),)
end
size(in::AFArray, dim::Int) = size(in)[dim]

function length(in::AFArray)
  out = dim_t[0]
  af_get_elements(out, in)
  Int(out[1])
end

function eltype(in::AFArray)
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

function ndims(in::AFArray)
  out = Cuint[0]
  af_get_numdims(out, in)
  Int(out[1])
end

similar(in::AFArray) = AFArray(eltype(in), size(in))

##### Methods of array class #####

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

##### Functions to create arrays. #####

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

function fill{T,N}(::Type{AFArray}, value::T, dims::NTuple{N,Int})
  out = af_array[0]
  dims = dim_t[dims...]
  af_constant(out, value, N, dims, aftype(T))
  AFArray(out[1])
end

zeros(in::AFArray) = fill(AFArray, eltype(in)(0), size(in))

function rand{T,N}(::Type{AFArray}, ::Type{T}, dims::NTuple{N,Int})
  out = af_array[0]
  dims = dim_t[dims...]
  af_randu(out, N, dims, aftype(T))
  AFArray(out[1])
end
rand{T}(::Type{AFArray}, ::Type{T}, dims...) = rand(AFArray, T, dims)

function randn{T,N}(::Type{AFArray}, ::Type{T}, dims::NTuple{N,Int})
  out = af_array[0]
  dims = dim_t[dims...]
  af_randn(out, N, dims, aftype(T))
  AFArray(out[1])
end
randn{T}(::Type{AFArray}, ::Type{T}, dims...) = randn(AFArray, T, dims)

function range{T,N}(::Type{AFArray}, ::Type{T}, dims::NTuple{N,Int}, seqdim::Int)
  out = af_array[0]
  dims = dim_t[dims...]
  af_range(out, N, dims, seqdim, aftype(T))
  AFArray(out[1])
end

##### Helper functions for arrays. #####

function cast{T}(in::AFArray, ::Type{T})
  out = af_array[0]
  af_cast(out, in, aftype(T))
  AFArray(out[1])
end

##### Move and Reorder array content. #####

function vec(in::AFArray)
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

function cat(dim::Int, ins::Vector{AFArray})
  length(ins) == 1 && return ins[1]
  dim > 0 || throw("Invalid dimension: $(dim).")
  (1 < length(ins) <= 150) || throw("Invalid input length: $(length(ins)).")
  out = af_array[0]
  af_join_many(out, dim-1, length(ins), ins)
  AFArray(out[1])
end

function reshape{N}(in::AFArray, dims::NTuple{N,Int})
  out = af_array[0]
  dims = dim_t[dims...]
  af_moddims(out, in, N, dims)
  AFArray(out[1])
end
reshape(in::AFArray, dims...) = reshape(in, dims)

function reorder(in::AFArray, x::Int, y::Int, z::Int, w::Int)
  out = af_array[0]
  af_reorder(out, in, Cuint(x), Cuint(y), Cuint(z), Cuint(w))
  AFArray(out[1])
end

# af_replace
# af_select

function shift(in::AFArray)
  # af_shift
  error("Not implemented yet.")
end

function tile(in::AFArray)
  # af_tile
  error("Not implemented yet.")
end

function transpose(in::AFArray; conjugate::Bool=false)
  out = af_array[0]
  af_transpose(out, in, conjugate)
  AFArray(out[1])
end

# af_transpose_inplace

##### Unified API Functions #####

function available_backends()
  p = Cint[0]
  af_get_available_backends(p)
  b = p[1]
  cpu = b & AF_BACKEND_CPU
  cuda = b & AF_BACKEND_CUDA
  opencl = b & AF_BACKEND_OPENCL
  cpu, cuda, opencl
end

# af_get_backend_count
# af_get_backend_id

function setbackend(backend)
  af_set_backend(backend)
end

##### assignment
function lookup(in::AFArray, indices::AFArray, dim::Int)
  out = af_array[0]
  af_lookup(out, in, indices, dim-1)
  AFArray(out[1])
end
