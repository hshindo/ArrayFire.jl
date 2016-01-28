function +{T,N}(lhs::AFArray{T,N}, rhs::AFArray{T,N})
  out = af_array[0]
  af_add(out, lhs, rhs, true)
  AFArray{T,N}(out[1])
end

function -{T,N}(lhs::AFArray{T,N}, rhs::AFArray{T,N})
  out = af_array[0]
  af_sub(out, lhs, rhs, true)
  AFArray{T,N}(out[1])
end

function .*{T}(lhs::AFArray{T}, rhs::AFArray{T})
  out = af_array[0]
  af_mul(out, lhs, rhs, true)
  N = ndims(out[1])
  AFArray{T,N}(out[1])
end

function *{T,N,V<:Number}(lhs::AFArray{T,N}, rhs::V)
  rhs = fill(AFArray, rhs, (1,))
  lhs .* rhs
end
function *{T,N,V<:Number}(lhs::V, rhs::AFArray{T,N})
  lhs = fill(AFArray, lhs, (1,))
  lhs .* rhs
end

"TODO: make AF_MAT_NONE variable"
function dot{T,N}(lhs::AFArray{T,N}, rhs::AFArray{T,N})
  out = af_array[0]
  af_dot(out, lhs, rhs, AF_MAT_NONE, AF_MAT_NONE)
  AFArray{T,N}(out[1])
end
⋅(lhs::AFArray{T,N}, rhs::AFArray{T,N}) = dot(lhs, rhs)

function matmul{T}(lhs::AFMatrix{T}, rhs::AFMatrix{T}, optlhs, optrhs)
  out = af_array[0]
  af_matmul(out, lhs, rhs, optlhs, optrhs)
  AFMatrix{T}(out[1])
end
*{T}(lhs::AFMatrix{T}, rhs::AFMatrix{T}) = matmul(lhs, rhs, AF_MAT_NONE, AF_MAT_NONE)
matmulNT(lhs, rhs) = mult(lhs, rhs, AF_MAT_NONE, AF_MAT_TRANS)
matmulTN(lhs, rhs) = mult(lhs, rhs, AF_MAT_TRANS, AF_MAT_NONE)
matmulTT(lhs, rhs) = mult(lhs, rhs, AF_MAT_TRANS, AF_MAT_TRANS)
