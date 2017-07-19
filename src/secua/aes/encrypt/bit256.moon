return (path) ->
    steps = (require path .. '/aes/steps')(path)
    log = (require path .. '/utils/errorlog')(path)
    return (block, key) ->
        if (not block) or (not key) or (type block) != 'table' or (type key) != 'table'
            log 'No block or key provided, or the key or block are not in a table of bytes form', 1
            return nil