return (path) ->
    log = (require path .. '/errorlog')
    return (keyA, keyB) ->
        if (not keyA) or (not keyB)
            log 'No value supplied for at least one parameter', 1
            return false
        if (type keyA) == 'table' and (type keyB) == 'table'
            if #keyA == #keyB
                for i = 1, #keyA
                    if keyA[i] != keyB[i]
                        return false
                return true
            else
                return false
        elseif (type keyA) == 'string' and (type keyB) == 'string'
            if keyA == keyB
                return true
            else
                return false
        else
            log 'Invalid value supplied for at least one parameter', 1
            return false