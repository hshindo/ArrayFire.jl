type AFArray{T,N}
  ptr::Ptr{Void}

  function AFArray(ptr::Ptr{Void})
    a = new(ptr)
    finalizer(a, release)
    a
  end
end

typealias AFVector{T} AFArray{T,1}
typealias AFMatrix{T} AFArray{T,2}

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
  af_get_dims(pointer(dims,1), pointer(dims,2), pointer(dims,3), pointer(dims,4), a.ptr)
  N == 1 && return (dims[1],)
  N == 2 && return (dims[1], dims[2])
  N == 3 && return (dims[1], dims[2], dims[3])
  N == 4 && return (dims[1], dims[2], dims[3], dims[4])
end

function length(a::AFArray)
  p = dim_t[0]
  af_get_elements(p, a.ptr)
  Int(p[1])
end

eltype{T}(a::AFArray{T}) = T
ndims{_,N}(a::AFArray{_,N}) = N
similar{T,N}(a::AFArray{T,N}) = AFArray(T, size(a))

##### Methods of array class #####

function copy{T,N}(a::AFArray{T,N})
  p = af_array[0]
  af_copy_array(p, a.ptr)
  AFArray{T,N}(p[1])
end

eval(a::AFArray) = af_eval(a.ptr)

function to_host{T,N}(a::AFArray{T,N})
  host = Array(T, size(a))
  af_get_data_ptr(host, a.ptr)
  host
end

function refcount(a::AFArray)
  p = Int32[0]
  af_get_data_ref_count(p, a.ptr)
  Int(p[1])
end

release(a::AFArray) = af_release_array(a.ptr)

function retain{T,N}(a::AFArray{T,N})
  p = af_array[0]
  af_retain_array(p, a.ptr)
  AFArray{T,N}(p[1])
end

function write(a::AFArray, data)
  error("Not implemented yet.")
  #af_write_array
end

##### Functions to create arrays. #####

function eye{T,N}(::Type{AFArray{T}}, dims::NTuple{N,Int})
  p = af_array[0]
  dims = dim_t[dims...]
  af_identity(p, length(dims), dims, dtype(T))
  AFArray{T,N}(p[1])
end
eye{T}(::Type{AFArray{T}}, dims...) = eye(T, dims)

function iota{T,N}(::Type{AFArray{T}}, dims::NTuple{N,Int}, tdims::NTuple{N,Int})
  p = af_array[0]
  dims = dim_t[dims...]
  tdims = dim_t[tdims...]
  af_iota(p, length(dims), dims, length(tdims), tdims, dtype(T))
  AFArray{T,N}(p[1])
end

function rand{T,N}(::Type{AFArray{T}}, dims::NTuple{N,Int})
  p = af_array[0]
  dims = dim_t[dims...]
  af_randu(p, length(dims), dims, dtype(T))
  AFArray{T,N}(p[1])
end
rand{T}(::Type{AFArray{T}}, dims...) = rand(AFArray{T}, dims)

function randn{T,N}(::Type{AFArray{T}}, dims::NTuple{N,Int})
  p = af_array[0]
  dims = dim_t[dims...]
  af_randn(p, length(dims), dims, dtype(T))
  AFArray{T,N}(p[1])
end
randn{T}(::Type{AFArray{T}}, dims...) = randn(AFArray{T}, dims)

function range{T,N}(::Type{AFArray{T}}, dims::NTuple{N,Int}, seqdim::Int)
  p = af_array[0]
  dims = dim_t[dims...]
  af_range(p, length(dims), dims, seqdim, dtype(T))
  AFArray{T,N}(p[1])
end

##### Helper functions for arrays. #####

function cast{T,U}(a::AFArray{T}, ::Type{U})
  p = af_array[0]
  af_cast(p, a.ptr, dtype(U))
  AFArray{T,N}(p[1])
end

##### others

function cat{T,N}(dim::Int, inputs::Vector{AFArray{T,N}})
  (dim > 0 && dim <= N) || error("Invalid dimension: $dim.")
  out = af_array[0]
  xs = map(x -> x.ptr, inputs)
  af_join_many(out, dim-1, length(inputs), xs)
  AFArray{T,N}(out[1])
end

##### assignment
function lookup{T,N}(a::AFArray{T,N}, indices::AFArray{Int}, dim::Int)
  p = af_array[0]
  af_lookup(p, a.ptr, indices.ptr, dim-1)
  AFArray{T,N}(p[1])
end
