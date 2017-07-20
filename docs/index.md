# Secua

*a pure lua 5.2+ cryptography library, with support for luaJIT*

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
