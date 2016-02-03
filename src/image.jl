function unwrap{T}(a::AFMatrix{T}, w1, w2, s1, s2, p1, p2)
  out = af_array[0]
  af_unwrap(out, a, dim_t(w1), dim_t(w2), dim_t(s1), dim_t(s2), dim_t(p1), dim_t(p2), true)
  AFMatrix{T}(out[1])
end

function wrap(a::AFArray)
end
