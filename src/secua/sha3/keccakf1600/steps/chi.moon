return (path) ->
    byteNot = (require path .. '/sha3/utils/byteNot')(path)
    bit = (require path .. '/utils/bit')(path)
    return (state, b) ->
        --chi
        for x = 0, 4
            for y = 0, 4
                first = b[x][y]
                second = b[(x + 1) % 5][y]
                third = b[(x + 2) % 5][y]
                state[x][y] = [bit.bxor first[z], (bit.band (byteNot second[z]), third[z]) for z = 1, 8]
        return state