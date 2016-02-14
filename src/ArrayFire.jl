module ArrayFire

export AFArray
# array.jl
export to_host, cast, lookup, available_backends, setbackend
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
include("libaf.jl")
include("array.jl")
include("device.jl")
include("math.jl")
include("vector.jl")
include("image.jl")

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

end
