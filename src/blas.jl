function matmulNT(lhs::AFArray{T}, rhs::AFArray{T})
  ptr = @cxx af::matmulNT(lhs.ptr, rhs.ptr)
  AFArray{T,N}(ptr)
end

