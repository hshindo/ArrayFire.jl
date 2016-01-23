type AFArray{T,N}
  ptr::Ptr{Void}
end

typealias AFVector{T} AFArray{T,1}
typealias AFMatrix{T} AFArray{T,2}

function AFArray{T,N}(::Type{T}, dims::NTuple{N,Int})
  p = af_array[0]
  dims = dim_t[dims...]
  af_create_handle(p, N, dims, dtype(T))
  a = AFArray{T,N}(p[1])
  finalizer(a, release)
  a
end
AFArray{T}(::Type{T}, dims...) = AFArray(T, dims)

function AFArray{T,N}(::Type{T}, value::Float64, dims::NTuple{N,Int})
  p = af_array[0]
  dims = dim_t[dims...]
  af_constant(p, value, N, dims, dtype(T))
  a = AFArray{T,N}(p[1])
  finalizer(a, release)
  a
end
AFArray{T}(::Type{T}, value::Float64, dims...) = AFArray(T, value, dims)

function AFArray{T,N}(data::Array{T,N})
  p = af_array[0]
  dims = dim_t[size(data)...]
  af_create_array(p, data, N, dims, dtype(T))
  a = AFArray{T,N}(p[1])
  finalizer(a, release)
  a
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
  elems = dim_t[0]
  af_get_elements(elems, a.ptr)
  elems[1]
end

eltype{T}(a::AFArray{T}) = T
ndims{_,N}(a::AFArray{_,N}) = N

function numdims(ptr::af_array)
  result = UInt32[0]
  af_get_numdims(result, ptr)
  Int(result[1])
end

similar{T,N}(a::AFArray{T,N}) = AFArray(T, size(a))

function to_host{T,N}(a::AFArray{T,N})
  ret = Array(T, size(a))
  af_get_data_ptr(pointer(ret), a.ptr)
  ret
end

function rand{T,N}(::Type{AFArray{T}}, dims::NTuple{N,Int})
  out = af_array[0]
  dims = dim_t[dims...]
  af_randu(out, length(dims), dims, dtype(T))
  a = AFArray{T,N}(out[1])
  finalizer(a, release)
  a
end
rand{T}(::Type{AFArray{T}}, dims...) = rand(AFArray{T}, dims)

function randn{T,N}(::Type{AFArray{T}}, dims::NTuple{N,Int})
  out = af_array[0]
  dims = dim_t[dims...]
  af_randn(out, length(dims), dims, dtype(T))
  a = AFArray{T,N}(out[1])
  finalizer(out, release)
  a
end
randn{T}(::Type{AFArray{T}}, dims...) = randn(AFArray{T}, dims)

release(a::AFArray) = af_release_array(a.ptr)

function refcount(a::AFArray)
  count = Int32[0]
  af_get_data_ref_count(count, a.ptr)
  count[1]
end

function cat{T,N}(dim::Int, inputs::Vector{AFArray{T,N}})
  (dim > 0 && dim <= N) || error("Invalid dimension: $dim.")
  out = af_array[0]
  xs = map(x -> x.ptr, inputs)
  af_join_many(out, dim-1, length(inputs), xs)
  a = AFArray{T,N}(out[1])
  finalizer(a, release)
  a
end

##### assignment
function lookup(a::AFArray, indices::AFArray, dim::Int)
  p = af_array[0]
  af_lookup(p, a, indices, dim)
  a = AFArray{T,N}(p[1])
  finalizer(a, release)
  a
end

##### Functions to create and modify Arrays #####
#af_copy_array
#af_get_data_ref_count
#af_write_array
#af_get_data_ptr
#af_release_array
#af_retain_array
#af_eval
