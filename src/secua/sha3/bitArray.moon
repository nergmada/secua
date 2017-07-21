return (path) ->
    bit = (require path .. '/utils/bit')(path)
    return (byteArray) ->
        bytes = [byte for byte in *byteArray]
        
        setBit = (index, value) ->
            byteIndex = math.ceil index / 8
            bitIndex = index % 8 
            if bitIndex == 0 then bitIndex = 8
            bytes[byteIndex] = bit.setBit bytes[byteIndex], bitIndex, value
        
        getBit = (index) ->
            byteIndex = math.ceil index / 8
            bitIndex = index % 8 
            if bitIndex == 0 then bitIndex = 8
            return bit.getBit bytes[byteIndex], bitIndex
        
        getBytes = () ->
            return [byte for byte in *bytes]

        return {
            getSize: () -> #bytes * 8
            setBit: setBit
            getBit: getBit
            getBytes: getBytes
        }