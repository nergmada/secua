return (path) ->
    return {
        keycomparator: (require (path .. '/utils/keycomparator'))(path)
        log: require (path .. '/utils/errorlog')
        bit: (require path .. '/utils/bit')(path)
        bytify: (require (path .. '/utils/bytify'))(path)
        stringify: (require (path .. '/utils/stringify'))(path)
        padding: (require path .. '/utils/padding')(path)
        hexify: (require path .. '/utils/hexify')(path)
        hexBytify: (require path .. '/utils/hexBytify')(path)
    }