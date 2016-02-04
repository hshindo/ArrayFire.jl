function unwrap(in::AFArray, w1, w2, s1, s2, p1, p2)
  out = af_array[0]
  af_unwrap(out, in, dim_t(w1), dim_t(w2), dim_t(s1), dim_t(s2), dim_t(p1), dim_t(p2), true)
  AFArray(out[1])
end

function wrap(in::AFArray)
end
