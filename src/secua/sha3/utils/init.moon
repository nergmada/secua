return (path) ->
    return {
        byteNot: (require path .. '/sha3/utils/byteNot')(path)
        byteRot: (require path .. '/sha3/utils/byteRot')(path)
        bytesToState: (require path .. '/sha3/utils/bytesToState')(path)
        dumpBytes: (require path .. '/sha3/utils/dumpBytes')(path)
        dumpState: (require path .. '/sha3/utils/dumpState')(path)
        stateToBytes: (require path .. '/sha3/utils/stateToBytes')(path)
    }