return (path) ->
    return {
        bitArray: (require path .. '/sha3/bitArray')(path)
        state: (require path .. '/sha3/state')(path)
        steps: (require path .. '/sha3/steps')(path)
        keccak1600: (require path .. '/sha3/keccak1600')(path)
        keccakSHA: (require path .. '/sha3/keccakSHA')(path)
        pad101: (require path .. '/sha3/pad101')(path)
    }