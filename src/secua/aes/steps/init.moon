return (path) ->
    return {
        addRoundKey: (require path .. '/aes/steps/addRoundKey')(path)
        subBytes: (require path .. '/aes/steps/subBytes')(path)
        mixColumns: (require path .. '/aes/steps/mixColumns')(path)
    }