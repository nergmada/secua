describe 'Set Bit Method tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        --stub _G, "print"

    it 'correctly sets a bit to false', ->
        setBit = secua.utils.bit.setBit
        assert.is_equal 0x7F, (setBit 0xFF, 1, false)