function Base.findmax(in::AFArray, dim::Int)
  dim > 0 || throw("Invalid dimension: $(dim).")
  out = af_array[0]
  idx = af_array[0]
  af_imax(out, idx, in, dim-1)
  AFArray(out[1]), AFArray(idx[1])
end

function Base.maximum(in::AFArray, dim::Int)
  dim > 0 || throw("Invalid dimension: $(dim).")
  out = af_array[0]
  af_max(out, in, dim-1)
  AFArray(out[1])
end

function Base.sum(in::AFArray, dim::Int)
  dim > 0 || throw("Invalid dimension: $(dim).")
  out = af_array[0]
  af_sum(out, in, dim-1)
  AFArray(out[1])
end
