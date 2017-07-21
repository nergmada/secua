return (path) ->
    bit = (require path .. '/utils/bit')(path)
    return (byteArray) ->
        bytes = [byte for byte in *byteArray]
        
        setBit = (index, value) ->
            byteIndex = math.ceil index / 8
            bytes[byteIndex] = bit.setBit bytes[byteIndex], ((index - 1) % 8) + 1, value
        
        getBit = (index) ->
            byteIndex = math.ceil index / 8
            return bit.getBit bytes[byteIndex], ((index - 1) % 8) + 1
        
        getBytes = () ->
            return [byte for byte in *bytes]

        return {
            getSize: () -> #bytes * 8
            setBit: setBit
            getBit: getBit
            getBytes: getBytes
        }