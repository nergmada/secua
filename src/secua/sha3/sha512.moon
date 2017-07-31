return (path) ->
    sponge = (require path .. '/sha3/sponge')(path)
    return (bytes) ->
        sponge input, 1024, 0x06, 512