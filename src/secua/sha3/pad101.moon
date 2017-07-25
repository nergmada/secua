return (path) ->
    return (desired, current) ->
        required = ((-(#current * 8)) % desired) / 8
        --if we don't require any padding we still have to append the two bits
        -- so we have to pad a whole block
        if required == 0
            required = desired / 8
        result = [byte for byte in *current]

        for i = 1, required
            if (i == 1) and (i == required)
                table.insert result, 0x61
            elseif i == 1
                table.insert result, 0x60
            elseif i == required
                table.insert result, 0x01
            else 
                table.insert result, 0x00
        return result