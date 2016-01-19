# Julia wrapper for header: /usr/local/include/arrayfire.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function af_sum(out,_in,dim)
    checkerror(ccall((:af_sum,libaf),af_err,(Ptr{af_array},af_array,Cint),out,_in,dim))
end

function af_sum_nan(out,_in,dim,nanval)
    checkerror(ccall((:af_sum_nan,libaf),af_err,(Ptr{af_array},af_array,Cint,Cdouble),out,_in,dim,nanval))
end

function af_product(out,_in,dim)
    checkerror(ccall((:af_product,libaf),af_err,(Ptr{af_array},af_array,Cint),out,_in,dim))
end

function af_product_nan(out,_in,dim,nanval)
    checkerror(ccall((:af_product_nan,libaf),af_err,(Ptr{af_array},af_array,Cint,Cdouble),out,_in,dim,nanval))
end

function af_min(out,_in,dim)
    checkerror(ccall((:af_min,libaf),af_err,(Ptr{af_array},af_array,Cint),out,_in,dim))
end

function af_max(out,_in,dim)
    checkerror(ccall((:af_max,libaf),af_err,(Ptr{af_array},af_array,Cint),out,_in,dim))
end

function af_all_true(out,_in,dim)
    checkerror(ccall((:af_all_true,libaf),af_err,(Ptr{af_array},af_array,Cint),out,_in,dim))
end

function af_any_true(out,_in,dim)
    checkerror(ccall((:af_any_true,libaf),af_err,(Ptr{af_array},af_array,Cint),out,_in,dim))
end

function af_count(out,_in,dim)
    checkerror(ccall((:af_count,libaf),af_err,(Ptr{af_array},af_array,Cint),out,_in,dim))
end

function af_sum_all(real,imag,_in)
    checkerror(ccall((:af_sum_all,libaf),af_err,(Ptr{Cdouble},Ptr{Cdouble},af_array),real,imag,_in))
end

function af_sum_nan_all(real,imag,_in,nanval)
    checkerror(ccall((:af_sum_nan_all,libaf),af_err,(Ptr{Cdouble},Ptr{Cdouble},af_array,Cdouble),real,imag,_in,nanval))
end

function af_product_all(real,imag,_in)
    checkerror(ccall((:af_product_all,libaf),af_err,(Ptr{Cdouble},Ptr{Cdouble},af_array),real,imag,_in))
end

function af_product_nan_all(real,imag,_in,nanval)
    checkerror(ccall((:af_product_nan_all,libaf),af_err,(Ptr{Cdouble},Ptr{Cdouble},af_array,Cdouble),real,imag,_in,nanval))
end

function af_min_all(real,imag,_in)
    checkerror(ccall((:af_min_all,libaf),af_err,(Ptr{Cdouble},Ptr{Cdouble},af_array),real,imag,_in))
end

function af_max_all(real,imag,_in)
    checkerror(ccall((:af_max_all,libaf),af_err,(Ptr{Cdouble},Ptr{Cdouble},af_array),real,imag,_in))
end

function af_all_true_all(real,imag,_in)
    checkerror(ccall((:af_all_true_all,libaf),af_err,(Ptr{Cdouble},Ptr{Cdouble},af_array),real,imag,_in))
end

function af_any_true_all(real,imag,_in)
    checkerror(ccall((:af_any_true_all,libaf),af_err,(Ptr{Cdouble},Ptr{Cdouble},af_array),real,imag,_in))
end

function af_count_all(real,imag,_in)
    checkerror(ccall((:af_count_all,libaf),af_err,(Ptr{Cdouble},Ptr{Cdouble},af_array),real,imag,_in))
end

function af_imin(out,idx,_in,dim)
    checkerror(ccall((:af_imin,libaf),af_err,(Ptr{af_array},Ptr{af_array},af_array,Cint),out,idx,_in,dim))
end

function af_imax(out,idx,_in,dim)
    checkerror(ccall((:af_imax,libaf),af_err,(Ptr{af_array},Ptr{af_array},af_array,Cint),out,idx,_in,dim))
end

function af_imin_all(real,imag,idx,_in)
    checkerror(ccall((:af_imin_all,libaf),af_err,(Ptr{Cdouble},Ptr{Cdouble},Ptr{UInt32},af_array),real,imag,idx,_in))
end

function af_imax_all(real,imag,idx,_in)
    checkerror(ccall((:af_imax_all,libaf),af_err,(Ptr{Cdouble},Ptr{Cdouble},Ptr{UInt32},af_array),real,imag,idx,_in))
end

function af_accum(out,_in,dim)
    checkerror(ccall((:af_accum,libaf),af_err,(Ptr{af_array},af_array,Cint),out,_in,dim))
end

function af_where(idx,_in)
    checkerror(ccall((:af_where,libaf),af_err,(Ptr{af_array},af_array),idx,_in))
end

function af_diff1(out,_in,dim)
    checkerror(ccall((:af_diff1,libaf),af_err,(Ptr{af_array},af_array,Cint),out,_in,dim))
end

function af_diff2(out,_in,dim)
    checkerror(ccall((:af_diff2,libaf),af_err,(Ptr{af_array},af_array,Cint),out,_in,dim))
end

function af_sort(out,_in,dim,isAscending)
    checkerror(ccall((:af_sort,libaf),af_err,(Ptr{af_array},af_array,UInt32,Bool),out,_in,dim,isAscending))
end

function af_sort_index(out,indices,_in,dim,isAscending)
    checkerror(ccall((:af_sort_index,libaf),af_err,(Ptr{af_array},Ptr{af_array},af_array,UInt32,Bool),out,indices,_in,dim,isAscending))
end

function af_sort_by_key(out_keys,out_values,keys,values,dim,isAscending)
    checkerror(ccall((:af_sort_by_key,libaf),af_err,(Ptr{af_array},Ptr{af_array},af_array,af_array,UInt32,Bool),out_keys,out_values,keys,values,dim,isAscending))
end

function af_set_unique(out,_in,is_sorted)
    checkerror(ccall((:af_set_unique,libaf),af_err,(Ptr{af_array},af_array,Bool),out,_in,is_sorted))
end

