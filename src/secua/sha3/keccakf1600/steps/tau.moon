return (path) ->
    bit = (require path .. '/utils/bit')(path)
    return (state, rc) ->
        state[0][0] = [bit.bxor state[0][0][z], rc[z] for z = 1, 8]
        return state