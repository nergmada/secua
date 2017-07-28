describe 'Byte Rotate tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        stub _G, "print"
    
    it 'correctly rotates a table of bytes', ->
        input = { 0x80, 0x01 }
        result = secua.sha33.byteRot input, 1
        expected = { 0xc0, 0x00 }
        assert.are.same expected, result