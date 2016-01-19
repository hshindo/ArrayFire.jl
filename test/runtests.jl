push!(LOAD_PATH, joinpath(dirname(@__FILE__), "../.."))
workspace()
using ArrayFire
using Base.Test

a = AFArray(Float32, 100, 100, 30)
ArrayFire.refcount(a)
a = 1
gc()


function bench()
  for i = 1:1000
    a = AFArray(Float32, 100, 100, 30)
  end
end
gc()
@time bench()

# write your own tests here
@test 1 == 1
