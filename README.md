# ArrayFire.jl

Julia bindings for ArrayFire.

Currently, C interface on ArrayFire is used.
When Cxx.jl becomes mature, C++ interface will be used instead.

## Basic Usage
`AFArray{T,N}` is a simple wrapper type of `array` class on the original ArrayFire.
Function names may be changed to be consistent with `Array{T,N}` in Julia.
```julia
using ArrayFire
a = rand(AFArray{Float32}, 10, 5)
b = randn(AFArray{Float32}, 10, 5)
c = a + b
exp(c)
sum(c, 1)
```
