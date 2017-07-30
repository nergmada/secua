return (path) ->
    return {
        sha: (require path .. '/sha3/sha')(path)
        keccakf1600: (require path .. '/sha3/keccakf1600')(path)
    }