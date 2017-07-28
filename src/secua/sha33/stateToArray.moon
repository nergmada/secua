return (path) ->
    return (state) ->
        result = {}
        for x = 0, 4
            for y = 0, 4
                for z = 1, 8
                    result[(x * 8) + (y * 40) + z] = state[x + 1][y + 1][9 - z]
        return result