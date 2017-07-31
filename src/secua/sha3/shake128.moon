return (path) ->
    sponge = (require path .. '/sha3/sponge')(path)
    log = (require path .. '/utils/errorlog')
    return (bytes, length) ->
        if length % 8 != 0
            log 'provided length is not a multiple of 8 (i.e. bytes)', 1
            return nil
        sponge bytes, 256, 0x1f, length