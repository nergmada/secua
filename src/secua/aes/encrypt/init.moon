return (path) ->
    return {
        bit256: (require path .. '/aes/encrypt/bit256')(path)
        bit192: (require path .. '/aes/encrypt/bit192')(path)
        bit128: (require path .. '/aes/encrypt/bit128')(path)
    }
