return (path) ->
    return {
        keyschedule: (require path .. '/aes/keyschedule')(path)
        steps: (require path .. '/aes/steps')(path)
    }
