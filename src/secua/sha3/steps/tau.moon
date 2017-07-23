return (path) ->
    rclookup = require(path .. '/sha3/steps/rclookup')
    return (state, index) ->
        rc = [false for i = 1, state.width]
        for j = 0, math.log(state.width, 2)
            rc[math.pow(2, j)] = rclookup[(j + (7 * index)) % 255]
        for z = 1, state.width
            sv = state.getBit 1, 1, z
            rcv = rc[z]
            newValue = ((not sv) and rcv) or (sv and (not rcv))
            state.setBit 1, 1, z, newValue
        return state