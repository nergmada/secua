return (path) ->
    return {
        byteRot: (require path .. '/sha32/byteRot')(path)
        state: (require path .. '/sha32/state')(path)
        stateToBytes: (require path .. '/sha32/stateToBytes')(path)
    }