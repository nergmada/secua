return (path) ->
    log = require path .. '/utils/errorlog'
    keyschedule = (require path .. '/aes/keyschedule')(path)
    decrypt = (require path .. '/aes/encrypt')(path)
    bit = (require path .. '/utils/bit')

    return (data, key, iv) ->
        --Error checking code, make sure we don't get passed junk
        if (not data) or (not key) or (not iv) or (type data) != 'table' or (type key) != 'table' or (type iv) != 'table'
            log 'No data, no key or no IV has been provided, or one of these is not in a table of bytes', 1
            return nil
        if (#key != 16) and (#key != 24) and (#key != 32)
            log 'Key is not 128, 192 or 256 bits long, cannot encrypt', 1
            return nil
        if #iv != 16
            log 'The initialisation vector is not correct size, should match block size (128 bits)', 1
            return nil
        if (#data % 16 != 0)
            log 'The data is not a multiple of 128 bits, this is probably not a cipher text encrypted with CBC', 1
            return nil
        --expand key
        expandedkey = keyschedule key
        -- create plaintext table
        result = {}
        -- create previous with iv
        prev = iv
        --iterate through each block
        for blockNo = 1, (#data / 16)
            --break into block
            block = [byte for byte in *data[((blockNo - 1) * 16) + 1, ((blockNo - 1) * 16) + 16]]
            --decrypt according to keysize
            switch #key
                when 16
                    plainblock = decrypt.bit128 block, expandedkey
                when 24
                    plainblock = decrypt.bit192 block, expandedkey
                when 32
                    plainblock = decrypt.bit256 block, expandedkey
            --XOR against the previous cipherblock or the IV
            for i = 1, 16
                plainblock[i] = bit.bxor plainblock[i], prev[i]
            --Set previous to this current cipher block
            prev = block
            --add plainblock to result
            for byte in *plainblock
                table.insert result, byte
        return result