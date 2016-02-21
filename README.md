# ArrayFire.jl

This is a [Julia](http://julialang.org/) bindings for [ArrayFire](http://arrayfire.com/).
ArrayFire is a high performance library for parallel computing with an easy-to-use API.
It enables users to write scientific computing code that is portable across CPU, CUDA and OpenCL devices.
This project provides Julia bindings for the ArrayFire library.

Currently, C interface on ArrayFire is used.
When [Cxx.jl](https://github.com/Keno/Cxx.jl) becomes mature, C++ interface will be used instead.

## Requirements

Most of the functions are tested on Windows, but it should be run on Linux and OSX.
You also need to have the ArrayFire C/C++ library installed on your machine.
You can get it from the following sources.

- [Download and install binaries](https://arrayfire.com/download)
- [Build and install from source](https://github.com/hshindo/arrayfire)

## Install

```julia
julia> Pkg.clone("https://github.com/hshindo/ArrayFire.jl.git")
```

Ensure the ArrayFire.jl can find the arrayfire library (`af.dll` on Windows or `libaf.so` on Linux and OSX).

## Example

`AFArray` is a simple wrapper of `array` class on the original ArrayFire.
Function names may be changed to be consistent with `Array` in Julia.

```julia
using ArrayFire

# Display backend information
AF.available_backends()

# Generate a uniform random array with a size of 5 elements
a = AF.rand(Float32, 5, 1)
b = AF.rand(Float32, 5, 1)

# Print sum values of a and b
c = a + b
println(c)
```
