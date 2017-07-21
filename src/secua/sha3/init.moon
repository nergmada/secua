return (path) ->
    return {
        bitArray: (require path .. '/sha3/bitArray')(path)
    }