return (path) ->
    return {
        convertByte: (require path .. '/sha33/convertByte')(path)
        stateToArray: (require path .. '/sha33/stateToArray')(path)
        arrayToState: (require path .. '/sha33/arrayToState')(path)
        reverseAndPad: (require path .. '/sha33/reverseAndPad')(path)
        reverseArray: (require path .. '/sha33/reverseArray')(path)
        byteRot: (require path .. '/sha33/byteRot')(path)
        keccakSHA: (require path .. '/sha33/keccakSHA')(path)
    }