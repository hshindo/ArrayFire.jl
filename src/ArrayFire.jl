module ArrayFire

export AFArray, AFVector, AFMatrix
export matmul, matmulNT, matmulTN, matmulTT, lookup, device_info, flat
export device_ptr, device_mem_info, cat_many
export arg

import Base:
  show, length, size, ndims, rand, randn, cat, dot, .*, *, +, -, ⋅,
  similar, lock, unlock, transpose, transpose!, unsafe_convert, fill,
  exp, expm1, log, log10, log1p, sqrt, tanh, abs, ceil, floor, round, sign, trunc,
  cumsum

@windows? (
begin
  const libaf = Libdl.find_library(["af"])
end : begin
  const libaf = Libdl.find_library(["libaf"])
end)
!isempty(libaf) || error("ArrayFire library cannot be found.")

include("types.jl")

dtype(::Type{Float32}) = f32
dtype(::Type{Complex{Float32}}) = c32
dtype(::Type{Float64}) = f64
dtype(::Type{Complex{Float64}}) = c64
dtype(::Type{Bool}) = b8
dtype(::Type{Int32}) = s32
dtype(::Type{UInt32}) = u32
dtype(::Type{UInt8}) = u8
dtype(::Type{Int64}) = s64
dtype(::Type{UInt64}) = u64
dtype(::Type{Int16}) = s16
dtype(::Type{UInt16}) = u16

jltypes = begin
  d = Dict()
  for T in [Float32,Complex{Float32},Float64,Complex{Float64},Bool,Int32,UInt32,UInt8,Int64,UInt64,Int16,UInt16]
    d[dtype(T)] = T
  end
  d
end


function checkerror(err)
  if err != AF_SUCCESS
    throw(err)
  end
end

include("libaf.jl")

include("array.jl")
include("device.jl")
include("math.jl")
include("vector.jl")

end
