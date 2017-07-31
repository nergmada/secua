return (path) ->
    return {
        theta: (require path .. '/sha3/steps/theta')(path)
        rhopi: (require path .. '/sha3/steps/rhopi')(path)
        chi: (require path .. '/sha3/steps/chi')(path)
        tau: (require path .. '/sha3/steps/tau')(path)
    }