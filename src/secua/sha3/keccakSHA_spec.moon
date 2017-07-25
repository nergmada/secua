describe 'Pad 10*1 tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        --stub _G, "print"

    it 'works for SHA3-224 standard', ->
        input = secua.utils.hexBytify '76696f6c61'
        result = secua.utils.hexify (secua.sha3.keccakSHA input, 224)
        print result