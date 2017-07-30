describe 'Keccak SHA 33 tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        --stub _G, "print"
    
    it 'correctly hashes', ->
        --result = secua.sha34.keccakf1600 [ 0x00 for i = 1, 200]
        --print secua.utils.hexify result