return (path) ->
    log = (require path .. '/utils/errorlog')
    return (state) ->
        if (not state) or (type state) != 'table'
            log 'No state provided or the provided state is not a table', 1
            return nil
        result = {}
        for x = 0, 4
            for y = 0, 4
                for z = 1, 8
                    --reverse bytes from lane
                    result[8 * (x + (5 * y)) + z] = state[x][y][9 - z]
        return result