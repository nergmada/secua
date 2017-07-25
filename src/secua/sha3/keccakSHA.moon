return (path) ->
    pad101 = (require path .. '/sha3/pad101')(path)
    keccak1600 = (require path .. '/sha3/keccak1600')(path)
    bit = (require path .. '/utils/bit')(path)

    return (message, length) ->
        -- calculate rate and capacity
        capacity = length * 2
        rate = 1600 - capacity
        -- pad message including 2bit suffix (message||01)
        paddedmessage = pad101 rate, message
        --number of iterations to soak up data
        n = (#paddedmessage * 8) / rate
        -- the rate as a number of bytes
        byteRate = rate / 8
        -- the state of 1600 bits as zeros
        state = [ 0x00 for i = 1, 200]
        -- the capacity that has to be attached to the end of each submessage
        capBytes = [ 0x00 for i = 1, capacity / 8 ]
        -- for each block of the message
        for i = 0, n - 1
            --get the submessage
            submessage = [byte for byte in *paddedmessage[(i * byteRate) + 1, ((i + 1) * byteRate)]]
            --attach the zero bytes to the end to make it 1600 bits
            for byte in *capBytes
                table.insert submessage, byte
            -- xor the submessage against the current statw
            for i = 1, #state
                state[i] = bit.bxor state[i], submessage[i]
            -- pass the state through keccak 1600
            state = keccak1600 state
        
        -- get the result as a sub amount of the rate 
        result = {} 
        while not ((length / 8) <= #result)
            for byte in *state[1, rate / 8]
                table.insert result, byte
            state = keccak1600 state
        return [byte for byte in *result[1, length / 8]]