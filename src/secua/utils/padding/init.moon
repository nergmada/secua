return (path) ->
    return {
        pcks7: (require path .. '/utils/padding/pcks7')(path)
    }