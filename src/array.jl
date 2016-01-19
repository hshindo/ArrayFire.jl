type AFArray{T,N}
  ptr
end

function AFArray{T,N}(::Type{T}, dims::NTuple{N,Int})
  a = af_array[0]
  dims = dim_t[dims...]
  af_create_handle(a, N, dims, dtype(T))
  finalizer(a, )
  AFArray{T,N}(a[1])
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

function ndims(a::AFArray)
  result = UInt32[0]
  af_get_numdims(result, a.ptr)
  Int(result[1])
end

eltype{T}(a::AFArray{T}) = T


function to_host{T,N}(a::AFArray{T,N})
  ret = Array(T, size(a))
  af_get_data_ptr(pointer(ret), a.ptr)
  ret
end

function free(a::AFArray)
  af_free_device(a.ptr)
end

#function free{T}(p::CudaPtr{T})
#    cnull = unsafe_convert(Ptr{T}, C_NULL)
#    if p.ptr != cnull && haskey(cuda_ptrs, p)
#        delete!(cuda_ptrs, p)
#        rt.cudaFree(p)
#        p.ptr = cnull
#    end
#end

function rand{T,N}(::Type{AFArray{T}}, dims::NTuple{N,Int})
  out = af_array[0]
  dims = dim_t[dims...]
  af_randu(out, length(dims), dims, dtype(T))
  #finalizer(out, free)
  AFArray{T,N}(out[1])
end
rand{T}(::Type{AFArray{T}}, dims...) = rand(AFArray{T}, dims)

function randn{T,N}(::Type{AFArray{T}}, dims::NTuple{N,Int})
  out = af_array[0]
  dims = dim_t[dims...]
  af_randn(out, length(dims), dims, dtype(T))
  #finalizer(out, free)
  AFArray{T,N}(out[1])
end
randn{T}(::Type{AFArray{T}}, dims...) = randn(AFArray{T}, dims)
