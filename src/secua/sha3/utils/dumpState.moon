return (path) ->
    hexify = (require path .. '/utils/hexify')(path)
    return (state) ->
        data = {}
        for y = 0, 4
            data[y] = ''
            for x = 0, 4
                data[y] = data[y] .. (hexify state[x][y]) .. ' '

        for y = 0, 4
            print data[y]
        print ''