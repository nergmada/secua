return (path) ->
    reverseAndPad = (require path .. '/sha33/reverseAndPad')(path)
    keccakf1600 = (require path .. '/sha33/keccakf1600')(path)
    convertByte = (require path .. '/sha33/convertByte')(path)

    bit = (require path .. '/utils/bit')(path)
    return (message, digestLength) ->
        capacity = digestLength * 2
        byteCapacity = capacity / 8
        rate = 1600 - capacity
        byteRate = rate / 8

        paddedmessage = reverseAndPad message, byteRate

        messageBlocks = {}
        for i = 0, (#paddedmessage / byteRate) - 1
            messageBlocks[i + 1] = [byte for byte in *paddedmessage[(i * byteRate) + 1, ((i + 1) * byteRate)]]
        
        for i = 1, #messageBlocks
            for j = 1, byteCapacity
                table.insert messageBlocks[i], 0x00

        state = [ 0x00 for i = 1, 200]    

        for block = 1, #messageBlocks
            state = [(bit.bxor state[i], messageBlocks[block][i]) for i = 1, 200]
            print #state
            state = keccakf1600 state
        
        z = [byte for byte in *state[1, byteRate]]

        while not (#z >= (digestLength / 8))
            state = keccakf1600 state
            for i = 1, byteRate
                table.insert z, state[i]
        return [(convertByte byte) for byte in *z[1, digestLength / 8]]