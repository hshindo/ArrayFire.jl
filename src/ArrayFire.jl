module ArrayFire

export AFArray
using Cxx
#using Base.Meta

import Cxx: CppEnum

Libdl.dlopen("/usr/local/lib/libaf.so")
addHeaderDir("/usr/local/include", kind=C_System)

cxx"#include <arrayfire.h>"

setDevice(i) = icxx"af::setDevice($i);"

const f32 = CppEnum{:af_dtype}(0)
const c32 = CppEnum{:af_dtype}(1)
const f64 = CppEnum{:af_dtype}(2)
const c64 = CppEnum{:af_dtype}(3)
const b8  = CppEnum{:af_dtype}(4)
const s32 = CppEnum{:af_dtype}(5)
const u32 = CppEnum{:af_dtype}(6)
const u8  = CppEnum{:af_dtype}(7)
const s64 = CppEnum{:af_dtype}(8)
const u64 = CppEnum{:af_dtype}(9)

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

include("array.jl")

end
