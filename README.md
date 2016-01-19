# ArrayFire.jl

Julia bindings for ArrayFire

Currently, it uses C interface of ArrayFire. When Cxx.jl becomes mature, C++ interface will be used instead.

## Basic Usage
`AFArray{T,N}` is a simple wrapper of `array` on ArrayFire.
```julia
a = rand(AFArray{Float32}, 10, 5)
```
