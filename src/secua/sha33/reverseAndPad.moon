return (path) ->
    convertByte = (require path .. '/sha33/convertByte')(path)
    return (message, byteRate) ->
        result = [(convertByte byte) for byte in *message]
        requiredBytes = (-#message) % byteRate
        for i = 1, requiredBytes
            if (i == 1) and (i == required)
                table.insert result, 0x61
            elseif i == 1
                table.insert result, 0x60
            elseif i == required
                table.insert result, 0x01
            else 
                table.insert result, 0x00
        return result