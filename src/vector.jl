function cumsum{T,N}(a::AFArray{T,N}, dim::Int)
  (0 < dim <= N) || throw("Invalid dimension: $(dim).")
  out = af_array[0]
  af_accum(out, a, dim)
  TT = af_eltype(out[1])
  AFArray{TT,N}(out[1])
end

function findmax{T,N}(a::AFArray{T,N}, dim::Int)
  (0 < dim <= N) || throw("Invalid dimension: $(dim).")
  out = af_array[0]
  idx = af_array[0]
  af_imax(out, idx, a, dim-1)
  AFArray{T,N}(out[1]), AFArray{UInt32,N}(idx[1])
end

function maximum{T,N}(a::AFArray{T,N}, dim::Int)
  (0 < dim <= N) || throw("Invalid dimension: $(dim).")
  out = af_array[0]
  af_max(out, a, dim-1)
  AFArray{T,N}(out[1])
end

function sum{T,N}(a::AFArray{T,N}, dim::Int)
  (0 < dim <= N) || throw("Invalid dimension: $(dim).")
  out = af_array[0]
  af_sum(out, a, dim-1)
  TT = af_eltype(out[1])
  AFArray{TT,N}(out[1])
end
