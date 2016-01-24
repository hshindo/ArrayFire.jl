module ArrayFire

export AFArray, AFVector, AFMatrix
export matmul, matmulNT, matmulTN, matmulTT, lookup, device_info, flat
export device_ptr, device_mem_info

import Base: show, length, size, ndims, rand, randn, cat, dot, .*, *, +, -, similar, lock, unlock, transpose, transpose!

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

function checkerror(err)
  if err != AF_SUCCESS
    throw(err)
  end
end

include("libaf.jl")

include("array.jl")
include("device.jl")
include("math.jl")

end
