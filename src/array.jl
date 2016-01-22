type AFArray{T,N}
  ptr::Ptr{Void}
end

function AFArray{T,N}(::Type{T}, dims::NTuple{N,Int})
  p = af_array[0]
  dims = dim_t[dims...]
  af_create_handle(p, N, dims, dtype(T))
  a = AFArray{T,N}(p[1])
  finalizer(a, release)
  a
end
AFArray{T}(::Type{T}, dims...) = AFArray(T, dims)

show(io::IO, a::AFArray) = show(io, to_host(a))

function device_info()
  name = UInt8[0,0,0,0,0,0,0,0,0,0]
  platform = UInt8[0,0,0,0,0,0,0,0,0,0]
  toolkit = UInt8[0,0,0,0,0,0,0,0,0,0]
  compute = UInt8[0,0,0,0,0,0,0,0,0,0]
  af_device_info(name, platform, toolkit, compute)
  convert(ASCIIString, compute)
end

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
  out = af_array[0]
  xs = map(x -> x.ptr, inputs)
  af_join_many(out, dim, length(inputs), xs)
  a = AFArray{T,N}(out[1])
  finalizer(a, release)
  a
end

"TODO: make AF_MAT_NONE variable"
function dot{T,N}(x::AFArray{T,N}, y::AFArray{T,N})
  out = af_array[0]
  af_dot(out, x.ptr, y.ptr, AF_MAT_NONE, AF_MAT_NONE)
  AFArray{T,N}(out[1])
end

function mult{T}(A::AFArray{T,2}, B::AFArray{T,2}; tA=AF_MAT_NONE, tB=AF_MAT_NONE)
  out = af_array[0]
  af_matmul(out, A.ptr, B.ptr, tA, tB)
  AFArray{T,2}(out[1])
end
*(A::AFArray, B::AFArray) = mult(A, B)
multNT(A, B) = mult(A, B, AF_MAT_NONE, AF_MAT_TRANS)
multTN(A, B) = mult(A, B, AF_MAT_TRANS, AF_MAT_NONE)
multTT(A, B) = mult(A, B, AF_MAT_TRANS, AF_MAT_TRANS)

function device_mem_info(a::AFArray)
  alloc_bytes = Csize_t[0]
  alloc_buffers = Csize_t[0]
  lock_bytes = Csize_t[0]
  lock_buffers = Csize_t[0]
  af_device_mem_info(alloc_bytes, alloc_buffers, lock_bytes, lock_buffers)
  Int(alloc_bytes[1]), Int(alloc_buffers[1]), Int(lock_bytes[1]), Int(lock_buffers[1])
end
