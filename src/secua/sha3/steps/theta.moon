return (path) ->
    return (state) ->
        -- FIPS202 - Step 1
        c = {}
        for x = 1, 5
            c[x] = {}
            for z = 1, state.width
                value = false
                for y = 1, 5
                    currentBit = state.getBit(x, y, z)
                    value = ((not value) and currentBit) or (value and (not currentBit))
                c[x][z] = value
        -- FIPS202 - Step 2
        d = {}
        for x = 1, 5
            d[x] = {}
            for z = 1, state.width
                ca = c[((x - 2) % 5) + 1][z]
                cb = c[(x % 5) + 1][((z - 2) % state.width) + 1]
                d[x][z] = ((not ca) and cb) or (ca and (not cb))
        -- FIPS202 - Step 3
        for x = 1, 5
            for y = 1, 5
                for z = 1, state.width
                    currentBit = state.getBit(x, y, z)
                    newValue = ((not currentBit) and d[x][z]) or (currentBit and (not d[x][z]))
                    state.setBit(x, y, z, newValue)
        return state