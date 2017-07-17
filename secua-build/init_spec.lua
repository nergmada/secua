local directory = io.popen('cd'):read()
package.path = directory .. '/?.lua;' .. directory .. '/?/init.lua;' .. package.path
local utils_tests = require('secua/utils/init_spec')
print('running utils tests')
return utils_tests()
