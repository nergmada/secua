return (path) ->
    return {
        encrypt: (require path .. '/aes/ecb/encrypt')(path)
        decrypt: (require path .. '/aes/ecb/decrypt')(path)
    }