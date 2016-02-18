push!(LOAD_PATH, joinpath(dirname(@__FILE__), "../.."))
push!(LOAD_PATH, joinpath(dirname(@__FILE__), "..", "deps"))
workspace()
using ArrayFire
using Base.Test
using Base.LinAlg.BLAS

available_backends()
setbackend("cpu")

function getraw(in::AFArray)
  p = device_ptr(in)
  pp = convert(Ptr{Float32}, p)
  pointer_to_array(pp, jl_size(in))
end

x = rand(10, 5)
pointer(x)

a = rand(Float32, 50, 50) |> AFArray
b = rand(Float32, 50, 50) |> AFArray
aa = getraw(a)
bb = getraw(b)

axpy!(0.1f0, aa, bb)
bb

p = device_ptr(a)
pp = convert(Ptr{Float32}, p)
aa = pointer_to_array(pp, (10,5))

p = nothing
finalize(a)

b = rand(Float32, 10, 5)  |> AFArray
a += b
size(a)

a = ArrayFire.af_seq(1.0, 3.0, 1.0)
ArrayFire.af_index_t(a, true, true)
lhs = rand(AFArray, Float32, 10)
rhs = rand(AFArray, Float32, 10)
ArrayFire.assign(lhs, rhs)

ArrayFire.create_indexers()
x = [1,2,3] |> AFArray
x = range(AFArray, Int, 5)
x = rand(Float32,5,4) |> AFArray
i = [3:15] |> AFArray
r = [3.0f0] |> AFArray
ArrayFire.assign(i, x, r)

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
