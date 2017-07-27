describe 'Byte Rotate tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        stub _G, "print"
    
    it 'correctly rotates a table of bytes', ->
        input = { 0x80, 0x01 }
        result = secua.sha32.byteRot input, 1
        expected = { 0x00, 0x03 }
        assert.are.same expected, result