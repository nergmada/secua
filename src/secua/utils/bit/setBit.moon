return (path) ->
    getBit = (require path .. '/utils/bit/getBit')(path)
    log = require path .. '/utils/errorlog'
    return (byte, index, value, bitLength = 8) ->
        if (not byte) or (not index) or (value == nil) or (type byte) != 'number' or (type index) != 'number' or (type value) != 'boolean'
            log 'No input provide or the arguments are not numbers', 1
            return nil
        
        if index < 0 or index > bitLength
            log 'invalid index for a byte', 1
            return nil
        
        if (getBit byte, index, bitLength) == value
            return byte
        elseif value == true
            return byte + (math.pow 2, (bitLength - 1) - (index - 1))
        else
            return byte - (math.pow 2, (bitLength - 1) - (index - 1))