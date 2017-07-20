return (path) ->
    return {
        encrypt: (require path .. '/aes/cbc/encrypt')(path)
        decrypt: (require path .. '/aes/cbc/decrypt')(path)
    }