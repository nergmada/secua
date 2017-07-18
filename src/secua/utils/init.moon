return (path) ->
    return {
        keycomparator: (require (path .. '/utils/keycomparator'))(path)
        log: require (path .. '/utils/errorlog')
        bit: require (path .. '/utils/bit')
    }