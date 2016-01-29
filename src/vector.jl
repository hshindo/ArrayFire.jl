function cumsum{T,N}(a::AFArray{T,N}, dim::Int)
  out = af_array[0]
  af_accum(out, a, dim)
  TT = af_eltype(out[1])
  AFArray{TT,N}(out[1])
end

