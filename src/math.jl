import Base.+
function +(lhs::AFArray, rhs::AFArray)
  out = af_array[0]
  af_add(out, lhs, rhs, true)
  AFArray(out[1])
end
+{T<:Number}(lhs::AFArray, rhs::T) = lhs + AFArray(T[rhs])
+{T<:Number}(lhs::T, rhs::AFArray) = AFArray(T[lhs]) + rhs

import Base.-
function -(lhs::AFArray, rhs::AFArray)
  out = af_array[0]
  af_sub(out, lhs, rhs, true)
  AFArray(out[1])
end
-(in::AFArray) = zeros(in) - in
-{T<:Number}(lhs::AFArray, rhs::T) = lhs - AFArray(T[rhs])
-{T<:Number}(lhs::T, rhs::AFArray) = AFArray(T[lhs]) - rhs

import Base.(.*)
function .*(lhs::AFArray, rhs::AFArray)
  out = af_array[0]
  af_mul(out, lhs, rhs, true)
  AFArray(out[1])
end

import Base.*
*{T<:Number}(lhs::AFArray, rhs::T) = lhs .* AFArray(T[rhs])
*{T<:Number}(lhs::T, rhs::AFArray) = AFArray(T[lhs]) .* rhs

function Base.dot(lhs::AFArray, rhs::AFArray)
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
Base.A_mul_Bt(lhs::AFArray, rhs::AFArray) = matmul(lhs, rhs, AF_MAT_NONE, AF_MAT_TRANS)
Base.At_mul_B(lhs::AFArray, rhs::AFArray) = matmul(lhs, rhs, AF_MAT_TRANS, AF_MAT_NONE)
Base.At_mul_Bt(lhs::AFArray, rhs::AFArray) = matmul(lhs, rhs, AF_MAT_TRANS, AF_MAT_TRANS)

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
    function Base.$(fname)(in::AFArray)
      out = af_array[0]
      $afname(out, in)
      AFArray(out[1])
    end
  end
end

import Base: >=, >, <=, <
for (fname, afname) in [(:>=, :af_ge),
                        (:>, :af_gt),
                        (:<=, :af_le),
                        (:<, :af_lt)]
  @eval begin
    function $(fname)(lhs::AFArray, rhs::AFArray)
      out = af_array[0]
      $afname(out, lhs, rhs, true)
      AFArray(out[1])
    end
    $(fname)(lhs::AFArray, rhs::Number) = $(fname)(lhs, AFArray([rhs]))
    $(fname)(lhs::Number, rhs::AFArray) = $(fname)(AFArray([lhs]), rhs)
  end
end
