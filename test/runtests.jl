push!(LOAD_PATH, "/home/shindo")
workspace()
using Cxx
using ArrayFire
using Base.Test

include("wrap.jl")

# write your own tests here
@test 1 == 1
