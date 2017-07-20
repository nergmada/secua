return (path) ->
    steps = (require path .. '/aes/steps')(path)
    log = (require path .. '/utils/errorlog')
    return (block, expandedkey) ->
        if (not block) or (not expandedkey) or (type block) != 'table' or (type expandedkey) != 'table'
            log 'No block or key provided, or the key or block are not in a table of bytes form', 1
            return nil
        if #expandedkey != 176
            log 'key is not 176 bytes long (1408 bits)', 1
            return nil
        if #block != 16
            log 'block is not 128 bits (16 bytes)', 1
            return nil

        state = block
        for round = 1, 11
            roundkey = [byte for byte in *expandedkey[((round - 1) * 16) + 1, ((round - 1) * 16) + 16]]
            if round == 1
                state = steps.addRoundKey state, roundkey
            else
                state = steps.subBytes state
                state = steps.shiftRows state
                if round != 11
                    state = steps.mixColumns state
                state = steps.addRoundKey state, roundkey
        return state