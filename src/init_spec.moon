directory = io.popen('cd')\read!
package.path = directory .. '/?.lua;' .. directory .. '/?/init.lua;' .. package.path


utils_tests = require 'secua/utils/init_spec'
aes_tests = require 'secua/aes/init_spec'

print 'running utils tests'
utils_tests!

print 'running aes tests'
aes_tests!