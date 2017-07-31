return (path) ->
    return {
        theta: (require path .. '/sha3/keccakf1600/steps/theta')(path)
        rhopi: (require path .. '/sha3/keccakf1600/steps/rhopi')(path)
        chi: (require path .. '/sha3/keccakf1600/steps/chi')(path)
        tau: (require path .. '/sha3/keccakf1600/steps/tau')(path)
    }