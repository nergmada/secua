return (path) ->
    return {
        bit256: (require path .. '/aes/encrypt/bit256')(path)
    }
