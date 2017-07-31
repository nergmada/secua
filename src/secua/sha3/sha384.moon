return (path) ->
    sponge = (require path .. '/sha3/sponge')(path)
    return (bytes) ->
        sponge bytes, 768, 0x06, 384