function unwrap(in::AFArray, w1, w2, s1, s2, p1, p2)
  out = af_array[0]
  af_unwrap(out, in, w1, w2, s1, s2, p1, p2, true)
  AFArray(out[1])
end

function wrap(in::AFArray)
end
