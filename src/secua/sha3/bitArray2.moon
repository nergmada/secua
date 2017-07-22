return (path) ->
    bit = (require path .. '/utils/bit')(path)
    return (laneArray, laneLength) ->
        lanes = [lane for lane in *laneArray]
        byteLength = laneLength / 8
        
        setBit = (index, value) ->
            laneIndex = math.ceil index / laneLength
            lanes[laneIndex] = bit.setBit lanes[laneIndex], ((index - 1) % laneLength) + 1, value, laneLength
        
        getBit = (index) ->
            laneIndex = math.ceil index / laneLength
            return bit.getBit lanes[laneIndex], ((index - 1) % laneLength) + 1, laneLength
        
        getBytes = () ->
            bytes = {}
            for lane in *lanes
                temp = lane
                
                for byteIndex = 0, (laneLength / 8) - 1
                    byte = 0
                    for bitIndex = (laneLength - (byteIndex * 8)) - 1, (laneLength - (byteIndex * 8)) - 8, -1
                        if temp >= math.pow(2, bitIndex)
                            byte = byte + math.pow(2, bitIndex % 8)
                            temp = temp - math.pow(2, bitIndex)
                    table.insert bytes, byte 
            return bytes

        getLanes = () ->
            return [lane for lane in *lanes]

        return {
            getSize: () -> #bytes * 8
            setBit: setBit
            getBit: getBit
            getBytes: getBytes
        }