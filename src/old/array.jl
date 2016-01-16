abstract AFAbstractArray{T} <: AbstractArray{T,4}

import Base: rand, show, randn, ones, diag, eltype, size, elsize,
  sizeof, length, showarray, convert, ndims

type AFArray{T} <: AFAbstractArray{T}
  array::vcpp"af::array"
end

type AFSubArray{T} <: AFAbstractArray{T}
  array::vcpp"af::array::array_proxy"
end

function convert{T}(::Type{Array{T}}, x::AFAbstractArray{T})
    ret = Array(UInt8, sizeof(x))
    icxx"$x.host($(pointer(ret)));"
    ret = reinterpret(T, ret)
    reshape(ret, size(x))
end

Cxx.cppconvert{T}(x::AFAbstractArray{T}) = x.array

eltype{T}(x::AFAbstractArray{T}) = T
backend_eltype(x::AFAbstractArray) = jltype(icxx"$x.type();")
sizeof{T}(a::AFAbstractArray{T}) = elsize(a) * length(a)

function showarray{T}(io::IO, a::AFAbstractArray{T}; header::Bool=true, kwargs...)
  header && print(io, summary(a))
  !isempty(a) && println(io, ":")
  showarray(io, convert(Array{T},a); header = false, kwargs...)
end

af_print(a::AFAbstractArray) = icxx"""af::print("", $a);"""

ndims(a::AFAbstractArray) = Int(icxx"$a.dims().ndims();")

dim4(dims::NTuple{1,Int}) = icxx"af::dim4($(dims[1]));"
dim4(dims::NTuple{2,Int}) = icxx"af::dim4($(dims[1]),$(dims[2]));"
dim4(dims::NTuple{3,Int}) = icxx"af::dim4($(dims[1]),$(dims[2]),$(dims[3]));"
dim4(dims::NTuple{4,Int}) = icxx"af::dim4($(dims[1]),$(dims[2]),$(dims[3]),$(dims[4]));"

function dim4_to_dims(dim4)
    d = icxx"$dim4.ndims();"
    t = (Int(icxx"(int)$dim4[0];"),)
    d == 1 && return t
    t = tuple(t...,Int(icxx"(int)$dim4[1];"))
    d == 2 && return t
    t = tuple(t...,Int(icxx"(int)$dim4[2];"))
    d == 3 && return t
    t = tuple(t...,Int(icxx"(int)$dim4[3];"))
    d == 4 && return t
    error("Bad dim4 object")
end

function size(a::AFAbstractArray)
  n = Int(icxx"$a.dims().ndims();")
  if n == 1
    (size(a,1),)
  elseif n == 2
    (size(a,1), size(a,2))
  elseif n == 3
    (size(a,1), size(a,2), size(a,3))
  elseif n == 4
    (size(a,1), size(a,2), size(a,3), size(a,4))
  else
    error("Bad dim4 object")
  end
end
size(a::AFAbstractArray, dim::Int) = Int(icxx"$a.dims($(dim-1));")

rand{T}(::Type{AFArray{T}}, dims...) = AFArray{T}(icxx"af::randu($(dim4(dims)),$(aftype(T)));")
randn{T}(::Type{AFArray{T}}, dims...) = AFArray{T}(icxx"af::randn($(dim4(dims)),$(aftype(T)));")
#eye{T}(::Type{AFArray{T}}, dims...) = AFArray{T}(icxx"af::identity($(dims_to_dim4(dims)),$(aftype(T)));")
#diag{T}(x::AFArray{T}, k = 0) = AFArray{T}(icxx"af::diag($(dims_to_dim4(dims)),$k);");
