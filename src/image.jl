function unwrap(in::AFArray, w1, w2, s1, s2, p1, p2, iscolumn::Bool)
  out = af_array[0]
  af_unwrap(out, in, w1, w2, s1, s2, p1, p2, iscolumn)
  AFArray(out[1])
end

function wrap(in::AFArray, o1, o2, w1, w2, s1, s2, p1, p2, iscolumn::Bool)
  out = af_array[0]
  af_wrap(out, in, o1, o2, w1, w2, s1, s2, p1, p2, iscolumn)
  AFArray(out[1])
end
