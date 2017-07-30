return (path) ->
    return {
        aes: (require path .. '/aes')(path)
        sha3: (require path .. '/sha3')(path)
        utils: (require path .. '/utils')(path)
    }