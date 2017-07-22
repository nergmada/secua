return (path) ->
    stateBuilder = (require path .. '/sha3/state')(path)
    return (state) ->
        transmutedState = stateBuilder state.getBytes!
        for x = 0, 4
            for y = 0, 4
                for z = 0, state.width - 1
                    axyz = state.getBit x + 1, y + 1, z + 1
                    b = not (state.getBit ((x + 1) % 5) + 1, y + 1, z + 1)
                    c = (state.getBit ((x + 2) % 5) + 1, y + 1, z + 1)
                    nbc = b and c

                    value = ((not axyz and nbc) or (axyz and not nbc))
                    transmutedState.setBit x + 1, y + 1, z + 1, value
        return transmutedState