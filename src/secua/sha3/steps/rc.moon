return (path) ->
    return (t) ->
        if t % 255 == 0
            return true
        r = { false, false, false, false, false, false, false, true }
        for i = 1, t % 255
            table.insert r, false
            r[#r] = ((not r[#r]) and r[#r - 8]) or (r[#r] and (not r[#r - 8]))
            r[#r - 4] = ((not r[#r - 4]) and r[#r - 8]) or (r[#r - 4] and (not r[#r - 8]))
            r[#r - 5] = ((not r[#r - 5]) and r[#r - 8]) or (r[#r - 5] and (not r[#r - 8]))
            r[#r - 6] = ((not r[#r - 6]) and r[#r - 8]) or (r[#r - 6] and (not r[#r - 8]))
            r = [bit for bit in *r[#r - 7, #r]]
        return r[#r]