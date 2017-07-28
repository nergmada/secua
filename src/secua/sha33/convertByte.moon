return (path) ->
    return (byte) ->
        new = 0
        for i = 7, 0, -1
            if byte >= math.pow 2, i 
                new = new + math.pow 2, 7 - i
                byte = byte - math.pow 2, i
        return new