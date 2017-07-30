return (path) ->
    bytesToState = (require path .. '/sha3/bytesToState')(path)
    stateToBytes = (require path .. '/sha3/stateToBytes')(path)
    byteRot = (require path .. '/sha3/byteRot')(path)
    byteNot = (require path .. '/sha3/byteNot')(path)

    rclookup = require (path .. '/sha3/rclookup')
    rlookup = require (path .. '/sha3/rlookup')

    bit = (require path .. '/utils/bit')(path)
    dumpState = (require path .. '/sha3/dumpState')(path)

    round = (state, rc) ->
        --theta
        c = {}
        for x = 0, 4
            c[x] = {}
            for z = 1, 8
                c[x][z] = bit.bxor state[x][0][z], state[x][1][z], state[x][2][z], state[x][3][z], state[x][4][z]
        
        d = {}
        for x = 0, 4
            left = c[(x - 1) % 5]
            right = byteRot c[(x + 1) % 5], 1
            d[x] = [bit.bxor left[z], right[z] for z = 1, 8]
        
        for x = 0, 4
            for y = 0, 4
                state[x][y] = [bit.bxor state[x][y][z], d[x][z] for z = 1, 8]
        
        --rho and pi 
        b = {}
        for x = 0, 4
            b[x] = {}
        for x = 0, 4
            for y = 0, 4
                b[y][((2 * x) + (3 * y)) % 5] = byteRot(state[x][y], rlookup[x][y])

        --chi
        for x = 0, 4
            for y = 0, 4
                first = b[x][y]
                second = b[(x + 1) % 5][y]
                third = b[(x + 2) % 5][y]
                state[x][y] = [bit.bxor first[z], (bit.band (byteNot second[z]), third[z]) for z = 1, 8]

        state[0][0] = [bit.bxor state[0][0][z], rc[z] for z = 1, 8]

        return state
    return (bytes) ->
        state = bytesToState bytes 
        for i = 0, 23
            round state, rclookup[i]
        return stateToBytes state