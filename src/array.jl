type AFArray{T,N}
  ptr::af_array

  function AFArray(ptr)
    a = new(ptr)
    finalizer(a, release)
    a
  end
end

typealias AFVector{T} AFArray{T,1}
typealias AFMatrix{T} AFArray{T,2}

unsafe_convert(::Type{af_array}, a::AFArray) = a.ptr

function AFArray{T,N}(::Type{T}, dims::NTuple{N,Int})
  p = af_array[0]
  dims = dim_t[dims...]
  af_create_handle(p, N, dims, dtype(T))
  AFArray{T,N}(p[1])
end
AFArray{T}(::Type{T}, dims...) = AFArray(T, dims)

function AFArray{T,N}(::Type{T}, value::Float64, dims::NTuple{N,Int})
  p = af_array[0]
  dims = dim_t[dims...]
  af_constant(p, value, N, dims, dtype(T))
  AFArray{T,N}(p[1])
end
AFArray{T}(::Type{T}, value::Float64, dims...) = AFArray(T, value, dims)

function AFArray{T,N}(data::Array{T,N})
  p = af_array[0]
  dims = dim_t[size(data)...]
  af_create_array(p, data, N, dims, dtype(T))
  AFArray{T,N}(p[1])
end

show(io::IO, a::AFArray) = show(io, to_host(a))

function size{_,N}(a::AFArray{_,N})
  dims = dim_t[0, 0, 0, 0]
  af_get_dims(pointer(dims,1), pointer(dims,2), pointer(dims,3), pointer(dims,4), a)
  N == 1 && return (dims[1],)
  N == 2 && return (dims[1], dims[2])
  N == 3 && return (dims[1], dims[2], dims[3])
  N == 4 && return (dims[1], dims[2], dims[3], dims[4])
end

function length(a::AFArray)
  p = dim_t[0]
  af_get_elements(p, a)
  Int(p[1])
end

eltype{T}(a::AFArray{T}) = T
ndims{_,N}(a::AFArray{_,N}) = N
similar{T,N}(a::AFArray{T,N}) = AFArray(T, size(a))

##### Methods of array class #####

function copy{T,N}(a::AFArray{T,N})
  p = af_array[0]
  af_copy_array(p, a)
  AFArray{T,N}(p[1])
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
  af_identity(p, N, dims, dtype(T))
  AFArray{T,N}(p[1])
end
eye{T}(::Type{AFArray{T}}, dims...) = eye(T, dims)

function iota{T,N}(::Type{AFArray{T}}, dims::NTuple{N,Int}, tdims::NTuple{N,Int})
  p = af_array[0]
  dims = dim_t[dims...]
  tdims = dim_t[tdims...]
  af_iota(p, N, dims, N, tdims, dtype(T))
  AFArray{T,N}(p[1])
end

function rand{T,N}(::Type{AFArray{T}}, dims::NTuple{N,Int})
  p = af_array[0]
  dims = dim_t[dims...]
  af_randu(p, N, dims, dtype(T))
  AFArray{T,N}(p[1])
end
rand{T}(::Type{AFArray{T}}, dims...) = rand(AFArray{T}, dims)

function randn{T,N}(::Type{AFArray{T}}, dims::NTuple{N,Int})
  p = af_array[0]
  dims = dim_t[dims...]
  af_randn(p, N, dims, dtype(T))
  AFArray{T,N}(p[1])
end
randn{T}(::Type{AFArray{T}}, dims...) = randn(AFArray{T}, dims)

function range{T,N}(::Type{AFArray{T}}, dims::NTuple{N,Int}, seqdim::Int)
  p = af_array[0]
  dims = dim_t[dims...]
  af_range(p, N, dims, seqdim, dtype(T))
  AFArray{T,N}(p[1])
end

##### Helper functions for arrays. #####

function cast{T,U}(a::AFArray{T}, ::Type{U})
  p = af_array[0]
  af_cast(p, a, dtype(U))
  AFArray{T,N}(p[1])
end

##### Move and Reorder array content. #####

function vec{T,N}(a::AFArray{T,N})
  p = af_array[0]
  af_flat(p, a)
  AFArray{T,1}(p[1])
end

function flip{T,N}(a::AFArray{T,N}, dim::Int)
  (0 < dim <= N) || error("Invalid dimension: $(dim).")
  p = af_array[0]
  af_flip(p, a, dim-1)
  AFArray{T,N}(p[1])
end

function cat{T,N}(dim::Int, as::Vector{AFArray{T,N}})
  (0 < dim <= N) || error("Invalid dimension: $(dim).")
  p = af_array[0]
  ps = map(a -> a, as)
  af_join_many(p, dim-1, length(ps), ps)
  AFArray{T,N}(p[1])
end
#cat{T,N}(dim::Int, as::AFArray{T,N}...) = cat(dim, AFArray[as...])

function reshape{T,N}(a::AFArray{T}, dims::NTuple{N,Int})
  p = af_array[0]
  dims = dim_t[dims...]
  af_moddims(p, a, N, dims)
  AFArray{T,N}(p[1])
end
reshape{T}(a::AFArray{T}, dims...) = reshape(a, dims)

function reorder{T,N}(a::AFArray{T,N}, x::Int, y::Int, z::Int, w::Int)
  p = af_array[0]
  af_reorder(p, a, Cuint(x), Cuint(y), Cuint(z), Cuint(w))
  AFArray{T,N}(p[1])
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
  p = af_array[0]
  af_transpose(p, a, conjugate)
  AFArray{T,2}(p[1])
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
  p = af_array[0]
  af_lookup(p, a, indices, dim-1)
  AFArray{T,N}(p[1])
end
