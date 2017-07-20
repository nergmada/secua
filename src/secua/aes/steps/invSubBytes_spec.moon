describe 'Inverse Sub Bytes Tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        stub _G, "print"
    
    it 'correctly substitutes a 16 byte sequence for its corresponding sbox values', ->
        invSubBytes = secua.aes.steps.invSubBytes
        result = invSubBytes { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f }
        assert.are.same({ 0x52, 0x09, 0x6A, 0xD5, 0x30, 0x36, 0xA5, 0x38, 0xBF, 0x40, 0xA3, 0x9E, 0x81, 0xF3, 0xD7, 0xFB }, result)
    
    it 'flags a warning when substituting a state that is not 16 bytes', ->
        invSubBytes = secua.aes.steps.invSubBytes
        invSubBytes { 0x00, 0x01, 0x02 }
        assert.stub(print).was.called!
    
    it 'rejects a state passed to it that is nil', ->
        invSubBytes = secua.aes.steps.invSubBytes
        assert.is_nil(invSubBytes nil)
        assert.stub(print).was.called!
    
    it 'rejects a non-table state', ->
        invSubBytes = secua.aes.steps.invSubBytes
        assert.is_nil(invSubBytes 32)
        assert.stub(print).was.called!