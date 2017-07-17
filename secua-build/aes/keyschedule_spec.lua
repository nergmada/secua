local directory = io.popen('cd'):read()
package.path = directory .. '/?.lua;' .. directory .. '/?/init.lua;' .. package.path
local keyschedule = (require('secua-build'))('secua-build').aes.keyschedule
local result = keyschedule({
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00
})
for _index_0 = 1, #result do
  local byte = result[_index_0]
  print(byte)
end
