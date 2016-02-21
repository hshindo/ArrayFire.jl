device_gc() = af_device_gc()

function device_mem_info()
  a_bytes = Csize_t[0]
  a_buffers = Csize_t[0]
  l_bytes = Csize_t[0]
  l_buffers = Csize_t[0]
  af_device_mem_info(a_bytes, a_buffers, l_bytes, l_buffers)
  Int(a_bytes[1]), Int(a_buffers[1]), Int(l_bytes[1]), Int(l_buffers[1])
end

function device_ptr(a::AFArray)
  p = Ptr{Void}[0]
  af_get_device_ptr(p, a)
  #finalizer(a, unlock_device_ptr)
  p[1]
end

function mem_stepsize()
  p = Csize_t[0]
  af_get_mem_step_size(p)
  Int(p[1])
end

lock_device_ptr(a::AFArray) = af_lock_device_ptr(a)

unlock_device_ptr(a::AFArray) = af_unlock_device_ptr(a)

set_mem_stepsize(bytes::Int) = af_set_mem_step_size(bytes)

free_device(a::AFArray) = af_free_device(a)

function device_count()
  p = Cint[0]
  af_get_device_count(p)
  Int(p[1])
end

function device_info()
  name = UInt8[0]
  platform = UInt8[0]
  toolkit = UInt8[0]
  compute = UInt8[0]
  af_device_info(name, platform, toolkit, compute)
  bytestring(name), bytestring(platform)
  #error("Not implemented yet.")
end

function getdevice(device::Int)
  p = Cint[0]
  af_get_device(p)
  Int(p[1])
end

setdevice(device::Int) = af_set_device(device)

sync(device::Int=-1) = af_sync(device)

function available_backends()
  p = Cint[0]
  af_get_available_backends(p)
  v = Int(p[1])
  cpu = (v & AF_BACKEND_CPU) == 0 ? "off" : "on"
  cuda = (v & AF_BACKEND_CUDA) == 0 ? "off" : "on"
  opencl = (v & AF_BACKEND_OPENCL) == 0 ? "off" : "on"
  "cpu:$(cpu), cuda:$(cuda), opencl:$(opencl)"
end

function set_backend(str::ASCIIString)
  if str == "cpu"
    b = AF_BACKEND_CPU
  elseif str == "cuda"
    b = AF_BACKEND_CUDA
  elseif str == "opencl"
    b = AF_BACKEND_OPENCL
  else
    throw("No backend: $(str)")
  end
  af_set_backend(b)
end
