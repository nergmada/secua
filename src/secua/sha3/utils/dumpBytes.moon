return (path) ->
    hexify = (require path .. '/utils/hexify')(path)
    return (bytes) ->
        firstrow = ''
        for i = 1, 100
            firstrow = firstrow .. (hexify { bytes[i] }) .. ' '
        secondrow = ''
        for i = 101, 200
            secondrow = secondrow .. (hexify { bytes[i] }) .. ' '
        print firstrow
        print secondrow 
        print ''