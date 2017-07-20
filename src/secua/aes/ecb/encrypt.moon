return (path) ->
    keyschedule = (require path .. '/aes/keyschedule')(path)
    encrypt = (require path .. '/aes/encrypt')(path)
    
    log = require path .. '/utils/errorlog'
    pcks7 = (require path .. '/utils/padding/pcks7')(path)

    return (data, key) ->
        --Error checking code, make sure we don't get passed junk
        if (not data) or (not key) or (type data) != 'table' or (type key) != 'table'
            log 'No data or no key has been provided, or one of these is not in a table of bytes', 1
            return nil
        if (#key != 16) and (#key != 24) and (#key != 32)
            log 'Key is not 128, 192 or 256 bits long, cannot encrypt', 1
            return nil
        --Auto padding code
        if (#data % 16 != 0)
            log 'The data is not a multiple of 128 bits, we will automatically pad this according to PKS7', 2
            data = pcks7.pad data, 16

        --expand key
        expandedkey = keyschedule key
        -- create ciphertext table
        result = {}
        --iterate through each block
        for blockNo = 1, (#data / 16)
            --break into block
            block = [byte for byte in *data[((blockNo - 1) * 16) + 1, ((blockNo - 1) * 16) + 16]]
            cipherblock = {}
            --encrypt according to keysize
            switch #key
                when 16
                    cipherblock = encrypt.bit128 block, expandedkey
                when 24
                    cipherblock = encrypt.bit192 block, expandedkey
                when 32
                    cipherblock = encrypt.bit256 block, expandedkey
            --add cipherblock to result
            for byte in *cipherblock
                table.insert result, byte
        return result