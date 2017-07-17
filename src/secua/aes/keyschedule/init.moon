return (path) ->
    bit = require 'bit'
    sbox = require path .. '/sbox'
    rcon = require path .. '/rcon'
    keyScheduleCore = (input, iteration) ->
        output = {}
        output[1], output[2], output[3], output[4] = sbox[input[2]], sbox[input[3]], sbox[input[4]], sbox[input[1]]
        output[1] = bit.bxor output[1], rcon[iteration]
        return output
    return (key) ->
        expandedKey = {}
        n, b = nil, nil
        if #key == 128 / 8
            n, b = 16, 176
        elseif #key == 192 / 8
            n, b = 24, 208
        elseif #key == 256 / 8
            n, b = 32, 240
        else
            print 'Error'
            return nil
        for i = 1, #key
            expandedKey[i] = key[i]
        rconi = 1
        while #expandedKey != b
            t = [byte for byte in *expandedKey[#expandedKey - 3,]]
            t = keyScheduleCore t, rconi
            rconi = rconi + 1
            for j = 1, 4
                for i = 1, 4
                    t[i] = bit.bxor t[i], expandedKey[(#expandedKey + 1) - n]
                    table.insert expandedKey, t[i]
            if #key == 256 / 8
                for i = 1, 4
                    t[i] = sbox[t[i]]
                    t[i] = bit.bxor t[i], expandedKey[(#expandedKey + 1) - n]
                    table.insert expandedKey, t[i]
            if #key == 192 / 8
                for j = 1, 2
                    for i = 1, 4
                        t[i] = bit.bxor t[i], expandedKey[(#expandedKey + 1) - n]
                        table.insert expandedKey, t[i]
            elseif #key == 256 / 8
                for j = 1, 3
                    for i = 1, 4
                        t[i] = bit.bxor t[i], expandedKey[(#expandedKey + 1) - n]
                        table.insert expandedKey, t[i]
        return expandedKey
    