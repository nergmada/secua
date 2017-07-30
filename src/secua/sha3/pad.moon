return (path) ->

    return (bytes, byteRate) ->
        required = (-#bytes % byteRate)
        for i = 1, required
            if (i == required) and (i == 1)
                table.insert bytes, 0x86
            elseif (i == required)
                table.insert bytes, 0x80
            elseif (i == 1)
                table.insert bytes, 0x06
            else 
                table.insert bytes, 0x00
        return bytes