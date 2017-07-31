return (path) ->
    pad = (require path .. '/sha3/sponge/pad')(path)
    convertToBlocks = (require path .. '/sha3/sponge/convertToBlocks')(path)
    keccakf1600 = (require path .. '/sha3/keccakf1600')(path)

    bit = (require path .. '/utils/bit')(path)
    log = (require path .. '/utils/errorlog')

    return (message, capacity, suffix, output) ->
        if (not message) or (not capacity) or (not suffix) or (not output)
            log 'one of the four required parameters is not provided', 1
            return nil
        if (type message) != 'table'
            log 'the message to hash is not a byte table', 1
            return nil
        if (type capacity) != 'number' or (type suffix) != 'number' or (type output) != 'number'
            log 'Either capacity, suffix or output provided is not a number', 1
            return nil
        if (capacity % 8 != 0) or (rate % 8 != 0)
            log 'provided capacity or rate is not a multiple of 8', 1
            return nil
        if (suffix != 0x06) and (suffix != 0x1f)
            log 'Just to let you know, the suffix provided does not match a SHAKE or SHA3 suffix', 2
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