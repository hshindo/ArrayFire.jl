module ArrayFire

import Base:
  unsafe_convert, show, size, length, eltype, ndims, zeros, similar, eye, fill, rand, randn,
  vec, cat, reshape, transpose
import Base:
  +, -, *, .*, dot, A_mul_Bt, At_mul_B, At_mul_Bt,
  exp, expm1, log, log10, log1p, sqrt, tanh, abs, ceil, floor, round, sign, trunc,
  >=, >, <=, <
import Base: findmax, maximum, sum

export AFArray, AFVector, AFMatrix
export lookup
export device_info, device_ptr, device_mem_info, release

# image.jl
export unwrap, wrap

global af_buffer = []

@windows? (
begin
  #const libaf = Libdl.find_library(["afcpu"])
  const libaf = abspath(joinpath(dirname(@__FILE__), "..", "deps", "afcpu"))
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

function jltype(dtype::af_dtype)
  dtype == f32 && return Float32
  dtype == c32 && return Complex{Float32}
  dtype == f64 && return Float64
  dtype == c64 && return Complex{Float64}
  dtype == b8 && return Bool
  dtype == s32 && return Int32
  dtype == u32 && return UInt32
  dtype == u8 && return UInt8
  dtype == s64 && return Int64
  dtype == u64 && return UInt64
  throw("dtype no match")
end

function checkerror(err)
  if err != AF_SUCCESS
    throw(Int(err))
  end
end

include("libaf.jl")

include("array.jl")
include("device.jl")
include("math.jl")
include("vector.jl")
include("image.jl")

end
