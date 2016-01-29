module ArrayFire

import Base:
  show, size, length, eltype, ndims, similar, eye, fill, rand, randn,
  vec, cat, reshape, transpose,
  +, -, *, .*, dot, A_mul_Bt, At_mul_B, At_mul_Bt,
  exp, expm1, log, log10, log1p, sqrt, tanh, abs, ceil, floor, round, sign, trunc

export AFArray, AFVector, AFMatrix
export matmul, matmulNT, matmulTN, matmulTT, lookup, device_info, flat
export device_ptr, device_mem_info, cat_many

@windows? (
begin
  const libaf = Libdl.find_library(["af"])
end : begin
  const libaf = Libdl.find_library(["libaf"])
end)
!isempty(libaf) || error("ArrayFire library cannot be found.")

include("types.jl")

aftype(::Type{Float32}) = f32
aftype(::Type{Complex{Float32}}) = c32
aftype(::Type{Float64}) = f64
aftype(::Type{Complex{Float64}}) = c64
aftype(::Type{Bool}) = b8
aftype(::Type{Int32}) = s32
aftype(::Type{UInt32}) = u32
aftype(::Type{UInt8}) = u8
aftype(::Type{Int64}) = s64
aftype(::Type{UInt64}) = u64
aftype(::Type{Int16}) = s16
aftype(::Type{UInt16}) = u16

function jltype(dtype)
  dtype == f32 && Float32
  dtype == c32 && Complex{Float32}
  dtype == f64 && Float64
  dtype == c64 && Complex{Float64}
  dtype == b8 && Bool
  dtype == s32 && Int32
  dtype == u32 && UInt32
  dtype == u8 && UInt8
  dtype == s64 && Int64
  dtype == u64 && UInt64
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
