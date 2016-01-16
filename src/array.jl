type AFArray{T,N}
  ptr
  dims::NTuple{N,Int}
end

AFArray{T}(::Type{T}, ptr, dims) = AFArray{T,length(dims)}(ptr, dims)
AFArray{T}(::Type{T}, dims...) = AFArray(T, @cxxnew af::array(dims..., aftype(T)), dims)

Base.ndims{_,N}(a::AFArray) = N
Base.eltype{T,_}(a::AFArray{T,_}) = T
Base.length(a::AFArray) = prod(a.dims)
Base.size(a::AFArray, dim::Int) = a.dims[dim]
Base.size(a::AFArray) = a.dims

rand{T}(::Type{T}, dims...) = AFArray(T, @cxxnew af::randu(dims..., aftype(T)), dims)
randn{T}(::Type{T}, dims...) = AFArray(T, @cxxnew af::randn(dims..., aftype(T)), dims)

function to_host(a::AFArray)
  ret = Array(T, length(a))

end

function convert{T}(::Type{Array{T}}, a::AFArray{T})
    #ret = Array(UInt8, sizeof(a))
    #icxx"$x.host($(pointer(ret)));"
    #ret = reinterpret(T, ret)
    #ret = reshape(ret, size(a))
    #ret
end
