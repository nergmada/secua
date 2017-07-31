return (path) ->
    steps = (require path .. '/sha3/keccakf1600/steps')(path)
    rclookup = require (path .. '/sha3/keccakf1600/rclookup')

    round = (state, rc) ->
        state = steps.theta state
        
        b = steps.rhopi state
        
        state = steps.chi state, b
        
        state = steps.tau state, rc 
        
        return state
    
    bytesToState = (require path .. '/sha3/utils/bytesToState')(path)
    stateToBytes = (require path .. '/sha3/utils/stateToBytes')(path)
    log = (require path .. '/utils/errorlog')
    return (bytes) ->
        if (not bytes) or (type bytes) != 'table'
            log 'No input bytes provided, or input bytes are not a table', 1
            return nil 
        if (#bytes != 200)
            log 'the provided amount of bytes is not 200, therefore a 1600 bit state transform cannot happen', 1
            return nil
        state = bytesToState bytes 
        for i = 0, 23
            round state, rclookup[i]
        return stateToBytes state