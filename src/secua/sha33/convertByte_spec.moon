describe 'Convert Byte tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        --stub _G, "print"
    it 'correctly converts from MSB to LSB', ->
        assert.is_equal 0x01, secua.sha33.convertByte 0x80
    it 'correctly converts from LSB to MSB', ->
        assert.is_equal 0x80, secua.sha33.convertByte 0x01