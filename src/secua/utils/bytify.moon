return (path) ->
    log = (require path .. '/utils/errorlog')
    return (str) ->
        if (not str)
            log 'nothing to bytify, seriously? I am not psychic', 1
            return nil
        
        if (type str) != 'string'
            log 'Cannot bytify, argument is not a string', 1
            return nil
        
        return { str\byte 1, str\len! }
