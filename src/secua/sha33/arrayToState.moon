return (path) ->
    log = (require path .. '/utils/errorlog')
    return (bytes) ->
        if (not bytes) or (type bytes) != 'table'
            log 'input is not a table or non existent', 1
            return nil
        if #bytes != 200
            log 'input is not 200 bytes long (1600 bits)', 1
            return nil
        result = {}
        for x = 0, 4
            result[x + 1] = {}
            for y = 0, 4
                result[x + 1][y + 1] = {}
                for z = 1, 8
                    result[x + 1][y + 1][z] = bytes[(x * 8) + (y * 40) + (9 - z)]
        return result