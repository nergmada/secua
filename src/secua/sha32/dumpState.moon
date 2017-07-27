return (path) ->
    return (state) ->
        for x, sheet in ipairs state
            for y, lane in ipairs sheet
                print 'x: ' .. x .. ' y: ' .. y
                laneOutput = '{ '
                for _, byte in ipairs lane
                    laneOutput = laneOutput .. byte .. ', '
                print laneOutput .. '}'