function +{T,N}(x1::AFArray{T,N}, x2::AFArray{T,N})
  p = af_array[0]
  af_add(p, x1.ptr, x2.ptr, true)
  AFArray{T,N}(p[1])
end

function -{T,N}(x1::AFArray{T,N}, x2::AFArray{T,N})
  p = af_array[0]
  af_sub(p, x1.ptr, x2.ptr, true)
  AFArray{T,N}(p[1])
end

function .*{T}(lhs::AFArray{T}, rhs::AFArray{T})
  p = af_array[0]
  af_mul(p, lhs, rhs, true)
  N = ndims(p[1])
  AFArray{T,N}(p[1])
end

function *{T,N,V<:AbstractFloat}(lhs::AFArray{T,N}, rhs::V)
  rhs = fill(AFArray, rhs, (1,))
  lhs .* rhs
end
function *{T,N,V<:AbstractFloat}(lhs::AFArray{T,N}, rhs::V)
  rhs = fill(AFArray, rhs, (1,))
  lhs .* rhs
end

"TODO: make AF_MAT_NONE variable"
function dot{T,N}(x::AFArray{T,N}, y::AFArray{T,N})
  p = af_array[0]
  af_dot(p, x.ptr, y.ptr, AF_MAT_NONE, AF_MAT_NONE)
  AFArray{T,N}(p[1])
end

function matmul{T}(A::AFArray{T,2}, B::AFArray{T,2}; tA=AF_MAT_NONE, tB=AF_MAT_NONE)
  p = af_array[0]
  af_matmul(p, A.ptr, B.ptr, tA, tB)
  AFArray{T,2}(p[1])
end
*{T}(A::AFMatrix{T}, B::AFMatrix{T}) = matmul(A, B)
matmulNT(A, B) = mult(A, B, AF_MAT_NONE, AF_MAT_TRANS)
matmulTN(A, B) = mult(A, B, AF_MAT_TRANS, AF_MAT_NONE)
matmulTT(A, B) = mult(A, B, AF_MAT_TRANS, AF_MAT_TRANS)
