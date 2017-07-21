return (path) ->
    return {
        keyschedule: (require path .. '/aes/keyschedule')(path)
        steps: (require path .. '/aes/steps')(path)
        encrypt: (require path .. '/aes/encrypt')(path)
        decrypt: (require path .. '/aes/decrypt')(path)
        ecb: (require path .. '/aes/ecb')(path)
        cbc: (require path .. '/aes/cbc')(path)
        otherciphers: nil
    }
