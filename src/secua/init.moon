return (path) ->
    return {
        aes: (require path .. '/aes')(path)
        sha3: (require path .. '/sha3')(path)
        sha32: (require path .. '/sha32')(path)
        sha33: (require path .. '/sha33')(path)
        utils: (require path .. '/utils')(path)
    }