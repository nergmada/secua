return (path) ->
    invsbox = require path .. '/aes/precomputation/invsbox'
    log = require path .. '/utils/errorlog'
    
    return (state) ->
        if (not state) or (type state) != 'table'
            log 'State is non-existent or not a table', 1
            return nil
        
        if #state != 16
            log 'State does not match 128 bit block size', 2
        
        result = {}
        for i = 1, #state
            result[i] = invsbox[state[i]]
        return result