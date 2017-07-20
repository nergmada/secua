describe 'Sub Bytes Tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        stub _G, "print"
    
    it 'correctly substitutes a 16 byte sequence for its corresponding sbox values', ->
        subBytes = secua.aes.steps.subBytes
        result = subBytes { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f }
        assert.are.same({ 0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5, 0x30, 0x01, 0x67, 0x2B, 0xFE, 0xD7, 0xAB, 0x76 }, result)
    
    it 'flags a warning when substituting a state that is not 16 bytes', ->
        subBytes = secua.aes.steps.subBytes
        subBytes { 0x00, 0x01, 0x02 }
        assert.stub(print).was.called!
    
    it 'rejects a state passed to it that is nil', ->
        subBytes = secua.aes.steps.subBytes
        assert.is_nil(subBytes nil)
        assert.stub(print).was.called!
    
    it 'rejects a non-table state', ->
        subBytes = secua.aes.steps.subBytes
        assert.is_nil(subBytes 32)
        assert.stub(print).was.called!