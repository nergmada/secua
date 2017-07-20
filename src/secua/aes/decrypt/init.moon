return (path) ->
    return {
        bit256: (require path .. '/aes/decrypt/bit256')(path)
        bit192: (require path .. '/aes/decrypt/bit192')(path)
        bit128: (require path .. '/aes/decrypt/bit128')(path)
    }
