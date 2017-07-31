return (path) ->
    byteRot = (require path .. '/sha3/utils/byteRot')(path)
    rlookup = require (path .. '/sha3/keccakf1600/steps/rlookup')
    return (state) ->
        --rho and pi 
        b = {}
        for x = 0, 4
            b[x] = {}
        for x = 0, 4
            for y = 0, 4
                b[y][((2 * x) + (3 * y)) % 5] = byteRot(state[x][y], rlookup[x][y])
        return b