return (path) ->
    return {
        bitArray: (require path .. '/sha3/bitArray')(path)
        bitArray2: (require path .. '/sha3/bitArray2')(path)
        state: (require path .. '/sha3/state')(path)
        steps: (require path .. '/sha3/steps')(path)
    }