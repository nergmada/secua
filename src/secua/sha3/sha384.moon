return (path) ->
    sponge = (require path .. '/sha3/sponge')(path)
    return (bytes) ->
        sponge input, 768, 0x06, 384