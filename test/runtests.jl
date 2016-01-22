push!(LOAD_PATH, joinpath(dirname(@__FILE__), "../.."))
workspace()
using ArrayFire
using Base.Test

x1 = rand(AFArray{Float32}, 10, 5)
x2 = rand(AFArray{Float32}, 10, 5)
cat(2, [x1,x2])

tests = ["array"]

for t in tests
    path = joinpath(dirname(@__FILE__), "$t.jl")
    println("$path ...")
    include(path)
end
