return (path) ->
    return {
        steps: (require path .. '/sha3/steps')(path)
        sponge: (require path .. '/sha3/sponge')(path)
        keccakf1600: (require path .. '/sha3/keccakf1600')(path)
        utils: (require path .. '/sha3/utils')(path)
        sha224: (require path .. '/sha3/sha224')(path)
        sha256: (require path .. '/sha3/sha256')(path)
        sha384: (require path .. '/sha3/sha384')(path)
        sha512: (require path .. '/sha3/sha512')(path)
    }