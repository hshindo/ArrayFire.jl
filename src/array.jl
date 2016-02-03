type AFArray{T,N}
  ptr::af_array

  function AFArray(ptr)
    a = new(ptr)
    #finalizer(a, release)
    a
  end
end

typealias AFVector{T} AFArray{T,1}
typealias AFMatrix{T} AFArray{T,2}

unsafe_convert(::Type{af_array}, a::AFArray) = a.ptr

function AFArray{T,N}(::Type{T}, dims::NTuple{N,Int})
  out = af_array[0]
  dims = dim_t[dims...]
  af_create_handle(out, N, dims, aftype(T))
  AFArray{T,N}(out[1])
end
AFArray{T}(::Type{T}, dims...) = AFArray(T, dims)

function AFArray{T,N}(data::Array{T,N})
  out = af_array[0]
  dims = dim_t[size(data)...]
  af_create_array(out, data, N, dims, aftype(T))
  AFArray{T,N}(out[1])
end

show(io::IO, a::AFArray) = show(io, to_host(a))

function size{T,N}(a::AFArray{T,N})
  dims = dim_t[0, 0, 0, 0]
  af_get_dims(pointer(dims,1), pointer(dims,2), pointer(dims,3), pointer(dims,4), a)
  N == 1 && return (dims[1],)
  N == 2 && return (dims[1], dims[2])
  N == 3 && return (dims[1], dims[2], dims[3])
  N == 4 && return (dims[1], dims[2], dims[3], dims[4])
end
size(a::AFArray, dim::Int) = size(a)[dim]

function length(a::AFArray)
  out = dim_t[0]
  af_get_elements(out, a)
  Int(out[1])
end

function af_eltype(a::af_array)
  out = af_dtype[0]
  af_get_type(out, a)
  jltype(out[1])
end

eltype{T}(a::AFArray{T}) = T

function af_ndims(a::af_array)
  res = Cuint[0]
  af_get_numdims(res, a)
  Int(res[1])
end

ndims{T,N}(a::AFArray{T,N}) = N

similar{T,N}(a::AFArray{T,N}) = AFArray(T, size(a))

##### Methods of array class #####

function copy{T,N}(a::AFArray{T,N})
  out = af_array[0]
  af_copy_array(out, a)
  AFArray{T,N}(out[1])
end

eval(a::AFArray) = af_eval(a)

function to_host{T,N}(a::AFArray{T,N})
  host = Array(T, size(a))
  af_get_data_ptr(host, a)
  host
end

function refcount(a::AFArray)
  p = Int32[0]
  af_get_data_ref_count(p, a)
  Int(p[1])
end

release(a::AFArray) = af_release_array(a)

function retain{T,N}(a::AFArray{T,N})
  p = af_array[0]
  af_retain_array(p, a)
  AFArray{T,N}(p[1])
end

#af_write_array

##### Functions to create arrays. #####

function eye{T,N}(::Type{AFArray{T}}, dims::NTuple{N,Int})
  p = af_array[0]
  dims = dim_t[dims...]
  af_identity(p, N, dims, aftype(T))
  AFArray{T,N}(p[1])
end
#eye{T}(::Type{AFArray{T}}, dims...) = eye(T, dims)

function iota{T,N}(::Type{AFArray{T}}, dims::NTuple{N,Int}, tdims::NTuple{N,Int})
  out = af_array[0]
  dims = dim_t[dims...]
  tdims = dim_t[tdims...]
  af_iota(out, N, dims, N, tdims, aftype(T))
  AFArray{T,N}(out[1])
end

function fill{T,N}(::Type{AFArray}, value::T, dims::NTuple{N,Int})
  out = af_array[0]
  dims = dim_t[dims...]
  af_constant(out, value, N, dims, aftype(T))
  AFArray{T,N}(out[1])
end

function rand{T,N}(::Type{AFArray{T}}, dims::NTuple{N,Int})
  out = af_array[0]
  dims = dim_t[dims...]
  af_randu(out, N, dims, aftype(T))
  AFArray{T,N}(out[1])
end
rand{T}(::Type{AFArray{T}}, dims...) = rand(AFArray{T}, dims)

function randn{T,N}(::Type{AFArray{T}}, dims::NTuple{N,Int})
  out = af_array[0]
  dims = dim_t[dims...]
  af_randn(out, N, dims, aftype(T))
  AFArray{T,N}(out[1])
end
randn{T}(::Type{AFArray{T}}, dims...) = randn(AFArray{T}, dims)

function range{T,N}(::Type{AFArray{T}}, dims::NTuple{N,Int}, seqdim::Int)
  out = af_array[0]
  dims = dim_t[dims...]
  af_range(out, N, dims, seqdim, aftype(T))
  AFArray{T,N}(out[1])
end

##### Helper functions for arrays. #####

function cast{T,U}(a::AFArray{T}, ::Type{U})
  out = af_array[0]
  af_cast(out, a, aftype(U))
  AFArray{T,N}(out[1])
end

##### Move and Reorder array content. #####

function vec{T,N}(a::AFArray{T,N})
  out = af_array[0]
  af_flat(out, a)
  AFArray{T,1}(out[1])
end

function flip{T,N}(a::AFArray{T,N}, dim::Int)
  (0 < dim <= N) || throw("Invalid dimension: $(dim).")
  out = af_array[0]
  af_flip(out, a, dim-1)
  AFArray{T,N}(out[1])
end

function cat{T,N}(dim::Int, as::Vector{AFArray{T,N}})
  (0 < dim <= N) || throw("Invalid dimension: $(dim).")
  (0 < length(as) <= 100) || throw("Invalid input: $(as).")
  out = af_array[0]
  ps = map(a -> a, as)
  af_join_many(out, dim-1, length(ps), ps)
  AFArray{T,N}(out[1])
end

function reshape{T,N}(a::AFArray{T}, dims::NTuple{N,Int})
  out = af_array[0]
  dims = dim_t[dims...]
  af_moddims(out, a, N, dims)
  AFArray{T,N}(out[1])
end
reshape{T}(a::AFArray{T}, dims...) = reshape(a, dims)

function reorder{T,N}(a::AFArray{T,N}, x::Int, y::Int, z::Int, w::Int)
  out = af_array[0]
  af_reorder(out, a, Cuint(x), Cuint(y), Cuint(z), Cuint(w))
  AFArray{T,N}(out[1])
end

# af_replace
# af_select

function shift{T,N}(a::AFArray{T,N})
  # af_shift
  error("Not implemented yet.")
end

function tile{T,N}(a::AFArray{T,N})
  # af_tile
  error("Not implemented yet.")
end

function transpose{T}(a::AFMatrix{T}; conjugate::Bool=false)
  out = af_array[0]
  af_transpose(out, a, conjugate)
  AFMatrix{T}(out[1])
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
function lookup{T,N}(a::AFArray{T,N}, indices::AFArray{Int}, dim::Int)
  out = af_array[0]
  af_lookup(out, a, indices, dim-1)
  AFArray{T,N}(out[1])
end
