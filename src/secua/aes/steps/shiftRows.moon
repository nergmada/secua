return (path) ->
    log = require path .. '/utils/errorlog'
    return (state) ->
        if (not state) or (type state) != 'table'
            log 'state does not exist or is not a table', 1
            return nil
        
        if #state != 16
            log 'state cannot be shifted, does not match 128 bit block size', 1
            return nil
        
        return {
            state[1], state[6], state[11], state[16], 
            state[5], state[10], state[15], state[4],
            state[9], state[14], state[3], state[8],
            state[13], state[2], state[7], state[12] 
        }