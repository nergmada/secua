local directory = io.popen('cd'):read()
package.path = directory .. '/?.lua;' .. directory .. '/?/init.lua;' .. package.path
local utils_tests = require('secua/utils/init_spec')
local aes_tests = require('secua/aes/init_spec')
print('running utils tests')
utils_tests()
print('running aes tests')
return aes_tests()