function af_set_union(out,first,second,is_unique)
    checkerror(ccall((:af_set_union,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,first,second,is_unique))
end

function af_set_intersect(out,first,second,is_unique)
    checkerror(ccall((:af_set_intersect,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,first,second,is_unique))
end

function af_add(out,lhs,rhs,batch)
    checkerror(ccall((:af_add,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_sub(out,lhs,rhs,batch)
    checkerror(ccall((:af_sub,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_mul(out,lhs,rhs,batch)
    checkerror(ccall((:af_mul,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_div(out,lhs,rhs,batch)
    checkerror(ccall((:af_div,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_lt(out,lhs,rhs,batch)
    checkerror(ccall((:af_lt,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_gt(out,lhs,rhs,batch)
    checkerror(ccall((:af_gt,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_le(out,lhs,rhs,batch)
    checkerror(ccall((:af_le,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_ge(out,lhs,rhs,batch)
    checkerror(ccall((:af_ge,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_eq(out,lhs,rhs,batch)
    checkerror(ccall((:af_eq,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_neq(out,lhs,rhs,batch)
    checkerror(ccall((:af_neq,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_and(out,lhs,rhs,batch)
    checkerror(ccall((:af_and,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_or(out,lhs,rhs,batch)
    checkerror(ccall((:af_or,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_not(out,_in)
    checkerror(ccall((:af_not,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_bitand(out,lhs,rhs,batch)
    checkerror(ccall((:af_bitand,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_bitor(out,lhs,rhs,batch)
    checkerror(ccall((:af_bitor,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_bitxor(out,lhs,rhs,batch)
    checkerror(ccall((:af_bitxor,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_bitshiftl(out,lhs,rhs,batch)
    checkerror(ccall((:af_bitshiftl,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_bitshiftr(out,lhs,rhs,batch)
    checkerror(ccall((:af_bitshiftr,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_cast(out,_in,_type)
    checkerror(ccall((:af_cast,libaf),af_err,(Ptr{af_array},af_array,af_dtype),out,_in,_type))
end

function af_minof(out,lhs,rhs,batch)
    checkerror(ccall((:af_minof,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_maxof(out,lhs,rhs,batch)
    checkerror(ccall((:af_maxof,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_rem(out,lhs,rhs,batch)
    checkerror(ccall((:af_rem,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_mod(out,lhs,rhs,batch)
    checkerror(ccall((:af_mod,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_abs(out,_in)
    checkerror(ccall((:af_abs,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_arg(out,_in)
    checkerror(ccall((:af_arg,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_sign(out,_in)
    checkerror(ccall((:af_sign,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_round(out,_in)
    checkerror(ccall((:af_round,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_trunc(out,_in)
    checkerror(ccall((:af_trunc,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_floor(out,_in)
    checkerror(ccall((:af_floor,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_ceil(out,_in)
    checkerror(ccall((:af_ceil,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_hypot(out,lhs,rhs,batch)
    checkerror(ccall((:af_hypot,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_sin(out,_in)
    checkerror(ccall((:af_sin,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_cos(out,_in)
    checkerror(ccall((:af_cos,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_tan(out,_in)
    checkerror(ccall((:af_tan,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_asin(out,_in)
    checkerror(ccall((:af_asin,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_acos(out,_in)
    checkerror(ccall((:af_acos,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_atan(out,_in)
    checkerror(ccall((:af_atan,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_atan2(out,lhs,rhs,batch)
    checkerror(ccall((:af_atan2,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_cplx2(out,lhs,rhs,batch)
    checkerror(ccall((:af_cplx2,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_cplx(out,_in)
    checkerror(ccall((:af_cplx,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_real(out,_in)
    checkerror(ccall((:af_real,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_imag(out,_in)
    checkerror(ccall((:af_imag,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_conjg(out,_in)
    checkerror(ccall((:af_conjg,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_sinh(out,_in)
    checkerror(ccall((:af_sinh,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_cosh(out,_in)
    checkerror(ccall((:af_cosh,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_tanh(out,_in)
    checkerror(ccall((:af_tanh,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_asinh(out,_in)
    checkerror(ccall((:af_asinh,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_acosh(out,_in)
    checkerror(ccall((:af_acosh,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_atanh(out,_in)
    checkerror(ccall((:af_atanh,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_root(out,lhs,rhs,batch)
    checkerror(ccall((:af_root,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_pow(out,lhs,rhs,batch)
    checkerror(ccall((:af_pow,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,lhs,rhs,batch))
end

function af_pow2(out,_in)
    checkerror(ccall((:af_pow2,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_exp(out,_in)
    checkerror(ccall((:af_exp,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_sigmoid(out,_in)
    checkerror(ccall((:af_sigmoid,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_expm1(out,_in)
    checkerror(ccall((:af_expm1,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_erf(out,_in)
    checkerror(ccall((:af_erf,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_erfc(out,_in)
    checkerror(ccall((:af_erfc,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_log(out,_in)
    checkerror(ccall((:af_log,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_log1p(out,_in)
    checkerror(ccall((:af_log1p,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_log10(out,_in)
    checkerror(ccall((:af_log10,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_log2(out,_in)
    checkerror(ccall((:af_log2,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_sqrt(out,_in)
    checkerror(ccall((:af_sqrt,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_cbrt(out,_in)
    checkerror(ccall((:af_cbrt,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_factorial(out,_in)
    checkerror(ccall((:af_factorial,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_tgamma(out,_in)
    checkerror(ccall((:af_tgamma,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_lgamma(out,_in)
    checkerror(ccall((:af_lgamma,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_iszero(out,_in)
    checkerror(ccall((:af_iszero,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_isinf(out,_in)
    checkerror(ccall((:af_isinf,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_isnan(out,_in)
    checkerror(ccall((:af_isnan,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_make_seq(_begin,_end,step)
    ccall((:af_make_seq,libaf),af_seq,(Cdouble,Cdouble,Cdouble),_begin,_end,step)
end

function af_print_array(arr)
    checkerror(ccall((:af_print_array,libaf),af_err,(af_array,),arr))
end

function af_print_array_gen(exp,arr,precision)
    checkerror(ccall((:af_print_array_gen,libaf),af_err,(Ptr{UInt8},af_array,Cint),exp,arr,precision))
end

function af_save_array(index,key,arr,filename,append)
    checkerror(ccall((:af_save_array,libaf),af_err,(Ptr{Cint},Ptr{UInt8},af_array,Ptr{UInt8},Bool),index,key,arr,filename,append))
end

function af_read_array_index(out,filename,index)
    checkerror(ccall((:af_read_array_index,libaf),af_err,(Ptr{af_array},Ptr{UInt8},UInt32),out,filename,index))
end

function af_read_array_key(out,filename,key)
    checkerror(ccall((:af_read_array_key,libaf),af_err,(Ptr{af_array},Ptr{UInt8},Ptr{UInt8}),out,filename,key))
end

function af_read_array_key_check(index,filename,key)
    checkerror(ccall((:af_read_array_key_check,libaf),af_err,(Ptr{Cint},Ptr{UInt8},Ptr{UInt8}),index,filename,key))
end

function af_array_to_string(output,exp,arr,precision,transpose)
    checkerror(ccall((:af_array_to_string,libaf),af_err,(Ptr{Ptr{UInt8}},Ptr{UInt8},af_array,Cint,Bool),output,exp,arr,precision,transpose))
end

function af_example_function(out,_in,param)
    checkerror(ccall((:af_example_function,libaf),af_err,(Ptr{af_array},af_array,af_someenum_t),out,_in,param))
end

function af_get_version(major,minor,patch)
    checkerror(ccall((:af_get_version,libaf),af_err,(Ptr{Cint},Ptr{Cint},Ptr{Cint}),major,minor,patch))
end

function af_index(out,_in,ndims,index)
    checkerror(ccall((:af_index,libaf),af_err,(Ptr{af_array},af_array,UInt32,Ptr{af_seq}),out,_in,ndims,index))
end

function af_lookup(out,_in,indices,dim)
    checkerror(ccall((:af_lookup,libaf),af_err,(Ptr{af_array},af_array,af_array,UInt32),out,_in,indices,dim))
end

function af_assign_seq(out,lhs,ndims,indices,rhs)
    checkerror(ccall((:af_assign_seq,libaf),af_err,(Ptr{af_array},af_array,UInt32,Ptr{af_seq},af_array),out,lhs,ndims,indices,rhs))
end

function af_index_gen(out,_in,ndims,indices)
    checkerror(ccall((:af_index_gen,libaf),af_err,(Ptr{af_array},af_array,dim_t,Ptr{af_index_t}),out,_in,ndims,indices))
end

function af_assign_gen(out,lhs,ndims,indices,rhs)
    checkerror(ccall((:af_assign_gen,libaf),af_err,(Ptr{af_array},af_array,dim_t,Ptr{af_index_t},af_array),out,lhs,ndims,indices,rhs))
end

function af_create_indexers(indexers)
    checkerror(ccall((:af_create_indexers,libaf),af_err,(Ptr{Ptr{af_index_t}},),indexers))
end

function af_set_array_indexer(indexer,idx,dim)
    checkerror(ccall((:af_set_array_indexer,libaf),af_err,(Ptr{af_index_t},af_array,dim_t),indexer,idx,dim))
end

function af_set_seq_indexer(indexer,idx,dim,is_batch)
    checkerror(ccall((:af_set_seq_indexer,libaf),af_err,(Ptr{af_index_t},Ptr{af_seq},dim_t,Bool),indexer,idx,dim,is_batch))
end

function af_set_seq_param_indexer(indexer,_begin,_end,step,dim,is_batch)
    checkerror(ccall((:af_set_seq_param_indexer,libaf),af_err,(Ptr{af_index_t},Cdouble,Cdouble,Cdouble,dim_t,Bool),indexer,_begin,_end,step,dim,is_batch))
end

function af_release_indexers(indexers)
    checkerror(ccall((:af_release_indexers,libaf),af_err,(Ptr{af_index_t},),indexers))
end

function af_create_array(arr,data,ndims,dims,_type)
    checkerror(ccall((:af_create_array,libaf),af_err,(Ptr{af_array},Ptr{Void},UInt32,Ptr{dim_t},af_dtype),arr,data,ndims,dims,_type))
end

function af_create_handle(arr,ndims,dims,_type)
    checkerror(ccall((:af_create_handle,libaf),af_err,(Ptr{af_array},UInt32,Ptr{dim_t},af_dtype),arr,ndims,dims,_type))
end

function af_copy_array(arr,_in)
    checkerror(ccall((:af_copy_array,libaf),af_err,(Ptr{af_array},af_array),arr,_in))
end

function af_write_array(arr,data,bytes,src)
    checkerror(ccall((:af_write_array,libaf),af_err,(af_array,Ptr{Void},Csize_t,af_source),arr,data,bytes,src))
end

function af_get_data_ptr(data,arr)
    checkerror(ccall((:af_get_data_ptr,libaf),af_err,(Ptr{Void},af_array),data,arr))
end

function af_release_array(arr)
    checkerror(ccall((:af_release_array,libaf),af_err,(af_array,),arr))
end

function af_retain_array(out,_in)
    checkerror(ccall((:af_retain_array,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_get_data_ref_count(use_count,_in)
    checkerror(ccall((:af_get_data_ref_count,libaf),af_err,(Ptr{Cint},af_array),use_count,_in))
end

function af_eval(_in)
    checkerror(ccall((:af_eval,libaf),af_err,(af_array,),_in))
end

function af_get_elements(elems,arr)
    checkerror(ccall((:af_get_elements,libaf),af_err,(Ptr{dim_t},af_array),elems,arr))
end

function af_get_type(_type,arr)
    checkerror(ccall((:af_get_type,libaf),af_err,(Ptr{af_dtype},af_array),_type,arr))
end

function af_get_dims(d0,d1,d2,d3,arr)
    checkerror(ccall((:af_get_dims,libaf),af_err,(Ptr{dim_t},Ptr{dim_t},Ptr{dim_t},Ptr{dim_t},af_array),d0,d1,d2,d3,arr))
end

function af_get_numdims(result,arr)
    checkerror(ccall((:af_get_numdims,libaf),af_err,(Ptr{UInt32},af_array),result,arr))
end

function af_is_empty(result,arr)
    checkerror(ccall((:af_is_empty,libaf),af_err,(Ptr{Bool},af_array),result,arr))
end

function af_is_scalar(result,arr)
    checkerror(ccall((:af_is_scalar,libaf),af_err,(Ptr{Bool},af_array),result,arr))
end

function af_is_row(result,arr)
    checkerror(ccall((:af_is_row,libaf),af_err,(Ptr{Bool},af_array),result,arr))
end

function af_is_column(result,arr)
    checkerror(ccall((:af_is_column,libaf),af_err,(Ptr{Bool},af_array),result,arr))
end

function af_is_vector(result,arr)
    checkerror(ccall((:af_is_vector,libaf),af_err,(Ptr{Bool},af_array),result,arr))
end

function af_is_complex(result,arr)
    checkerror(ccall((:af_is_complex,libaf),af_err,(Ptr{Bool},af_array),result,arr))
end

function af_is_real(result,arr)
    checkerror(ccall((:af_is_real,libaf),af_err,(Ptr{Bool},af_array),result,arr))
end

function af_is_double(result,arr)
    checkerror(ccall((:af_is_double,libaf),af_err,(Ptr{Bool},af_array),result,arr))
end

function af_is_single(result,arr)
    checkerror(ccall((:af_is_single,libaf),af_err,(Ptr{Bool},af_array),result,arr))
end

function af_is_realfloating(result,arr)
    checkerror(ccall((:af_is_realfloating,libaf),af_err,(Ptr{Bool},af_array),result,arr))
end

function af_is_floating(result,arr)
    checkerror(ccall((:af_is_floating,libaf),af_err,(Ptr{Bool},af_array),result,arr))
end

function af_is_integer(result,arr)
    checkerror(ccall((:af_is_integer,libaf),af_err,(Ptr{Bool},af_array),result,arr))
end

function af_is_bool(result,arr)
    checkerror(ccall((:af_is_bool,libaf),af_err,(Ptr{Bool},af_array),result,arr))
end

function af_set_backend(bknd)
    checkerror(ccall((:af_set_backend,libaf),af_err,(af_backend,),bknd))
end

function af_get_backend_count(num_backends)
    checkerror(ccall((:af_get_backend_count,libaf),af_err,(Ptr{UInt32},),num_backends))
end

function af_get_available_backends(backends)
    checkerror(ccall((:af_get_available_backends,libaf),af_err,(Ptr{Cint},),backends))
end

function af_get_backend_id(backend,_in)
    checkerror(ccall((:af_get_backend_id,libaf),af_err,(Ptr{af_backend},af_array),backend,_in))
end

function af_matmul(out,lhs,rhs,optLhs,optRhs)
    checkerror(ccall((:af_matmul,libaf),af_err,(Ptr{af_array},af_array,af_array,af_mat_prop,af_mat_prop),out,lhs,rhs,optLhs,optRhs))
end

function af_dot(out,lhs,rhs,optLhs,optRhs)
    checkerror(ccall((:af_dot,libaf),af_err,(Ptr{af_array},af_array,af_array,af_mat_prop,af_mat_prop),out,lhs,rhs,optLhs,optRhs))
end

function af_transpose(out,_in,conjugate)
    checkerror(ccall((:af_transpose,libaf),af_err,(Ptr{af_array},af_array,Bool),out,_in,conjugate))
end

function af_transpose_inplace(_in,conjugate)
    checkerror(ccall((:af_transpose_inplace,libaf),af_err,(af_array,Bool),_in,conjugate))
end

function af_constant(arr,val,ndims,dims,_type)
    checkerror(ccall((:af_constant,libaf),af_err,(Ptr{af_array},Cdouble,UInt32,Ptr{dim_t},af_dtype),arr,val,ndims,dims,_type))
end

function af_constant_complex(arr,real,imag,ndims,dims,_type)
    checkerror(ccall((:af_constant_complex,libaf),af_err,(Ptr{af_array},Cdouble,Cdouble,UInt32,Ptr{dim_t},af_dtype),arr,real,imag,ndims,dims,_type))
end

function af_constant_long(arr,val,ndims,dims)
    checkerror(ccall((:af_constant_long,libaf),af_err,(Ptr{af_array},intl,UInt32,Ptr{dim_t}),arr,val,ndims,dims))
end

function af_constant_ulong(arr,val,ndims,dims)
    checkerror(ccall((:af_constant_ulong,libaf),af_err,(Ptr{af_array},uintl,UInt32,Ptr{dim_t}),arr,val,ndims,dims))
end

function af_range(out,ndims,dims,seq_dim,_type)
    checkerror(ccall((:af_range,libaf),af_err,(Ptr{af_array},UInt32,Ptr{dim_t},Cint,af_dtype),out,ndims,dims,seq_dim,_type))
end

function af_iota(out,ndims,dims,t_ndims,tdims,_type)
    checkerror(ccall((:af_iota,libaf),af_err,(Ptr{af_array},UInt32,Ptr{dim_t},UInt32,Ptr{dim_t},af_dtype),out,ndims,dims,t_ndims,tdims,_type))
end

function af_randu(out,ndims,dims,_type)
    checkerror(ccall((:af_randu,libaf),af_err,(Ptr{af_array},UInt32,Ptr{dim_t},af_dtype),out,ndims,dims,_type))
end

function af_randn(out,ndims,dims,_type)
    checkerror(ccall((:af_randn,libaf),af_err,(Ptr{af_array},UInt32,Ptr{dim_t},af_dtype),out,ndims,dims,_type))
end

function af_set_seed(seed)
    checkerror(ccall((:af_set_seed,libaf),af_err,(uintl,),seed))
end

function af_get_seed(seed)
    checkerror(ccall((:af_get_seed,libaf),af_err,(Ptr{uintl},),seed))
end

function af_identity(out,ndims,dims,_type)
    checkerror(ccall((:af_identity,libaf),af_err,(Ptr{af_array},UInt32,Ptr{dim_t},af_dtype),out,ndims,dims,_type))
end

function af_diag_create(out,_in,num)
    checkerror(ccall((:af_diag_create,libaf),af_err,(Ptr{af_array},af_array,Cint),out,_in,num))
end

function af_diag_extract(out,_in,num)
    checkerror(ccall((:af_diag_extract,libaf),af_err,(Ptr{af_array},af_array,Cint),out,_in,num))
end

function af_join(out,dim,first,second)
    checkerror(ccall((:af_join,libaf),af_err,(Ptr{af_array},Cint,af_array,af_array),out,dim,first,second))
end

function af_join_many(out,dim,n_arrays,inputs)
    checkerror(ccall((:af_join_many,libaf),af_err,(Ptr{af_array},Cint,UInt32,Ptr{af_array}),out,dim,n_arrays,inputs))
end

function af_tile(out,_in,x,y,z,w)
    checkerror(ccall((:af_tile,libaf),af_err,(Ptr{af_array},af_array,UInt32,UInt32,UInt32,UInt32),out,_in,x,y,z,w))
end

function af_reorder(out,_in,x,y,z,w)
    checkerror(ccall((:af_reorder,libaf),af_err,(Ptr{af_array},af_array,UInt32,UInt32,UInt32,UInt32),out,_in,x,y,z,w))
end

function af_shift(out,_in,x,y,z,w)
    checkerror(ccall((:af_shift,libaf),af_err,(Ptr{af_array},af_array,Cint,Cint,Cint,Cint),out,_in,x,y,z,w))
end

function af_moddims(out,_in,ndims,dims)
    checkerror(ccall((:af_moddims,libaf),af_err,(Ptr{af_array},af_array,UInt32,Ptr{dim_t}),out,_in,ndims,dims))
end

function af_flat(out,_in)
    checkerror(ccall((:af_flat,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_flip(out,_in,dim)
    checkerror(ccall((:af_flip,libaf),af_err,(Ptr{af_array},af_array,UInt32),out,_in,dim))
end

function af_lower(out,_in,is_unit_diag)
    checkerror(ccall((:af_lower,libaf),af_err,(Ptr{af_array},af_array,Bool),out,_in,is_unit_diag))
end

function af_upper(out,_in,is_unit_diag)
    checkerror(ccall((:af_upper,libaf),af_err,(Ptr{af_array},af_array,Bool),out,_in,is_unit_diag))
end

function af_select(out,cond,a,b)
    checkerror(ccall((:af_select,libaf),af_err,(Ptr{af_array},af_array,af_array,af_array),out,cond,a,b))
end

function af_select_scalar_r(out,cond,a,b)
    checkerror(ccall((:af_select_scalar_r,libaf),af_err,(Ptr{af_array},af_array,af_array,Cdouble),out,cond,a,b))
end

function af_select_scalar_l(out,cond,a,b)
    checkerror(ccall((:af_select_scalar_l,libaf),af_err,(Ptr{af_array},af_array,Cdouble,af_array),out,cond,a,b))
end

function af_replace(a,cond,b)
    checkerror(ccall((:af_replace,libaf),af_err,(af_array,af_array,af_array),a,cond,b))
end

function af_replace_scalar(a,cond,b)
    checkerror(ccall((:af_replace_scalar,libaf),af_err,(af_array,af_array,Cdouble),a,cond,b))
end

function af_info()
    checkerror(ccall((:af_info,libaf),af_err,()))
end

function af_init()
    checkerror(ccall((:af_init,libaf),af_err,()))
end

function af_device_info(d_name,d_platform,d_toolkit,d_compute)
    checkerror(ccall((:af_device_info,libaf),af_err,(Ptr{UInt8},Ptr{UInt8},Ptr{UInt8},Ptr{UInt8}),d_name,d_platform,d_toolkit,d_compute))
end

function af_get_device_count(num_of_devices)
    checkerror(ccall((:af_get_device_count,libaf),af_err,(Ptr{Cint},),num_of_devices))
end

function af_get_dbl_support(available,device)
    checkerror(ccall((:af_get_dbl_support,libaf),af_err,(Ptr{Bool},Cint),available,device))
end

function af_set_device(device)
    checkerror(ccall((:af_set_device,libaf),af_err,(Cint,),device))
end

function af_get_device(device)
    checkerror(ccall((:af_get_device,libaf),af_err,(Ptr{Cint},),device))
end

function af_sync(device)
    checkerror(ccall((:af_sync,libaf),af_err,(Cint,),device))
end

function af_alloc_device(ptr,bytes)
    checkerror(ccall((:af_alloc_device,libaf),af_err,(Ptr{Ptr{Void}},dim_t),ptr,bytes))
end

function af_alloc_pinned(ptr,bytes)
    checkerror(ccall((:af_alloc_pinned,libaf),af_err,(Ptr{Ptr{Void}},dim_t),ptr,bytes))
end

function af_free_device(ptr)
    checkerror(ccall((:af_free_device,libaf),af_err,(Ptr{Void},),ptr))
end

function af_free_pinned(ptr)
    checkerror(ccall((:af_free_pinned,libaf),af_err,(Ptr{Void},),ptr))
end

function af_device_array(arr,data,ndims,dims,_type)
    checkerror(ccall((:af_device_array,libaf),af_err,(Ptr{af_array},Ptr{Void},UInt32,Ptr{dim_t},af_dtype),arr,data,ndims,dims,_type))
end

function af_device_mem_info(alloc_bytes,alloc_buffers,lock_bytes,lock_buffers)
    checkerror(ccall((:af_device_mem_info,libaf),af_err,(Ptr{Csize_t},Ptr{Csize_t},Ptr{Csize_t},Ptr{Csize_t}),alloc_bytes,alloc_buffers,lock_bytes,lock_buffers))
end

function af_device_gc()
    checkerror(ccall((:af_device_gc,libaf),af_err,()))
end

function af_set_mem_step_size(step_bytes)
    checkerror(ccall((:af_set_mem_step_size,libaf),af_err,(Csize_t,),step_bytes))
end

function af_get_mem_step_size(step_bytes)
    checkerror(ccall((:af_get_mem_step_size,libaf),af_err,(Ptr{Csize_t},),step_bytes))
end

function af_lock_device_ptr(arr)
    checkerror(ccall((:af_lock_device_ptr,libaf),af_err,(af_array,),arr))
end

function af_unlock_device_ptr(arr)
    checkerror(ccall((:af_unlock_device_ptr,libaf),af_err,(af_array,),arr))
end

function af_get_device_ptr(ptr,arr)
    checkerror(ccall((:af_get_device_ptr,libaf),af_err,(Ptr{Ptr{Void}},af_array),ptr,arr))
end

function af_get_last_error(msg,len)
    ccall((:af_get_last_error,libaf),Void,(Ptr{Ptr{UInt8}},Ptr{dim_t}),msg,len)
end

function af_err_to_string(err)
    ccall((:af_err_to_string,libaf),Ptr{UInt8},(af_err,),err)
end

function af_create_features(feat,num)
    checkerror(ccall((:af_create_features,libaf),af_err,(Ptr{af_features},dim_t),feat,num))
end

function af_retain_features(out,feat)
    checkerror(ccall((:af_retain_features,libaf),af_err,(Ptr{af_features},af_features),out,feat))
end

function af_get_features_num(num,feat)
    checkerror(ccall((:af_get_features_num,libaf),af_err,(Ptr{dim_t},af_features),num,feat))
end

function af_get_features_xpos(out,feat)
    checkerror(ccall((:af_get_features_xpos,libaf),af_err,(Ptr{af_array},af_features),out,feat))
end

function af_get_features_ypos(out,feat)
    checkerror(ccall((:af_get_features_ypos,libaf),af_err,(Ptr{af_array},af_features),out,feat))
end

function af_get_features_score(score,feat)
    checkerror(ccall((:af_get_features_score,libaf),af_err,(Ptr{af_array},af_features),score,feat))
end

function af_get_features_orientation(orientation,feat)
    checkerror(ccall((:af_get_features_orientation,libaf),af_err,(Ptr{af_array},af_features),orientation,feat))
end

function af_get_features_size(size,feat)
    checkerror(ccall((:af_get_features_size,libaf),af_err,(Ptr{af_array},af_features),size,feat))
end

function af_release_features(feat)
    checkerror(ccall((:af_release_features,libaf),af_err,(af_features,),feat))
end

function af_create_window(out,width,height,title)
    checkerror(ccall((:af_create_window,libaf),af_err,(Ptr{af_window},Cint,Cint,Ptr{UInt8}),out,width,height,title))
end

function af_set_position(wind,x,y)
    checkerror(ccall((:af_set_position,libaf),af_err,(af_window,UInt32,UInt32),wind,x,y))
end

function af_set_title(wind,title)
    checkerror(ccall((:af_set_title,libaf),af_err,(af_window,Ptr{UInt8}),wind,title))
end

function af_set_size(wind,w,h)
    checkerror(ccall((:af_set_size,libaf),af_err,(af_window,UInt32,UInt32),wind,w,h))
end

function af_draw_image(wind,_in,props)
    checkerror(ccall((:af_draw_image,libaf),af_err,(af_window,af_array,Ptr{af_cell}),wind,_in,props))
end

function af_draw_plot(wind,X,Y,props)
    checkerror(ccall((:af_draw_plot,libaf),af_err,(af_window,af_array,af_array,Ptr{af_cell}),wind,X,Y,props))
end

function af_draw_plot3(wind,P,props)
    checkerror(ccall((:af_draw_plot3,libaf),af_err,(af_window,af_array,Ptr{af_cell}),wind,P,props))
end

function af_draw_hist(wind,X,minval,maxval,props)
    checkerror(ccall((:af_draw_hist,libaf),af_err,(af_window,af_array,Cdouble,Cdouble,Ptr{af_cell}),wind,X,minval,maxval,props))
end

function af_draw_surface(wind,xVals,yVals,S,props)
    checkerror(ccall((:af_draw_surface,libaf),af_err,(af_window,af_array,af_array,af_array,Ptr{af_cell}),wind,xVals,yVals,S,props))
end

function af_grid(wind,rows,cols)
    checkerror(ccall((:af_grid,libaf),af_err,(af_window,Cint,Cint),wind,rows,cols))
end

function af_show(wind)
    checkerror(ccall((:af_show,libaf),af_err,(af_window,),wind))
end

function af_is_window_closed(out,wind)
    checkerror(ccall((:af_is_window_closed,libaf),af_err,(Ptr{Bool},af_window),out,wind))
end

function af_destroy_window(wind)
    checkerror(ccall((:af_destroy_window,libaf),af_err,(af_window,),wind))
end

function af_gradient(dx,dy,_in)
    checkerror(ccall((:af_gradient,libaf),af_err,(Ptr{af_array},Ptr{af_array},af_array),dx,dy,_in))
end

function af_load_image(out,filename,isColor)
    checkerror(ccall((:af_load_image,libaf),af_err,(Ptr{af_array},Ptr{UInt8},Bool),out,filename,isColor))
end

function af_save_image(filename,_in)
    checkerror(ccall((:af_save_image,libaf),af_err,(Ptr{UInt8},af_array),filename,_in))
end

function af_load_image_memory(out,ptr)
    checkerror(ccall((:af_load_image_memory,libaf),af_err,(Ptr{af_array},Ptr{Void}),out,ptr))
end

function af_save_image_memory(ptr,_in,format)
    checkerror(ccall((:af_save_image_memory,libaf),af_err,(Ptr{Ptr{Void}},af_array,af_image_format),ptr,_in,format))
end

function af_delete_image_memory(ptr)
    checkerror(ccall((:af_delete_image_memory,libaf),af_err,(Ptr{Void},),ptr))
end

function af_load_image_native(out,filename)
    checkerror(ccall((:af_load_image_native,libaf),af_err,(Ptr{af_array},Ptr{UInt8}),out,filename))
end

function af_save_image_native(filename,_in)
    checkerror(ccall((:af_save_image_native,libaf),af_err,(Ptr{UInt8},af_array),filename,_in))
end

function af_resize(out,_in,odim0,odim1,method)
    checkerror(ccall((:af_resize,libaf),af_err,(Ptr{af_array},af_array,dim_t,dim_t,af_interp_type),out,_in,odim0,odim1,method))
end

function af_transform(out,_in,transform,odim0,odim1,method,inverse)
    checkerror(ccall((:af_transform,libaf),af_err,(Ptr{af_array},af_array,af_array,dim_t,dim_t,af_interp_type,Bool),out,_in,transform,odim0,odim1,method,inverse))
end

function af_rotate(out,_in,theta,crop,method)
    checkerror(ccall((:af_rotate,libaf),af_err,(Ptr{af_array},af_array,Cfloat,Bool,af_interp_type),out,_in,theta,crop,method))
end

function af_translate(out,_in,trans0,trans1,odim0,odim1,method)
    checkerror(ccall((:af_translate,libaf),af_err,(Ptr{af_array},af_array,Cfloat,Cfloat,dim_t,dim_t,af_interp_type),out,_in,trans0,trans1,odim0,odim1,method))
end

function af_scale(out,_in,scale0,scale1,odim0,odim1,method)
    checkerror(ccall((:af_scale,libaf),af_err,(Ptr{af_array},af_array,Cfloat,Cfloat,dim_t,dim_t,af_interp_type),out,_in,scale0,scale1,odim0,odim1,method))
end

function af_skew(out,_in,skew0,skew1,odim0,odim1,method,inverse)
    checkerror(ccall((:af_skew,libaf),af_err,(Ptr{af_array},af_array,Cfloat,Cfloat,dim_t,dim_t,af_interp_type,Bool),out,_in,skew0,skew1,odim0,odim1,method,inverse))
end

function af_histogram(out,_in,nbins,minval,maxval)
    checkerror(ccall((:af_histogram,libaf),af_err,(Ptr{af_array},af_array,UInt32,Cdouble,Cdouble),out,_in,nbins,minval,maxval))
end

function af_dilate(out,_in,mask)
    checkerror(ccall((:af_dilate,libaf),af_err,(Ptr{af_array},af_array,af_array),out,_in,mask))
end

function af_dilate3(out,_in,mask)
    checkerror(ccall((:af_dilate3,libaf),af_err,(Ptr{af_array},af_array,af_array),out,_in,mask))
end

function af_erode(out,_in,mask)
    checkerror(ccall((:af_erode,libaf),af_err,(Ptr{af_array},af_array,af_array),out,_in,mask))
end

function af_erode3(out,_in,mask)
    checkerror(ccall((:af_erode3,libaf),af_err,(Ptr{af_array},af_array,af_array),out,_in,mask))
end

function af_bilateral(out,_in,spatial_sigma,chromatic_sigma,isColor)
    checkerror(ccall((:af_bilateral,libaf),af_err,(Ptr{af_array},af_array,Cfloat,Cfloat,Bool),out,_in,spatial_sigma,chromatic_sigma,isColor))
end

function af_mean_shift(out,_in,spatial_sigma,chromatic_sigma,iter,is_color)
    checkerror(ccall((:af_mean_shift,libaf),af_err,(Ptr{af_array},af_array,Cfloat,Cfloat,UInt32,Bool),out,_in,spatial_sigma,chromatic_sigma,iter,is_color))
end

function af_medfilt(out,_in,wind_length,wind_width,edge_pad)
    checkerror(ccall((:af_medfilt,libaf),af_err,(Ptr{af_array},af_array,dim_t,dim_t,af_border_type),out,_in,wind_length,wind_width,edge_pad))
end

function af_minfilt(out,_in,wind_length,wind_width,edge_pad)
    checkerror(ccall((:af_minfilt,libaf),af_err,(Ptr{af_array},af_array,dim_t,dim_t,af_border_type),out,_in,wind_length,wind_width,edge_pad))
end

function af_maxfilt(out,_in,wind_length,wind_width,edge_pad)
    checkerror(ccall((:af_maxfilt,libaf),af_err,(Ptr{af_array},af_array,dim_t,dim_t,af_border_type),out,_in,wind_length,wind_width,edge_pad))
end

function af_regions(out,_in,connectivity,ty)
    checkerror(ccall((:af_regions,libaf),af_err,(Ptr{af_array},af_array,af_connectivity,af_dtype),out,_in,connectivity,ty))
end

function af_sobel_operator(dx,dy,img,ker_size)
    checkerror(ccall((:af_sobel_operator,libaf),af_err,(Ptr{af_array},Ptr{af_array},af_array,UInt32),dx,dy,img,ker_size))
end

function af_rgb2gray(out,_in,rPercent,gPercent,bPercent)
    checkerror(ccall((:af_rgb2gray,libaf),af_err,(Ptr{af_array},af_array,Cfloat,Cfloat,Cfloat),out,_in,rPercent,gPercent,bPercent))
end

function af_gray2rgb(out,_in,rFactor,gFactor,bFactor)
    checkerror(ccall((:af_gray2rgb,libaf),af_err,(Ptr{af_array},af_array,Cfloat,Cfloat,Cfloat),out,_in,rFactor,gFactor,bFactor))
end

function af_hist_equal(out,_in,hist)
    checkerror(ccall((:af_hist_equal,libaf),af_err,(Ptr{af_array},af_array,af_array),out,_in,hist))
end

function af_gaussian_kernel(out,rows,cols,sigma_r,sigma_c)
    checkerror(ccall((:af_gaussian_kernel,libaf),af_err,(Ptr{af_array},Cint,Cint,Cdouble,Cdouble),out,rows,cols,sigma_r,sigma_c))
end

function af_hsv2rgb(out,_in)
    checkerror(ccall((:af_hsv2rgb,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_rgb2hsv(out,_in)
    checkerror(ccall((:af_rgb2hsv,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_color_space(out,image,to,from)
    checkerror(ccall((:af_color_space,libaf),af_err,(Ptr{af_array},af_array,af_cspace_t,af_cspace_t),out,image,to,from))
end

function af_unwrap(out,_in,wx,wy,sx,sy,px,py,is_column)
    checkerror(ccall((:af_unwrap,libaf),af_err,(Ptr{af_array},af_array,dim_t,dim_t,dim_t,dim_t,dim_t,dim_t,Bool),out,_in,wx,wy,sx,sy,px,py,is_column))
end

function af_wrap(out,_in,ox,oy,wx,wy,sx,sy,px,py,is_column)
    checkerror(ccall((:af_wrap,libaf),af_err,(Ptr{af_array},af_array,dim_t,dim_t,dim_t,dim_t,dim_t,dim_t,dim_t,dim_t,Bool),out,_in,ox,oy,wx,wy,sx,sy,px,py,is_column))
end

function af_sat(out,_in)
    checkerror(ccall((:af_sat,libaf),af_err,(Ptr{af_array},af_array),out,_in))
end

function af_ycbcr2rgb(out,_in,standard)
    checkerror(ccall((:af_ycbcr2rgb,libaf),af_err,(Ptr{af_array},af_array,af_ycc_std),out,_in,standard))
end

function af_rgb2ycbcr(out,_in,standard)
    checkerror(ccall((:af_rgb2ycbcr,libaf),af_err,(Ptr{af_array},af_array,af_ycc_std),out,_in,standard))
end

function af_svd(u,s,vt,_in)
    checkerror(ccall((:af_svd,libaf),af_err,(Ptr{af_array},Ptr{af_array},Ptr{af_array},af_array),u,s,vt,_in))
end

function af_svd_inplace(u,s,vt,_in)
    checkerror(ccall((:af_svd_inplace,libaf),af_err,(Ptr{af_array},Ptr{af_array},Ptr{af_array},af_array),u,s,vt,_in))
end

function af_lu(lower,upper,pivot,_in)
    checkerror(ccall((:af_lu,libaf),af_err,(Ptr{af_array},Ptr{af_array},Ptr{af_array},af_array),lower,upper,pivot,_in))
end

function af_lu_inplace(pivot,_in,is_lapack_piv)
    checkerror(ccall((:af_lu_inplace,libaf),af_err,(Ptr{af_array},af_array,Bool),pivot,_in,is_lapack_piv))
end

function af_qr(q,r,tau,_in)
    checkerror(ccall((:af_qr,libaf),af_err,(Ptr{af_array},Ptr{af_array},Ptr{af_array},af_array),q,r,tau,_in))
end

function af_qr_inplace(tau,_in)
    checkerror(ccall((:af_qr_inplace,libaf),af_err,(Ptr{af_array},af_array),tau,_in))
end

function af_cholesky(out,info,_in,is_upper)
    checkerror(ccall((:af_cholesky,libaf),af_err,(Ptr{af_array},Ptr{Cint},af_array,Bool),out,info,_in,is_upper))
end

function af_cholesky_inplace(info,_in,is_upper)
    checkerror(ccall((:af_cholesky_inplace,libaf),af_err,(Ptr{Cint},af_array,Bool),info,_in,is_upper))
end

function af_solve(x,a,b,options)
    checkerror(ccall((:af_solve,libaf),af_err,(Ptr{af_array},af_array,af_array,af_mat_prop),x,a,b,options))
end

function af_solve_lu(x,a,piv,b,options)
    checkerror(ccall((:af_solve_lu,libaf),af_err,(Ptr{af_array},af_array,af_array,af_array,af_mat_prop),x,a,piv,b,options))
end

function af_inverse(out,_in,options)
    checkerror(ccall((:af_inverse,libaf),af_err,(Ptr{af_array},af_array,af_mat_prop),out,_in,options))
end

function af_rank(rank,_in,tol)
    checkerror(ccall((:af_rank,libaf),af_err,(Ptr{UInt32},af_array,Cdouble),rank,_in,tol))
end

function af_det(det_real,det_imag,_in)
    checkerror(ccall((:af_det,libaf),af_err,(Ptr{Cdouble},Ptr{Cdouble},af_array),det_real,det_imag,_in))
end

function af_norm(out,_in,_type,p,q)
    checkerror(ccall((:af_norm,libaf),af_err,(Ptr{Cdouble},af_array,af_norm_type,Cdouble,Cdouble),out,_in,_type,p,q))
end

function af_approx1(out,_in,pos,method,offGrid)
    checkerror(ccall((:af_approx1,libaf),af_err,(Ptr{af_array},af_array,af_array,af_interp_type,Cfloat),out,_in,pos,method,offGrid))
end

function af_approx2(out,_in,pos0,pos1,method,offGrid)
    checkerror(ccall((:af_approx2,libaf),af_err,(Ptr{af_array},af_array,af_array,af_array,af_interp_type,Cfloat),out,_in,pos0,pos1,method,offGrid))
end

function af_fft(out,_in,norm_factor,odim0)
    checkerror(ccall((:af_fft,libaf),af_err,(Ptr{af_array},af_array,Cdouble,dim_t),out,_in,norm_factor,odim0))
end

function af_fft_inplace(_in,norm_factor)
    checkerror(ccall((:af_fft_inplace,libaf),af_err,(af_array,Cdouble),_in,norm_factor))
end

function af_fft2(out,_in,norm_factor,odim0,odim1)
    checkerror(ccall((:af_fft2,libaf),af_err,(Ptr{af_array},af_array,Cdouble,dim_t,dim_t),out,_in,norm_factor,odim0,odim1))
end

function af_fft2_inplace(_in,norm_factor)
    checkerror(ccall((:af_fft2_inplace,libaf),af_err,(af_array,Cdouble),_in,norm_factor))
end

function af_fft3(out,_in,norm_factor,odim0,odim1,odim2)
    checkerror(ccall((:af_fft3,libaf),af_err,(Ptr{af_array},af_array,Cdouble,dim_t,dim_t,dim_t),out,_in,norm_factor,odim0,odim1,odim2))
end

function af_fft3_inplace(_in,norm_factor)
    checkerror(ccall((:af_fft3_inplace,libaf),af_err,(af_array,Cdouble),_in,norm_factor))
end

function af_ifft(out,_in,norm_factor,odim0)
    checkerror(ccall((:af_ifft,libaf),af_err,(Ptr{af_array},af_array,Cdouble,dim_t),out,_in,norm_factor,odim0))
end

function af_ifft_inplace(_in,norm_factor)
    checkerror(ccall((:af_ifft_inplace,libaf),af_err,(af_array,Cdouble),_in,norm_factor))
end

function af_ifft2(out,_in,norm_factor,odim0,odim1)
    checkerror(ccall((:af_ifft2,libaf),af_err,(Ptr{af_array},af_array,Cdouble,dim_t,dim_t),out,_in,norm_factor,odim0,odim1))
end

function af_ifft2_inplace(_in,norm_factor)
    checkerror(ccall((:af_ifft2_inplace,libaf),af_err,(af_array,Cdouble),_in,norm_factor))
end

function af_ifft3(out,_in,norm_factor,odim0,odim1,odim2)
    checkerror(ccall((:af_ifft3,libaf),af_err,(Ptr{af_array},af_array,Cdouble,dim_t,dim_t,dim_t),out,_in,norm_factor,odim0,odim1,odim2))
end

function af_ifft3_inplace(_in,norm_factor)
    checkerror(ccall((:af_ifft3_inplace,libaf),af_err,(af_array,Cdouble),_in,norm_factor))
end

function af_fft_r2c(out,_in,norm_factor,pad0)
    checkerror(ccall((:af_fft_r2c,libaf),af_err,(Ptr{af_array},af_array,Cdouble,dim_t),out,_in,norm_factor,pad0))
end

function af_fft2_r2c(out,_in,norm_factor,pad0,pad1)
    checkerror(ccall((:af_fft2_r2c,libaf),af_err,(Ptr{af_array},af_array,Cdouble,dim_t,dim_t),out,_in,norm_factor,pad0,pad1))
end

function af_fft3_r2c(out,_in,norm_factor,pad0,pad1,pad2)
    checkerror(ccall((:af_fft3_r2c,libaf),af_err,(Ptr{af_array},af_array,Cdouble,dim_t,dim_t,dim_t),out,_in,norm_factor,pad0,pad1,pad2))
end

function af_fft_c2r(out,_in,norm_factor,is_odd)
    checkerror(ccall((:af_fft_c2r,libaf),af_err,(Ptr{af_array},af_array,Cdouble,Bool),out,_in,norm_factor,is_odd))
end

function af_fft2_c2r(out,_in,norm_factor,is_odd)
    checkerror(ccall((:af_fft2_c2r,libaf),af_err,(Ptr{af_array},af_array,Cdouble,Bool),out,_in,norm_factor,is_odd))
end

function af_fft3_c2r(out,_in,norm_factor,is_odd)
    checkerror(ccall((:af_fft3_c2r,libaf),af_err,(Ptr{af_array},af_array,Cdouble,Bool),out,_in,norm_factor,is_odd))
end

function af_convolve1(out,signal,filter,mode,domain)
    checkerror(ccall((:af_convolve1,libaf),af_err,(Ptr{af_array},af_array,af_array,af_conv_mode,af_conv_domain),out,signal,filter,mode,domain))
end

function af_convolve2(out,signal,filter,mode,domain)
    checkerror(ccall((:af_convolve2,libaf),af_err,(Ptr{af_array},af_array,af_array,af_conv_mode,af_conv_domain),out,signal,filter,mode,domain))
end

function af_convolve3(out,signal,filter,mode,domain)
    checkerror(ccall((:af_convolve3,libaf),af_err,(Ptr{af_array},af_array,af_array,af_conv_mode,af_conv_domain),out,signal,filter,mode,domain))
end

function af_convolve2_sep(out,col_filter,row_filter,signal,mode)
    checkerror(ccall((:af_convolve2_sep,libaf),af_err,(Ptr{af_array},af_array,af_array,af_array,af_conv_mode),out,col_filter,row_filter,signal,mode))
end

function af_fft_convolve1(out,signal,filter,mode)
    checkerror(ccall((:af_fft_convolve1,libaf),af_err,(Ptr{af_array},af_array,af_array,af_conv_mode),out,signal,filter,mode))
end

function af_fft_convolve2(out,signal,filter,mode)
    checkerror(ccall((:af_fft_convolve2,libaf),af_err,(Ptr{af_array},af_array,af_array,af_conv_mode),out,signal,filter,mode))
end

function af_fft_convolve3(out,signal,filter,mode)
    checkerror(ccall((:af_fft_convolve3,libaf),af_err,(Ptr{af_array},af_array,af_array,af_conv_mode),out,signal,filter,mode))
end

function af_fir(y,b,x)
    checkerror(ccall((:af_fir,libaf),af_err,(Ptr{af_array},af_array,af_array),y,b,x))
end

function af_iir(y,b,a,x)
    checkerror(ccall((:af_iir,libaf),af_err,(Ptr{af_array},af_array,af_array,af_array),y,b,a,x))
end

function af_mean(out,_in,dim)
    checkerror(ccall((:af_mean,libaf),af_err,(Ptr{af_array},af_array,dim_t),out,_in,dim))
end

function af_mean_weighted(out,_in,weights,dim)
    checkerror(ccall((:af_mean_weighted,libaf),af_err,(Ptr{af_array},af_array,af_array,dim_t),out,_in,weights,dim))
end

function af_var(out,_in,isbiased,dim)
    checkerror(ccall((:af_var,libaf),af_err,(Ptr{af_array},af_array,Bool,dim_t),out,_in,isbiased,dim))
end

function af_var_weighted(out,_in,weights,dim)
    checkerror(ccall((:af_var_weighted,libaf),af_err,(Ptr{af_array},af_array,af_array,dim_t),out,_in,weights,dim))
end

function af_stdev(out,_in,dim)
    checkerror(ccall((:af_stdev,libaf),af_err,(Ptr{af_array},af_array,dim_t),out,_in,dim))
end

function af_cov(out,X,Y,isbiased)
    checkerror(ccall((:af_cov,libaf),af_err,(Ptr{af_array},af_array,af_array,Bool),out,X,Y,isbiased))
end

function af_median(out,_in,dim)
    checkerror(ccall((:af_median,libaf),af_err,(Ptr{af_array},af_array,dim_t),out,_in,dim))
end

function af_mean_all(real,imag,_in)
    checkerror(ccall((:af_mean_all,libaf),af_err,(Ptr{Cdouble},Ptr{Cdouble},af_array),real,imag,_in))
end

function af_mean_all_weighted(real,imag,_in,weights)
    checkerror(ccall((:af_mean_all_weighted,libaf),af_err,(Ptr{Cdouble},Ptr{Cdouble},af_array,af_array),real,imag,_in,weights))
end

function af_var_all(realVal,imagVal,_in,isbiased)
    checkerror(ccall((:af_var_all,libaf),af_err,(Ptr{Cdouble},Ptr{Cdouble},af_array,Bool),realVal,imagVal,_in,isbiased))
end

function af_var_all_weighted(realVal,imagVal,_in,weights)
    checkerror(ccall((:af_var_all_weighted,libaf),af_err,(Ptr{Cdouble},Ptr{Cdouble},af_array,af_array),realVal,imagVal,_in,weights))
end

function af_stdev_all(real,imag,_in)
    checkerror(ccall((:af_stdev_all,libaf),af_err,(Ptr{Cdouble},Ptr{Cdouble},af_array),real,imag,_in))
end

function af_median_all(realVal,imagVal,_in)
    checkerror(ccall((:af_median_all,libaf),af_err,(Ptr{Cdouble},Ptr{Cdouble},af_array),realVal,imagVal,_in))
end

function af_corrcoef(realVal,imagVal,X,Y)
    checkerror(ccall((:af_corrcoef,libaf),af_err,(Ptr{Cdouble},Ptr{Cdouble},af_array,af_array),realVal,imagVal,X,Y))
end

function af_fast(out,_in,thr,arc_length,non_max,feature_ratio,edge)
    checkerror(ccall((:af_fast,libaf),af_err,(Ptr{af_features},af_array,Cfloat,UInt32,Bool,Cfloat,UInt32),out,_in,thr,arc_length,non_max,feature_ratio,edge))
end

function af_harris(out,_in,max_corners,min_response,sigma,block_size,k_thr)
    checkerror(ccall((:af_harris,libaf),af_err,(Ptr{af_features},af_array,UInt32,Cfloat,Cfloat,UInt32,Cfloat),out,_in,max_corners,min_response,sigma,block_size,k_thr))
end

function af_orb(feat,desc,_in,fast_thr,max_feat,scl_fctr,levels,blur_img)
    checkerror(ccall((:af_orb,libaf),af_err,(Ptr{af_features},Ptr{af_array},af_array,Cfloat,UInt32,Cfloat,UInt32,Bool),feat,desc,_in,fast_thr,max_feat,scl_fctr,levels,blur_img))
end

function af_sift(feat,desc,_in,n_layers,contrast_thr,edge_thr,init_sigma,double_input,intensity_scale,feature_ratio)
    checkerror(ccall((:af_sift,libaf),af_err,(Ptr{af_features},Ptr{af_array},af_array,UInt32,Cfloat,Cfloat,Cfloat,Bool,Cfloat,Cfloat),feat,desc,_in,n_layers,contrast_thr,edge_thr,init_sigma,double_input,intensity_scale,feature_ratio))
end

function af_gloh(feat,desc,_in,n_layers,contrast_thr,edge_thr,init_sigma,double_input,intensity_scale,feature_ratio)
    checkerror(ccall((:af_gloh,libaf),af_err,(Ptr{af_features},Ptr{af_array},af_array,UInt32,Cfloat,Cfloat,Cfloat,Bool,Cfloat,Cfloat),feat,desc,_in,n_layers,contrast_thr,edge_thr,init_sigma,double_input,intensity_scale,feature_ratio))
end

function af_hamming_matcher(idx,dist,query,train,dist_dim,n_dist)
    checkerror(ccall((:af_hamming_matcher,libaf),af_err,(Ptr{af_array},Ptr{af_array},af_array,af_array,dim_t,UInt32),idx,dist,query,train,dist_dim,n_dist))
end

function af_nearest_neighbour(idx,dist,query,train,dist_dim,n_dist,dist_type)
    checkerror(ccall((:af_nearest_neighbour,libaf),af_err,(Ptr{af_array},Ptr{af_array},af_array,af_array,dim_t,UInt32,af_match_type),idx,dist,query,train,dist_dim,n_dist,dist_type))
end

function af_match_template(out,search_img,template_img,m_type)
    checkerror(ccall((:af_match_template,libaf),af_err,(Ptr{af_array},af_array,af_array,af_match_type),out,search_img,template_img,m_type))
end

function af_susan(out,_in,radius,diff_thr,geom_thr,feature_ratio,edge)
    checkerror(ccall((:af_susan,libaf),af_err,(Ptr{af_features},af_array,UInt32,Cfloat,Cfloat,Cfloat,UInt32),out,_in,radius,diff_thr,geom_thr,feature_ratio,edge))
end

function af_dog(out,_in,radius1,radius2)
    checkerror(ccall((:af_dog,libaf),af_err,(Ptr{af_array},af_array,Cint,Cint),out,_in,radius1,radius2))
end

function af_homography(H,inliers,x_src,y_src,x_dst,y_dst,htype,inlier_thr,iterations,otype)
    checkerror(ccall((:af_homography,libaf),af_err,(Ptr{af_array},Ptr{Cint},af_array,af_array,af_array,af_array,af_homography_type,Cfloat,UInt32,af_dtype),H,inliers,x_src,y_src,x_dst,y_dst,htype,inlier_thr,iterations,otype))
end
