function +{T,N}(x1::AFArray{T,N}, x2::AFArray{T,N})
  out = af_array[0]
  af_add(out, x1.ptr, x2.ptr, true)
  AFArray{T,N}(out[1])
end

function -{T,N}(x1::AFArray{T,N}, x2::AFArray{T,N})
  out = af_array[0]
  af_sub(out, x1.ptr, x2.ptr, true)
  AFArray{T,N}(out[1])
end

function .*{T,N}(x1::AFArray{T,N}, x2::AFArray{T,N})
  out = af_array[0]
  af_mul(out, x1.ptr, x2.ptr, true)
  AFArray{T,N}(out[1])
end

"TODO: make AF_MAT_NONE variable"
function dot{T,N}(x::AFArray{T,N}, y::AFArray{T,N})
  out = af_array[0]
  af_dot(out, x.ptr, y.ptr, AF_MAT_NONE, AF_MAT_NONE)
  AFArray{T,N}(out[1])
end

function matmul{T}(A::AFArray{T,2}, B::AFArray{T,2}; tA=AF_MAT_NONE, tB=AF_MAT_NONE)
  out = af_array[0]
  af_matmul(out, A.ptr, B.ptr, tA, tB)
  AFArray{T,2}(out[1])
end
*{T}(A::AFMatrix{T}, B::AFMatrix{T}) = matmul(A, B)
matmulNT(A, B) = mult(A, B, AF_MAT_NONE, AF_MAT_TRANS)
matmulTN(A, B) = mult(A, B, AF_MAT_TRANS, AF_MAT_NONE)
matmulTT(A, B) = mult(A, B, AF_MAT_TRANS, AF_MAT_TRANS)
