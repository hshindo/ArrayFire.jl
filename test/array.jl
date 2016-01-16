x = ArrayFire.rand(Float32, 10, 5)
@test length(x) == 50
@test size(x) == (10,5)
@test size(x,1) == 10
@test size(x,2) == 5
eltype(x) == Float32
