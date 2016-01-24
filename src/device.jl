# af_device_gc
# af_get_mem_step_size
# af_set_mem_step_size
#

function device_ptr(a::AFArray)
  p = Ptr{Void}[0]
  af_get_device_ptr(p, a.ptr)
  p[1]
end

lock(a::AFArray) = af_lock_device_ptr(a.ptr)
unlock(a::AFArray) = af_unlock_device_ptr(a.ptr)

function device_mem_info(a::AFArray)
  alloc_bytes = Csize_t[0]
  alloc_buffers = Csize_t[0]
  lock_bytes = Csize_t[0]
  lock_buffers = Csize_t[0]
  af_device_mem_info(alloc_bytes, alloc_buffers, lock_bytes, lock_buffers)
  Int(alloc_bytes[1]), Int(alloc_buffers[1]), Int(lock_bytes[1]), Int(lock_buffers[1])
end

function free(a::AFArray)
  if a.ptr != C_NULL
    af_free_device(a.ptr)
    a.ptr = C_NULL
  end
end
