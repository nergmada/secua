directory = io.popen('cd')\read!
package.path = directory .. '/?.lua;' .. directory .. '/?/init.lua;' .. package.path

utils_tests = require 'secua-build/utils/init_spec'

print 'running utils tests'
utils_tests!