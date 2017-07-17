return (path) ->
    return {
        aes: (require path .. '/aes')(path .. '/aes')
    }