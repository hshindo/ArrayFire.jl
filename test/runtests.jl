push!(LOAD_PATH, joinpath(dirname(@__FILE__), "../.."))
workspace()
using ArrayFire
using Base.Test

function bench()
  for i = 1:1000
    a = AFArray(Float32, 100, 100, 30)
  end
end

@time bench()

# write your own tests here
@test 1 == 1
