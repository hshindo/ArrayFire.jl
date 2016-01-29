push!(LOAD_PATH, joinpath(dirname(@__FILE__), "../.."))
workspace()
using ArrayFire
using Base.Test

ArrayFire.available_backends()

x = rand(AFArray{Float32}, 10, 5)
sum(x,0)

v, i = findmax(x, 1)
v
i

function bench()
  x = rand(AFArray{Float32}, 10, 5, 2, 3)
  for i = 1:10000
    #x = rand(AFArray{Float32}, 100, 10, 10)
    a = af_length(x)
    #unlock(x)
  end
end
gc()
@time bench()

x1 = AFArray(Float32, 1.0, (10, 5))
x1 = rand(AFArray{Float32}, 10, 5)
x2 = rand(AFArray{Float32}, 10, 5)
cat(0, [x1,x2])

tests = ["array"]

for t in tests
    path = joinpath(dirname(@__FILE__), "$t.jl")
    println("$path ...")
    include(path)
end
