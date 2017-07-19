return (path) ->
    bit = require path .. '/utils/bit'
    log = require path .. '/utils/errorlog'
    gf = require path .. '/aes/precomputation/gfield'
    return (state) ->
        if #state != 16
            log 'the provided state is not 128 bits and therefore we cannot mix columns', 1
            return nil
        result = {}
        for i = 0, 12, 4
            result[i + 1] = bit.bxor gf[2][state[i + 1]], gf[3][state[i + 2]], state[i + 3], state[i + 4]
            result[i + 2] = bit.bxor state[i + 1], gf[2][state[i + 2]], gf[3][state[i + 3]], state[i + 4]
            result[i + 3] = bit.bxor state[i + 1], state[i + 2], gf[2][state[i + 3]], gf[3][state[i + 4]]
            result[i + 4] = bit.bxor gf[3][state[i + 1]], state[i + 2], state[i + 3], gf[3][state[i + 4]]
        return result