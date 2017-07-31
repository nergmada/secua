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
    
    return (bytes) ->
        state = bytesToState bytes 
        for i = 0, 23
            round state, rclookup[i]
        return stateToBytes state