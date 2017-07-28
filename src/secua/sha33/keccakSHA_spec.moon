describe 'Keccak SHA 33 tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        --stub _G, "print"
    it 'correctly hashes viola', ->
        --input = secua.utils.bytify 'viola'
        --result = secua.utils.hexify (secua.sha33.keccakSHA input, 224)
        --print result