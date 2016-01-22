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

function *{T,N}(x1::AFArray{T,N}, x2::AFArray{T,N})
  out = af_array[0]
  af_mult(out, x1.ptr, x2.ptr, true)
  AFArray{T,N}(out[1])
end
