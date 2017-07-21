# Secua

*a pure lua 5.2+ cryptography library, with support for luaJIT*

[![wercker status](https://app.wercker.com/status/932f418e3c5c7edaa09983d6b0c43ba0/m/master "wercker status")](https://app.wercker.com/project/byKey/932f418e3c5c7edaa09983d6b0c43ba0)

Secua is library written in moonscript that compiles directly to Lua 5.2 and 
above. It also supports LuaJIT for that added speed boost. Secua is designed
to be quick and easy to deploy, without external dependencies or the hard to distribute
LuaRocks package.

## Advantages

- Zero external dependencies or libraries
- runs on 5.2, 5.3 and LuaJIT
- Designed to run out of the box and be easily distributed
- Totally exposed code, so you can use as much or as little as you like
- Built with moonscript, because it's awesome

## Disadvantages
- Developed by me, not a team of expert cryptographers
- No external dependencies or libraries, so not very fast
- A weird design because it's designed to run out the box
- Built with moonscript, because it's powerful but bewildering

# Available Tools

- AES
    - 128 bit key
    - 192 bit key
    - 256 bit key
    - modes of operation
        - CBC
        - ECB
        - More planned
- Utilities
    - Stringify - convert bytes to String
    - bytify - convert string to bytes
    - hexify - convert bytes to hex string
    - hexBytify - convert hex string to bytes
    - Bitwise Operators compatibility - uses LuaJIT 'bit' library if available, otherwise uses bit32
    - Padding
        - PCKS 7
        - More planned

# Getting Started
```lua
--Not a typo, you do have to provide the path twice
local secua = require('path/to/secua')('path/to/secua')
-- data can be any length, but will be padded
local data = 'it\'s the ship that made the Kessel run in less than 12 parsecs'
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

--What it should print:
--Warning@Secua: The data is not a multiple of 128 bits, we will automatically pad this according to PKS7
--5B9CCA72AF19515DE92DCC2034D162DC6107AC6D8DD63D442CBB7E18A3B19FD3282D82DD553564514BB358F4A64D17ECF602D51A7929D1B872159FAF272625C4
```