describe 'Add Round Key Tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        stub _G, "print"
    
    it 'correctly performs the mixColumns step', ->
        mixColumns = secua.aes.steps.mixColumns
        
        inputState = { 0xdb, 0x13, 0x53, 0x45, 0xf2, 0x0a, 0x22, 0x5c, 0x01, 0x01, 0x01, 0x01, 0xc6, 0xc6, 0xc6, 0xc6 }
        expectedState = { 0x8e, 0x4d, 0xa1, 0xbc, 0x9f, 0xdc, 0x58, 0x9d, 0x01, 0x01, 0x01, 0x01, 0xc6, 0xc6, 0xc6, 0xc6 }
        
        result = mixColumns inputState
        assert.are.same expectedState, result
    
    it 'rejects a non existent state', ->
        mixColumns = secua.aes.steps.mixColumns

        assert.is_nil(mixColumns nil)
        assert.stub(print).was.called!

    it 'rejects a non table state', ->
        mixColumns = secua.aes.steps.mixColumns

        assert.is_nil(mixColumns 1243)
        assert.stub(print).was.called!
    
    it 'rejects a state that is not 16 bytes (128 bits) log', ->
        mixColumns = secua.aes.steps.mixColumns

        assert.is_nil(mixColumns { 0x0f, 0x0a })
        assert.stub(print).was.called!