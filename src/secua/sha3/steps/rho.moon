return (path) ->
    stateBuilder = (require path .. '/sha3/state')(path)
    return (state) ->
        transmutedState = stateBuilder state.getBytes! 
        x, y = 1, 0
        for t = 0, 23
            for z = 0, state.width - 1
                transmutedState.setBit x + 1, y + 1, z + 1, (state.getBit x + 1, y + 1, ((((z - ((t + 1) * (t + 2) / 2))) % state.width)) + 1)
            x, y = y, ((((2 * x) + (3 * y))) % 5)
        return transmutedState