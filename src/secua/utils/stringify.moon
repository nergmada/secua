return (path) ->
    log = (require path .. '/utils/errorlog')
    return (bytes) ->
        if (not bytes)
            log 'nothing to stringify, seriously? I am not psychic', 1
            return nil
        
        if (type bytes) != 'table'
            log 'Cannot bytify, argument is not a string', 1
            return nil
        result = ''
        for byte in *bytes
            result = result .. string.char byte
        return result