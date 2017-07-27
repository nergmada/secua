return (path) ->
    pad01101 = (require path .. '/sha32/pad01101')(path)
    bytesToState = (require path .. '/sha32/state')(path)
    stateToBytes = (require path .. '/sha32/stateToBytes')(path)
    keccakf1600 = (require path .. '/sha32/keccakf1600')(path)
    reverseLane = (require path .. '/sha32/reverseLane')(path)

    dumpState = (require path .. '/sha32/dumpState')(path)

    bit = (require path .. '/utils/bit')(path)

    return (message, digestLength) ->
        capacity = 2 * digestLength
        byteCapacity = capacity / 8
        rate = 1600 - capacity
        byteRate = rate / 8
        print 'rate: ' .. rate .. ' capacity: ' .. capacity
        paddedmessage = pad01101 rate, message

        messageBlocks = {}
        for i = 0, (#paddedmessage / byteRate) - 1
            messageBlocks[i + 1] = [byte for byte in *paddedmessage[(i * byteRate) + 1, ((i + 1) * byteRate)]]
        
        state = [ 0x00 for i = 1, 200]

        for i = 1, #messageBlocks
            for j = 1, byteCapacity
                table.insert messageBlocks[i], 0x00

        state = bytesToState state
        for i = 1, #messageBlocks
            for x = 0, 4
                for y = 0, 4
                    messageLane = reverseLane [byte for byte in *messageBlocks[i][(x * 8) + (y * 40) + 1, (x * 8) + (y * 40) + 8]]
                    lan = '{ '
                    for _, byte in ipairs messageLane
                        lan = lan .. byte .. ', '
                    print 'x: ' .. x .. ' y: ' .. y .. ' lane: ' .. lan .. ' }'
                    for z = 1, 8
                        state[x + 1][y + 1][z] = bit.bxor state[x + 1][y + 1][z], messageLane[z]
            state = keccakf1600 state
        
        state = stateToBytes state
        z = [byte for byte in *state[1, byteRate]]
        
        while not (#z >= (digestLength / 8))
            print 'here'
            state = stateToBytes keccakf1600 bytesToState state
            for i = 1, byteRate
                table.insert z, state[i]
        return [byte for byte in *z[1, digestLength / 8]]