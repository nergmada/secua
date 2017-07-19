return (path) ->
    return {
        addRoundKey: (require path .. '/aes/steps/addRoundKey')(path)
        subBytes: (require path .. '/aes/steps/subBytes')(path)
        mixColumns: (require path .. '/aes/steps/mixColumns')(path)
        shiftRows: (require path .. '/aes/steps/shiftRows')(path)
        invSubBytes: (require path .. '/aes/steps/invSubBytes')(path)
        invMixColumns: (require path .. '/aes/steps/invMixColumns')(path)
        invShiftRows: (require path .. '/aes/steps/invShiftRows')(path)
    }