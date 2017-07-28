return (path) ->
    bytesToState = (require path .. '/sha32/state')(path)
    stateToBytes = (require path .. '/sha32/stateToBytes')(path)
    rclookup = (require path .. '/sha32/rclookup')
    rlookup = (require path .. '/sha32/rlookup')
    rot = (require path .. '/sha32/byteRot')(path)
    byteNot = (require path .. '/sha32/byteNot')(path)

    dumpState = (require path .. '/sha32/dumpState')(path)

    log = (require path .. '/utils/errorlog')
    bit = (require path .. '/utils/bit')(path)

    round = (state, rc) ->
        --Theta
        c = {}
        ----Plane creation
        for x = 1, 5
            c[x] = {}
            for z = 1, 8
                c[x][z] = bit.bxor state[x][1][z], state[x][2][z], state[x][3][z], state[x][4][z], state[x][5][z]

        ----Plane crushing
        d = {}
        for x = 0, 4
            d[x + 1] = {}
            a = c[((x - 1) % 5) + 1]
            b = rot(c[((x + 1) % 5) + 1], 1)
            for i = 1, #b
                d[x + 1][i] = bit.bxor a[i], b[i]
        ----Merge with state
        for x = 1, 5
            for y = 1, 5
                for z = 1, #d[x]
                    state[x][y][z] = bit.bxor state[x][y][z], d[x][z]
        --Rho & Pi steps
        b = {}
        for x = 0, 4
            b[x + 1] = {}
            for y = 0, 4
                b[x + 1][(((2 * x) + (3 * y)) % 5) + 1] = rot(state[x + 1][y + 1], rlookup[x][y])
        
        --Chi step
        for x = 0, 4
            for y = 0, 4
                p = b[x + 1][y + 1]
                
                q = b[((x + 1) % 5) + 1][y + 1]
                r = b[((x + 2) % 5) + 1][y + 1]
                for z = 1, #p
                    state[x + 1][y + 1][z] = bit.bxor p[z], (bit.band (byteNot q[z]), r[z]) 

        --tau
        for z = 1, #state[1][1]
            state[1][1][z] = bit.bxor state[1][1][z], rc[z]
        
        return state

    return (bytes) ->
        state = bytesToState bytes
        dumpState state
        for i = 0, 23
            state = round state, rclookup[i]
        dumpState state
        return stateToBytes state