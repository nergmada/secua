return (path) ->
    log = (require path .. '/utils/errorlog')
    return (lane, distance) ->
        if (not lane) or (not distance) or (type lane) != 'table' or (type distance) != 'number'
            log 'provided lane or rotation distance not valid or nonexistent', 1
            print lane
            print distance
            return nil
        
        distance = distance % (#lane * 8)
        byteDistance = math.floor(distance / 8)
        bitDistance = distance % 8

        newLane = {}
        for i = 1, #lane
            newLane[((i - (byteDistance + 1)) % #lane) + 1] = lane[i]
        
        bitRotLane = {}
        addValue = 0
        prevAddValue = 0
        for i = #newLane, 1, -1
            currentByte = newLane[i]
            
            for j = 7, 8 - bitDistance, -1
                if currentByte >= math.pow 2, j
                    addValue = addValue + math.pow 2, (j + bitDistance) % 8
                    currentByte = currentByte - math.pow 2, j
            
            currentByte = currentByte * math.pow 2, bitDistance
            currentByte = currentByte + prevAddValue
            bitRotLane[i] = currentByte
            
            prevAddValue = addValue
            addValue = 0
        
        bitRotLane[#bitRotLane] = bitRotLane[#bitRotLane] + prevAddValue
        
        return bitRotLane
        --input = ''
        --for byte in *lane
        --    for i = 7, 0, -1
        --        v = math.pow(2, i)
        --        if byte >= v
        --            input = input .. '1'
        --            byte = byte - v
        --        else
        --            input = input .. '0'
        --
        --bitLength = input\len!
        --bitend = input\sub distance + 1, bitLength
        --bitstart = (input\sub 1, distance)
        --output = bitend .. bitstart

        --result = {}
        --for byte = 0, #lane - 1
        --    outByte = 0
        --    
        --    for bit = 1, 8
        --        index = ((byte * 8) + bit)
        --        if (output\sub index, index) == '1'
        --            outByte = outByte + (math.pow 2, 8 - bit)
        --    
        --    result[byte + 1] = outByte
        --return result