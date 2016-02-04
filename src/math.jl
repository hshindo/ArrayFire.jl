function +(lhs::AFArray, rhs::AFArray)
  out = af_array[0]
  af_add(out, lhs, rhs, true)
  AFArray(out[1])
end

function -(lhs::AFArray, rhs::AFArray)
  out = af_array[0]
  af_sub(out, lhs, rhs, true)
  AFArray(out[1])
end

-(in::AFArray) = zeros(in) - in

function .*(lhs::AFArray, rhs::AFArray)
  out = af_array[0]
  af_mul(out, lhs, rhs, true)
  AFArray(out[1])
end
*(lhs::AFArray, rhs::Number) = lhs .* AFArray([rhs])
*(lhs::Number, rhs::AFArray) = AFArray([lhs]) .* rhs

function dot(lhs::AFArray, rhs::AFArray)
  out = af_array[0]
  af_dot(out, lhs, rhs, AF_MAT_NONE, AF_MAT_NONE)
  AFArray(out[1])
end

function matmul(lhs::AFArray, rhs::AFArray, optlhs, optrhs)
  out = af_array[0]
  af_matmul(out, lhs, rhs, optlhs, optrhs)
  AFArray(out[1])
end
*(lhs::AFArray, rhs::AFArray) = matmul(lhs, rhs, AF_MAT_NONE, AF_MAT_NONE)
A_mul_Bt(lhs::AFArray, rhs::AFArray) = matmul(lhs, rhs, AF_MAT_NONE, AF_MAT_TRANS)
At_mul_B(lhs::AFArray, rhs::AFArray) = matmul(lhs, rhs, AF_MAT_TRANS, AF_MAT_NONE)
At_mul_Bt(lhs::AFArray, rhs::AFArray) = matmul(lhs, rhs, AF_MAT_TRANS, AF_MAT_TRANS)

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
    function $(fname)(in::AFArray)
      out = af_array[0]
      $afname(out, in)
      AFArray(out[1])
    end
  end
end

##### Logical operations #####

function >=(lhs::AFArray, rhs::AFArray)
  out = af_array[0]
  af_ge(out, lhs, rhs, true)
  AFArray(out[1])
end
>=(lhs::AFArray, rhs::Number) = lhs >= AFArray([rhs])
