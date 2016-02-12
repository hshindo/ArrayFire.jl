module ArrayFire

import Base:
  unsafe_convert, show, size, length, eltype, ndims, zeros, similar, eye, fill, rand, randn,
  vec, cat, reshape, transpose
import Base:
  +, -, *, .*, dot, A_mul_Bt, At_mul_B, At_mul_Bt,
  exp, expm1, log, log10, log1p, sqrt, tanh, abs, ceil, floor, round, sign, trunc,
  >=, >, <=, <
import Base: findmax, maximum, sum

export AFArray
export lookup, available_backends, setbackend, logsoftmax, free_device, lock_device_ptr, unlock_device_ptr
export device_info, device_ptr, device_mem_info, release, mem_stepsize, set_mem_stepsize

# image.jl
export unwrap, wrap

@windows? (
begin
  const libaf = Libdl.find_library(["af"])
  #const libaf = abspath(joinpath(dirname(@__FILE__), "..", "deps", "af"))
end : begin
  error("")
  const libaf = Libdl.find_library(["libaf"])
end)
#!isempty(libaf) || error("ArrayFire library cannot be found.")

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
