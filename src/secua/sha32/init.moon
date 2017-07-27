return (path) ->
    return {
        byteRot: (require path .. '/sha32/byteRot')(path)
        state: (require path .. '/sha32/state')(path)
        stateToBytes: (require path .. '/sha32/stateToBytes')(path)
        pad01101: (require path .. '/sha32/pad01101')(path)
        keccakf1600: (require path .. '/sha32/keccakf1600')(path)
        keccakSHA: (require path .. '/sha32/keccakSHA')(path)
    }