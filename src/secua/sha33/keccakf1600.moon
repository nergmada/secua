return (path) ->
    
    arrayToState = (require path .. '/sha33/arrayToState')(path)
    stateToArray = (require path .. '/sha33/stateToArray')(path)
    reverseArray = (require path .. '/sha33/reverseArray')(path)
    convertByte = (require path .. '/sha33/convertByte')(path)
    rot = (require path .. '/sha33/byteRot')(path)
    rclookup = (require path .. '/sha33/rclookup')
    rlookup = (require path .. '/sha33/rlookup')
    bit = (require path .. '/utils/bit')(path)

    round = (state, rc) ->
        --theta
        c = {}
        for x = 1, 5
            c[x] = [(bit.bxor state[x][1][z], state[x][2][z], state[x][3][z], state[x][4][z], state[x][5][z]) for z = 1, 8]

        d = {}
        for x = 0, 4
            left = c[((x - 1) % 5) + 1]
            right = rot(c[((x + 1) % 5) + 1], 1)
            d[x + 1] = [(bit.bxor left[i], right[i]) for i = 1, 8]
        
        for x = 1, 5
            for y = 1, 5
                state[x][y] = [(bit.bxor state[x][y][i], d[x][i]) for i = 1, 8]
        
        --rho and pi
        b = [{} for i = 1, 5]
        for x = 0, 4
            for y = 0, 4
                b[y + 1][(((2 * x) + (3 * y)) % 5) + 1] = (rot state[x + 1][y + 1], rlookup[x][y])
    
        --chi 
        for x = 0, 4
            for y = 0, 4
                first = b[x + 1][y + 1]
                second = b[((x + 1) % 5) + 1][y + 1]
                third = b[((x + 2) % 5) + 1][y + 1]
                state[x + 1][y + 1] = [(bit.bxor first[z], (bit.band (bit.bnot second[z]), third[z])) for z = 1, 8]
        
        --tau 
        state[1][1] = [(bit.bxor state[1][1][z], rc[z]) for z = 1, 8]
        
        return state
    return (bytes) ->
        state = arrayToState bytes
        for i = 0, 23
            state = round state, reverseArray [convertByte byte for byte in *rclookup[i]]
        return stateToArray state