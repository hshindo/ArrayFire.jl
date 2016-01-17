type AFArray{T,N}
  ptr
  dims::NTuple{N,Int}
end

function AFArray{T,N}(::Type{T}, dims::NTuple{N,Int})
  ptr = @cxx af::array(dims..., aftype(T))
  AFArray{T,N}(ptr, dims)
end
AFArray{T}(::Type{T}, dims...) = AFArray(T, dims)

Base.eltype{T,_}(a::AFArray{T,_}) = T
Base.ndims{_,N}(a::AFArray{_,N}) = Int(@cxx a.ptr->numdims())
Base.length(a::AFArray) = prod(a.dims)
Base.size(a::AFArray, dim::Int) = a.dims[dim]
Base.size(a::AFArray) = a.dims
Base.show(io::IO, a::AFArray) = show(io, to_host(a))

function rand{T}(::Type{T}, dims...)
  ptr = @cxxnew af::randu(dims..., aftype(T))
  AFArray{T,length(dims)}(ptr, dims)
end
function randn{T}(::Type{T}, dims...)
  ptr = @cxxnew af::randn(dims..., aftype(T))
  AFArray{T,length(dims)}(ptr, dims)
end

function to_host{T}(a::AFArray{T})
  dest = Array(T, size(a))
  @cxx a.ptr->host(pointer(dest))
  dest
end

"""
Move and Reorder array content
"""

function join(dim::Int, as::AFArray...)
  ptr = @cxx af::join(dim, as...)
end
