return (path) ->
    pad = (require path .. '/sha3/sponge/pad')(path)
    convertToBlocks = (require path .. '/sha3/sponge/convertToBlocks')(path)
    keccakf1600 = (require path .. '/sha3/keccakf1600')(path)

    bit = (require path .. '/utils/bit')(path)

    return (message, capacity, suffix, output) ->
        rate = 1600 - capacity
        byteRate, byteCapacity = rate / 8, capacity / 8

        paddedmessage = pad message, byteRate, suffix

        blocks = convertToBlocks paddedmessage, byteRate

        -- bind blocks to right
        state = [ 0x00 for i = 1, 200]
        
        for block = 1, #blocks
            state = [bit.bxor state[i], blocks[block][i] for i = 1, 200]
            state = keccakf1600 state

        --change 1: truncate from the right
        z = [byte for byte in *state[1, byteRate]]
        
        while not (#z >= (output / 8))
            state = keccakf1600 state
            for i = 1, byteRate
                table.insert z, state[i]
        
        return [byte for byte in *z[1, output / 8]]