push!(LOAD_PATH, "/home/shindo")
workspace()
using Cxx
using ArrayFire
using Base.Test

r = rand(AFArray{Float32}, 10, 5)
ArrayFire.size(r)

# write your own tests here
@test 1 == 1
