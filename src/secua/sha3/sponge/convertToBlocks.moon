return (path) ->
    return (bytes, byteRate) ->
        blocks = #bytes / byteRate
        
        messageBlocks = {}
        for i = 0,  blocks - 1
            messageBlocks[i + 1] = [byte for byte in *bytes[(i * byteRate) + 1, ((i + 1) * byteRate)]]
            for j = 1, 200 - byteRate
                table.insert messageBlocks[i + 1], 0x00
        return messageBlocks