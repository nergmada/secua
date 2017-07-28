return (path) ->
    reverseLane = (require path .. '/sha32/reverseLane')(path)
    return (state) ->
        result = {}
        for x = 0, 4
            for y = 0, 4
                lane = reverseLane state[x + 1][y + 1]
                for z = 1, 8
                    result[(x * 8) + (y * 40) + z] = lane[z]
        return result