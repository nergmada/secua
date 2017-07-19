return (path) ->
    bit = require path .. '/utils/bit'
    log = require path .. '/utils/errorlog'
    gf = require path .. '/aes/precomputation/gfield'
    return (state) ->
        if (not state) or (type state) != 'table'
            log 'the provided state does not exist or is not a table', 1
            return nil
        
        if #state != 16
            log 'the provided state is not 128 bits and therefore we cannot mix columns', 1
            return nil
        
        result = {}
        for i = 0, 12, 4
            result[i + 1] = bit.bxor gf[14][state[i + 1]], gf[11][state[i + 2]], gf[13][state[i + 3]], gf[9][state[i + 4]]
            result[i + 2] = bit.bxor gf[9][state[i + 1]], gf[14][state[i + 2]], gf[11][state[i + 3]], gf[13][state[i + 4]]
            result[i + 3] = bit.bxor gf[13][state[i + 1]], gf[9][state[i + 2]], gf[14][state[i + 3]], gf[11][state[i + 4]]
            result[i + 4] = bit.bxor gf[11][state[i + 1]], gf[13][state[i + 2]], gf[9][state[i + 3]], gf[14][state[i + 4]]
        return result