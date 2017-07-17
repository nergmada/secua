return (keyA, keyB) ->
    if (not keyA) or (not keyB)
        return false
    if (type keyA) == 'table' and (type keyB) == 'table'
        if #keyA == #keyB
            for i in 1, #keyA
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
        return false