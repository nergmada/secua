describe 'Get Bit Method tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        stub _G, "print"

    it 'correctly gets a bit for a given true bit', ->
        getBit = secua.utils.bit.getBit
        assert.is_true (getBit 0xFF, 1)
    it 'correctly gets a bit for a given false bit', ->
        getBit = secua.utils.bit.getBit
        assert.is_false (getBit 0x00, 1)
    it 'correctly gets a bit for a given false bit', ->
        getBit = secua.utils.bit.getBit
        assert.is_true (getBit 0x10, 4)