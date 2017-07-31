return (path) ->
    byteRot = (require path .. '/sha3/utils/byteRot')(path)
    bit = (require path .. '/utils/bit')(path)
    return (state) ->
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
        
        return state