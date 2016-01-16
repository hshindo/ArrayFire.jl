push!(LOAD_PATH, "/home/shindo")
workspace()
using Cxx
using ArrayFire
using Base.Test

x = ArrayFire.rand(Float32, 10, 5)


# write your own tests here
@test 1 == 1
