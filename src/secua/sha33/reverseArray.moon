return (path) ->
    return (bytes) ->
        new = {}
        for i = 1, #bytes
            new[i] = bytes[(#bytes + 1) - i]
        return new