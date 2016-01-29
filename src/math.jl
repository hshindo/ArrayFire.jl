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
-{T,N}(a::AFArray{T,N}) = fill(AFArray, T(0), size(a)) - a

function .*{T}(lhs::AFArray{T}, rhs::AFArray{T})
  out = af_array[0]
  af_mul(out, lhs, rhs, true)
  N = af_ndims(out[1])
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

#TODO: make AF_MAT_NONE variable
function dot{T,N}(lhs::AFArray{T,N}, rhs::AFArray{T,N})
  out = af_array[0]
  af_dot(out, lhs, rhs, AF_MAT_NONE, AF_MAT_NONE)
  AFArray{T,N}(out[1])
end

function matmul{T}(lhs::AFMatrix{T}, rhs::AFMatrix{T}, optlhs, optrhs)
  out = af_array[0]
  af_matmul(out, lhs, rhs, optlhs, optrhs)
  AFMatrix{T}(out[1])
end
*{T}(lhs::AFMatrix{T}, rhs::AFMatrix{T}) = matmul(lhs, rhs, AF_MAT_NONE, AF_MAT_NONE)
A_mul_Bt(lhs::AFMatrix, rhs::AFMatrix) = matmul(lhs, rhs, AF_MAT_NONE, AF_MAT_TRANS)
At_mul_B(lhs::AFMatrix, rhs::AFMatrix) = matmul(lhs, rhs, AF_MAT_TRANS, AF_MAT_NONE)
At_mul_Bt(lhs::AFMatrix, rhs::AFMatrix) = matmul(lhs, rhs, AF_MAT_TRANS, AF_MAT_TRANS)

for (fname, afname) in [(:exp, :af_exp),
                        (:expm1, :af_expm1),
                        (:log, :af_log),
                        (:log10, :af_log10),
                        (:log1p, :af_log1p),
                        (:sqrt, :af_sqrt),
                        (:tanh, :af_tanh),
                        (:abs, :af_abs),
                        (:ceil, :af_ceil),
                        (:floor, :af_floor),
                        (:round, :af_round),
                        (:sign, :af_sign),
                        (:trunc, :af_trunc)]
  @eval begin
    function $(fname){T,N}(a::AFArray{T,N})
      out = af_array[0]
      $afname(out, a)
      AFArray{T,N}(out[1])
    end
  end
end
