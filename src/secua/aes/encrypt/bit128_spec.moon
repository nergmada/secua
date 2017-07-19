describe 'AES 192 bit block encryption', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        stub _G, "print"
    
    it 'correctly encrypts data with the given key', ->
        inputkey = { 
            0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF 
        }
        inputdata = {
            0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10, 0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10
        }
        expected = {
            0x10, 0xEC, 0x6F, 0x15, 0x44, 0x67, 0xD6, 0x9A, 0xA9, 0x9C, 0xB9, 0xAF, 0x60, 0x55, 0x78, 0x57
        }
        bit128, keyschedule = secua.aes.encrypt.bit128, secua.aes.keyschedule
        encrypteddata = bit128 inputdata, (keyschedule inputkey)
        assert.are.same expected, encrypteddata
    
    it 'rejects a nil input block', ->
        inputkey = { 
            0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF 
        }
        bit128, keyschedule = secua.aes.encrypt.bit128, secua.aes.keyschedule
        
        assert.is_nil(bit128 nil, (keyschedule inputkey))
        assert.stub(print).was.called!
    
    it 'rejects a nil input key', ->
        inputdata = {
            0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10, 0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10
        }
        bit128, keyschedule = secua.aes.encrypt.bit128, secua.aes.keyschedule
        
        assert.is_nil(bit128 inputdata, nil)
        assert.stub(print).was.called!
    
    it 'rejects a nil input for both block and key', ->
        bit128, keyschedule = secua.aes.encrypt.bit128, secua.aes.keyschedule
        
        assert.is_nil(bit128 nil, nil)
        assert.stub(print).was.called!
    
    it 'rejects an invalid block size', ->
        inputkey = { 
            0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF 
        }
        inputdata = {
            0x76, 0x54, 0x32, 0x10, 0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10
        }
        bit128, keyschedule = secua.aes.encrypt.bit128, secua.aes.keyschedule
        
        assert.is_nil(bit128 inputdata, (keyschedule inputkey))
        assert.stub(print).was.called!