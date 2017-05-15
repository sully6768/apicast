local ffi = require 'ffi'


local C = ffi.C
local typeof = ffi.typeof

ffi.cdef([[
int execve(const char *filename, const char *argv[], const char *envp[]);
int execvp(const char *file, const char *argv[]);
]])


-- used for no return value, return true for use of assert
local function retbool(ret)
  if ret == -1 then return nil, ffi.errno() end
  return true
end

local string_array_t = typeof("const char *[?]")

local function execvp(filename, argv)
  local cargv = string_array_t(#argv + 1, argv)
  cargv[#argv] = nil -- LuaJIT does not zero rest of a VLA
  return retbool(C.execvp(filename, cargv))
end

print('lua')
local ok, err = execvp('/bin/bash', { '-l' }, {})

print(ok, err)
print('after')
