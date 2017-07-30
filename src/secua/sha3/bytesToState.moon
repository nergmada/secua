return (path) ->
    return (bytes) ->
        result = {}
        for x = 0, 4
            result[x] = {}
            for y = 0, 4
                --reverse bytes going into state
                result[x][y] = [bytes[i] for i = 8 * ((5 * y) + x) + 8, 8 * ((5 * y) + x) + 1, -1]
        return result