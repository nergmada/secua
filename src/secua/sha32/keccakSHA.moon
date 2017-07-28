return (path) ->
    pad01101 = (require path .. '/sha32/pad01101')(path)
    keccakf1600 = (require path .. '/sha32/keccakf1600')(path)
    reverseLane = (require path .. '/sha32/reverseLane')(path)

    bit = (require path .. '/utils/bit')(path)

    return (message, digestLength) ->
        capacity = 2 * digestLength
        byteCapacity = capacity / 8
        rate = 1600 - capacity
        byteRate = rate / 8
        paddedmessage = pad01101 rate, message

        messageBlocks = {}
        for i = 0, (#paddedmessage / byteRate) - 1
            messageBlocks[i + 1] = [byte for byte in *paddedmessage[(i * byteRate) + 1, ((i + 1) * byteRate)]]
        state = [ 0x00 for i = 1, 200]

        for i = 1, #messageBlocks
            for j = 1, byteCapacity
                table.insert messageBlocks[i], 0x00
        for i = 1, #messageBlocks
            state = [(bit.bxor messageBlocks[i][z], state[z]) for z = 1, 200]
            
            state = keccakf1600 state
        
        z = [byte for byte in *state[1, byteRate]]
        
        while not (#z >= (digestLength / 8))
            state = keccakf1600 state
            for i = 1, byteRate
                table.insert z, state[i]
        return [byte for byte in *z[1, digestLength / 8]]