return (path) ->
    return (lane, distance) ->
        distance = distance % (#lane * 8)
        input = ''
        for byte in *lane
            for i = 7, 0, -1
                v = math.pow(2, i)
                if byte >= v
                    input = input .. '1'
                    byte = byte - v
                else
                    input = input .. '0'
        
        bitLength = input\len!
        bitend = input\sub (bitLength - distance) + 1, bitLength
        bitstart = (input\sub 1, bitLength - distance)
        output = bitend .. bitstart

        result = {}
        for byte = 0, #lane - 1
            outByte = 0
            
            for bit = 1, 8
                index = ((byte * 8) + bit)
                if (output\sub index, index) == '1'
                    outByte = outByte + (math.pow 2, 8 - bit)
            
            result[byte + 1] = outByte
        return result