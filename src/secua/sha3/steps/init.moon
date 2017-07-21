return (path) ->
    return {
        theta: (require path .. '/sha3/steps/theta')(path)
    }