describe 'Byte Not Utility tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        stub _G, "print"
    it 'correctly inverts a given byte', ->
        result = secua.sha3.utils.byteNot 0x01
        assert.is_equal 0xFE, result
    it 'correctly rejects a non-number input', ->
        result = secua.sha3.utils.byteNot 'The Force'
        assert.is_nil result
        assert.stub(print).was.called!
    it 'correctly warns of a non byte value being provided', ->
        result = secua.sha3.utils.byteNot 10234
        assert.stub(print).was.called!