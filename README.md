# Secua

*a pure lua 5.2+ cryptography library, with support for luaJIT*

Secua is library written in moonscript that compiles directly to Lua 5.2 and 
above. It also supports LuaJIT for that added speed boost. Secua is designed
to be quick and easy to deploy, without external dependencies or the hard to distribute
LuaRocks package.

## Getting started
To get going, either clone the source here and run one of the build bash scripts
in the ./script folder or download the latest zip from the release section

Take the Secua folder in either the build or the downloaded zip and drop it into
your project. To use simply:

```lua
--This is not a typo, you do have to do it twice
secua = require('path/to/secua')('path/to/secua')

secua.aes.cbc.encrypt(
    --The data
    { 0x00, 0x12, 0x13, 0x13, 0x15, 0x11, 0x5e },
    --The key (must be 128, 192 or 256 bits)
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }
    )
```

Secua exposes all of its subfunctions including key scheduling and individual
AES steps, to access these, see the non-existent docs