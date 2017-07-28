return (path) ->
    return (byte) ->
        result = 0
        for i = 7, 0, -1
            if byte >= math.pow(2, i)
                byte = byte - math.pow(2, i)
            else 
                result = result + math.pow(2, i)
        return result