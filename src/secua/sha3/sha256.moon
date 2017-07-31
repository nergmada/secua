return (path) ->
    sponge = (require path .. '/sha3/sponge')(path)
    return (bytes) ->
        sponge input, 512, 0x06, 256