return (path) ->
    stateBuilder = (require path .. '/sha3/state')(path)
    rclookup = require(path .. '/sha3/steps/rclookup')
    
    bit = (require path .. '/utils/bit')(path)
    
    return (state, index) ->
        newBytes = rclookup[index]
        stateBytes = state.getBytes!
        for i = 1, #newBytes
            stateBytes[i] = bit.bxor stateBytes[i], newBytes[(#newBytes - i) + 1]
        return stateBuilder stateBytes

