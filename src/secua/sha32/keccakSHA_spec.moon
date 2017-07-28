describe 'state tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        --stub _G, "print"
    it 'correctly hashes viola', ->
        input = secua.utils.bytify ''
        result = secua.utils.hexify (secua.sha32.keccakSHA input, 224)
        print result