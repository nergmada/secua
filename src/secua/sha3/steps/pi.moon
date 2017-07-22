return (path) ->
    stateBuilder = (require path .. '/sha3/state')(path)
    return (state) ->
        transmutedState = stateBuilder state.getBytes! 
        for x = 0, 4
            for y = 0, 4
                for z = 0, state.width - 1
                    transmutedState.setBit x + 1, y + 1, z + 1, state.getBit(((x + (3 * y)) % 5) + 1, x + 1, z + 1)
        return transmutedState