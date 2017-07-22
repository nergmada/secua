return (path) ->
    standard = require path .. '/utils/bit/standard'
    log = require path .. '/utils/errorlog'
    return (byte, index, bitLength = 8) ->
        if (not byte) or (not index) or (type byte) != 'number' or (type index) != 'number'
            log 'No input provide or the arguments are not numbers', 1
            return nil
        if index < 0 or index > bitLength
            log 'invalid index for a byte', 1
            return nil
        tmp = byte
        for i = bitLength - 1, (bitLength - 1) - (index - 1), -1
            bitvalue = math.pow 2, i
            if byte >= bitvalue
                byte = byte - bitvalue
                if i == (bitLength - 1) - (index - 1)
                    return true
            elseif i == (bitLength - 1) - (index - 1)
                return false
