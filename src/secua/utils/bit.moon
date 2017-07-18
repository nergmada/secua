jitstatus, bit = pcall(require, 'bit')

if not jitstatus
    bit = require 'bit32'
    --Are you Crashing here? You're probably not running 5.2+ or LuaJIT
return {
    bnot: bit.bnot
    bor: bit.bor
    band: bit.band
    bxor: bit.bxor
    lshift: bit.lshift
    rshift: bit.rshift
    arshift: bit.arshift
    rol: (x, n) ->
        if jitstatus
            return bit.rol x, n
        else
            return bit.lrotate x, n
    ror: (x, n) ->
        if jitstatus
            return bit.ror x, n
        else
            return bit.rrotate x, n
}