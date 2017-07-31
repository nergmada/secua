return (path) ->
    sponge = (require path .. '/sha3/sponge')(path)
    return (bytes) ->
        sponge bytes, 512, 0x06, 256