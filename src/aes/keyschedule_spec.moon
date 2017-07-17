directory = io.popen('cd')\read!
package.path = directory .. '/?.lua;' .. directory .. '/?/init.lua;' .. package.path

keyschedule = (require 'secua-build')('secua-build').aes.keyschedule

result = keyschedule { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }

for byte in *result
    print byte