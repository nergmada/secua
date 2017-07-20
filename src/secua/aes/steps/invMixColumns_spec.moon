describe 'Add Round Key Tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        stub _G, "print"
    
    it 'correctly performs the inverse mixColumns step', ->
        invMixColumns = secua.aes.steps.invMixColumns
        
        inputState = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f }
        expectedState = { 0x0a, 0x0f, 0x08, 0x0d, 0x0e, 0x0b, 0x0c, 0x09, 0x02, 0x07, 0x00, 0x05, 0x06, 0x03, 0x04, 0x01 }
        
        result = invMixColumns inputState
        assert.are.same expectedState, result
    
    it 'rejects a non existent state', ->
        invMixColumns = secua.aes.steps.invMixColumns

        assert.is_nil(invMixColumns nil)
        assert.stub(print).was.called!

    it 'rejects a non table state', ->
        invMixColumns = secua.aes.steps.invMixColumns

        assert.is_nil(invMixColumns 1243)
        assert.stub(print).was.called!
    
    it 'rejects a state that is not 16 bytes (128 bits) log', ->
        invMixColumns = secua.aes.steps.invMixColumns

        assert.is_nil(invMixColumns { 0x0f, 0x0a })
        assert.stub(print).was.called!