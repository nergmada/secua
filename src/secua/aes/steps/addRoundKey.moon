return (path) ->
    bit = require path .. '/utils/bit'
    log = require path .. '/utils/errorlog'
    return (state, subkey) ->
        if (not state) or (not subkey) or (type state) != 'table' or (type subkey) != 'table'
            log 'One argument has either not be provided, or is not a table', 1
            return nil
        if #state != #subkey
            log 'Block size and subkey size do not match', 1
            return nil
        
        if #subkey != 16
            log 'Block size is not 128 bits', 2
        
        result = {}
        for i = 1, #subkey
            result[i] = bit.bxor state[i], subkey[i]
        
        return result