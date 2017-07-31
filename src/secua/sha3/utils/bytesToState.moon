return (path) ->
    log = (require path .. '/utils/errorlog')
    return (bytes) ->
        if (not bytes) or (type bytes) != 'table'
            log 'Provided byte array is not a table or nonexistent', 1
            return nil
        result = {}
        for x = 0, 4
            result[x] = {}
            for y = 0, 4
                --reverse bytes going into state
                result[x][y] = [bytes[i] for i = 8 * ((5 * y) + x) + 8, 8 * ((5 * y) + x) + 1, -1]
        return result