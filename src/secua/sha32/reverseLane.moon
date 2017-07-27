return (path) ->
    return (lane) ->
        newLane = {}
        for i = 1, 8
            newLane[i] = lane[9 - i]
        return newLane