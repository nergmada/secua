-- Lua doesn't do relative imports, so this code adds the top directory to
-- the require path, YOU MAY NOT NEED THIS FOR YOUR OWN CODE
local handle = io.popen('cd')
local executePath = handle:read()
package.path = executePath .. '\\?.lua;' .. executePath .. '\\?\\init.lua;' .. package.path
-- IGNORE ABOVE THIS LINE --


-- You need to drop a copy of the full secua folder into the same directory as this init

--Not a typo, you do have to provide the path twice
local secua = require('secua')('secua')
-- data can be any length, but will be padded
local data = 'it is the ship that made the Kessel run in less than 12 parsecs'
--key should be either 128, 192 or 256 bits (1 char = 1 byte, 32 chars * 8 bits = 256bits)
local key = 'except a parsec measures lengths'
--Load ECB encryption mode for AES and bytify function
local ecb, bytify, hexify = secua.aes.ecb, secua.utils.bytify, secua.utils.hexify

-- we use ecb.encrypt to encrypt and bytify to turn a string into an array of bytes
local cipherBytes = ecb.encrypt(bytify(data), bytify(key))
-- we use hexify to convert the returned bytes into a hex string
local cipherHex = hexify(cipherBytes)
-- print the hex string, because why not
print(cipherHex)

--Warning@Secua: The data is not a multiple of 128 bits, we will automatically pad this according to PKS7
--8E10C7187151EA93C6A0587913E91F731C2C1EDD74DD6182734C9576538917B65E4CF71BAA7483AFE01B40DC144AFA157416B80EA069E833839071189BA61310