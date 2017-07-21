return (path) ->
    return (state) ->
        x, y = 2, 1
        for t = 0, 23
            for z = 1, state.width
                state.setBit x, y, z, (state.getBit x, y, (((z - ((t + 1)(t + 2) / 2)) - 1 % state.width) + 1))
            x, y = y, (((2 * x) + (3 * y)) - 1 % 5) + 1
        return state