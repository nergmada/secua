return (path) ->
    return {
        bitArray: (require path .. '/sha3/bitArray')(path)
        state: (require path .. '/sha3/state')(path)
    }