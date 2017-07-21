return (path) ->
    log = require path .. '/utils/errorlog'
    bitArray = (require path .. '/sha3/bitArray')(path)
    -- Secua only supports a subset of state sizes, 200, 400, 800 and 1600 bits
    return (bytes) ->
        bits = #bytes * 8
        if (not bits) or (type bits) != 'number'
            log 'No state size provided or is not a valid number', 1
            return nil
        if bits != 200 and bits != 400 and bits != 800 and bits != 1600
            log 'Size provided is not valid for a SHA-3 state', 1
            return nil

        array = bitArray bytes
        width = bits / 25
        
        -- states are 1 based
        calcArrayPos = (x, y, z) -> ((width * ((5 * y) + x) + z) - (6 * width))

        getBit = (x, y, z) ->
            return array.getBit (calcArrayPos x, y, z)
        setBit = (x, y, z, value) ->
            array.setBit (calcArrayPos x, y, z), value
        
        return {
            width: width
            getBit: getBit
            setBit: setBit
            getBytes: array.getBytes
        }