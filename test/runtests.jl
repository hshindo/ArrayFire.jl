push!(LOAD_PATH, joinpath(dirname(@__FILE__), "../.."))
push!(LOAD_PATH, joinpath(dirname(@__FILE__), "..", "deps"))
workspace()
using ArrayFire
using Base.Test

available_backends()
setbackend("cpu")

x = rand(Float32,10,5) |> AFArray(x)


xs = [rand(Float32,10,5) |> AFArray for i=1:300]
cat(xs, 2)

x = rand(Float32, 10, 5)
xx = AFArray(x)
xxx = AFArray(x)
x[1] = 1.0

x = rand(AFArray{Float32}, 10, 5)

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
