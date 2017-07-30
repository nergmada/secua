return (path) ->
    return (state) ->
        result = {}
        for x = 0, 4
            for y = 0, 4
                for z = 1, 8
                    --reverse bytes from lane
                    result[8 * (x + (5 * y)) + z] = state[x][y][9 - z]
        return result