describe 'Add Round Key Tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        stub _G, "print"
    
    it 'correctly adds the provided round key to the state', ->
        roundkey = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f }
        state = { 0x0f, 0x0e, 0x0d, 0x0c, 0x0b, 0x0a, 0x09, 0x08, 0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00 }
        addRoundKey = secua.aes.steps.addRoundKey

        result = addRoundKey state, roundkey
        expected = { 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f }

        assert.are.same expected, result
    
    it 'rejects a nil state', ->
        roundkey = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f }
        addRoundKey = secua.aes.steps.addRoundKey

        assert.is_nil(addRoundKey nil, roundkey)
        assert.stub(print).was.called!
    
    it 'rejects a nil subkey', ->
        state = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f }
        addRoundKey = secua.aes.steps.addRoundKey

        assert.is_nil(addRoundKey state, nil)
        assert.stub(print).was.called!
    
    it 'rejects completely nil arguments', ->
        addRoundKey = secua.aes.steps.addRoundKey

        assert.is_nil(addRoundKey nil, nil)
        assert.stub(print).was.called!

    it 'rejects a non table state', ->
        roundkey = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f }
        addRoundKey = secua.aes.steps.addRoundKey

        assert.is_nil(addRoundKey 'This is not a state', roundkey)
        assert.stub(print).was.called!
    
    it 'rejects a non table subkey', ->
        state = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f }
        addRoundKey = secua.aes.steps.addRoundKey

        assert.is_nil(addRoundKey state, 'This is not a sub key')
        assert.stub(print).was.called!
    
    it 'rejects all non-table arguments', ->
        addRoundKey = secua.aes.steps.addRoundKey

        assert.is_nil(addRoundKey 24, 'Do or do not, there is no try')
        assert.stub(print).was.called!
    
    it 'rejects a state that is not the same length as the round key', ->
        roundkey = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f }
        addRoundKey = secua.aes.steps.addRoundKey

        assert.is_nil(addRoundKey { 0x0f, 0x0b }, roundkey)
        assert.stub(print).was.called!
    it 'rejects a round key that is not the same length as the state', ->
        state = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f }
        addRoundKey = secua.aes.steps.addRoundKey

        assert.is_nil(addRoundKey state, { 0x0f, 0x0b })
        assert.stub(print).was.called!