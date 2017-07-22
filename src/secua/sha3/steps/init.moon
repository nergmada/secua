return (path) ->
    return {
        theta: (require path .. '/sha3/steps/theta')(path)
        rho: (require path .. '/sha3/steps/rho')(path)
        pi: (require path .. '/sha3/steps/pi')(path)
        chi: (require path .. '/sha3/steps/chi')(path)
    }