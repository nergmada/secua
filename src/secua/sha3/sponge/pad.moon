return (path) ->
    bit = (require path .. '/utils/bit')(path)
    return (bytes, byteRate, suffix) ->
        required = (-#bytes % byteRate)
        for i = 1, required
            if (i == required) and (i == 1)
                table.insert bytes, bit.bxor 0x80, suffix
            elseif (i == required)
                table.insert bytes, 0x80
            elseif (i == 1)
                table.insert bytes, suffix
            else 
                table.insert bytes, 0x00
        return bytes