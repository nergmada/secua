# Secua

*a pure lua 5.2+ cryptography library, with support for luaJIT*

Secua is library written in moonscript that compiles directly to Lua 5.2 and 
above. It also supports LuaJIT for that added speed boost. Secua is designed
to be quick and easy to deploy, without external dependencies or the hard to distribute
LuaRocks package.

### Advantages

- Zero external dependencies or libraries
- runs on 5.2, 5.3 and LuaJIT
- Designed to run out of the box and be easily distributed
- Totally exposed code, so you can use as much or as little as you like
- Built with moonscript, because it's awesome

### Disadvantages
- Developed by me, not a team of expert cryptographers
- No external dependencies or libraries, so not very fast
- A weird design because it's designed to run out the box
- Built with moonscript, because it's powerful but bewildering

## Available Tools

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

## Getting Started

To use secua, either download a .zip or .tar.gz file from our releases, or clone the repo and run the build.sh moonscript.
Secua is platform independent, and so using the release files should not be any worse.

```lua
--Not a typo, you do have to provide the path twice
local secua = require('path/to/secua')('path/to/secua')
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

--What it should print:
--Warning@Secua: The data is not a multiple of 128 bits, we will automatically pad this according to PKS7
--8E10C7187151EA93C6A0587913E91F731C2C1EDD74DD6182734C9576538917B65E4CF71BAA7483AFE01B40DC144AFA157416B80EA069E833839071189BA61310
```

## Motivation

I built Secua as an experimentation with building cryptographic functions. As I will make clear here,
I do not condone or recommend using Secua in applications requiring strong security, or any security for that
matter. The MIT license under which this software is distributed specifically states

> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT

Long story short, I am not responsible for it's quality.

That said, I fully intend for Secua to be as useful as a real cryptographic library. 
I don't like bad documentation, I don't like the Lua community's lacklustre attitude to
making packages and libraries hard to include in projects and worse yet, the expectation that
people have an intimate knowledge of how to use their libraries.

If at any point you are unsure about what you find in these documents, please open an issue
and tag @nergmada. 