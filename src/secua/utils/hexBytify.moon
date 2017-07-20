return (path) ->
    log = require path .. '/utils/errorlog'
    return (hexstr) ->
        if (not hexstr)
            log 'nothing to hexBytify, seriously? I am not psychic', 1
            return nil
        
        if (type hexstr) != 'string'
            log 'Cannot hexBytify, argument is not a string', 1
            return nil
        result = {}
        for hexByte in hexstr\gmatch('..')
            table.insert result, tonumber hexByte, 16
        return result