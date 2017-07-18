return (path) ->
    sbox = require path .. '/aes/precomputation/sbox'
    log = require path .. 'utils/errorlog'
    return (state) ->
        if #state != 16
            log 'State does not match 128 bit block size', 2
        result = {}
        for i = 1, #state
            result[i] = sbox[state[i]]