return (path) ->
    return {
        keycomparator: (require (path .. '/utils/keycomparator'))(path)
        log: require (path .. '/utils/errorlog')
        bit: require (path .. '/utils/bit')
        bytify: (require (path .. '/utils/bytify'))(path)
        stringify: (require (path .. '/utils/stringify'))(path)
    }