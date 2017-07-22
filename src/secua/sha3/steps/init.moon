return (path) ->
    return {
        theta: (require path .. '/sha3/steps/theta')(path)
        rho: (require path .. '/sha3/steps/rho')(path)
    }