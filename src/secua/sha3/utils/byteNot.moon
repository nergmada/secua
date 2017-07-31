return (path) ->
    log = (require path .. '/utils/errorlog')
    return (byte) ->
        if (not byte) or (type byte) != 'number'
            log 'No byte provided or byte is not a number', 1
            return nil
        if byte < 0 or byte > 255
            log 'Byte is not a byte, (i.e. not in range 0 - 255), behaviour uncertain', 2
        result = 0
        for i = 7, 0, -1
            if byte >= math.pow(2, i)
                byte = byte - math.pow(2, i)
            else 
                result = result + math.pow(2, i)
        return result