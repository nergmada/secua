return (path) ->
    log = (require path .. '/utils/errorlog')
    
    theta = (require path .. '/sha3/steps/theta')(path)
    rho = (require path .. '/sha3/steps/rho')(path)
    pi = (require path .. '/sha3/steps/pi')(path)
    chi = (require path .. '/sha3/steps/chi')(path)
    tau = (require path .. '/sha3/steps/tau')(path)

    stateBuilder = (require path .. '/sha3/state')(path)

    round = (state, index) ->
        return (tau (chi (pi (rho (theta state)))), index)
    return (input) ->
        if #input != 200
            log 'the provide input is not 1600 bits long', 1
            return nil
        result = stateBuilder input
        for i = 0, 23
            result = round result, i
        
        return result.getBytes!