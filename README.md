# ArrayFire.jl

Julia bindings for ArrayFire.

Currently, C interface on ArrayFire is used.
When Cxx.jl becomes mature, C++ interface will be used instead.

## Basic Usage
`AFArray{T,N}` is a simple wrapper of `array` class on ArrayFire.
Function names may be changed according to naming rules of the base module in Julia.
```julia
a = rand(AFArray{Float32}, 10, 5)
b = randn(AFArray{Float32}, 10, 5)
c = a + b
```
