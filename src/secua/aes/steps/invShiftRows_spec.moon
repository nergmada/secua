describe 'Inverse Shift Rows Tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        stub _G, "print"
    
    it 'correctly shifts a given matrix', ->
        invShiftRows = secua.aes.steps.invShiftRows
        
        input = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f }
        output = { 0x00, 0x0d, 0x0a, 0x07, 0x04, 0x01, 0x0e, 0x0b, 0x08, 0x05, 0x02, 0x0f, 0x0c, 0x09, 0x06, 0x03 }
        
        result = invShiftRows input
        assert.are.same output, result
    
    it 'rejects a non-existent state', ->
        invShiftRows = secua.aes.steps.invShiftRows

        assert.is_nil(invShiftRows nil)
        assert.stub(print).was.called!
    
    it 'rejects a state that is not a table', ->
        invShiftRows = secua.aes.steps.invShiftRows

        assert.is_nil(invShiftRows 1214)
        assert.stub(print).was.called!

    it 'rejects a state that does not consist of 16 bytes', ->
        invShiftRows = secua.aes.steps.invShiftRows

        assert.is_nil(invShiftRows { 0x0f, 0x0c })
        assert.stub(print).was.called!