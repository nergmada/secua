describe 'Electronic Code Book mode encryption', ->
    secua = nil

    setup ->
        secua = (require 'secua')('secua')

    before_each ->
        stub _G, "print"
    describe 'Correct block size of data', ->
        it 'correctly encrypts with a 128 bit key and 128 multiple block size', ->
            inputkey = { 
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF 
            }
            inputdata = {
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF,
                0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10, 0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10
            }
            expected = {
                0xA1, 0xEE, 0x56, 0x08, 0xB3, 0x3A, 0xF0, 0x54, 0x70, 0x85, 0x86, 0x08, 0xD1, 0xDE, 0x08, 0x0F,
                0x10, 0xEC, 0x6F, 0x15, 0x44, 0x67, 0xD6, 0x9A, 0xA9, 0x9C, 0xB9, 0xAF, 0x60, 0x55, 0x78, 0x57
            }
            encrypt = secua.aes.ecb.encrypt
            assert.are.same expected, (encrypt inputdata, inputkey)
        it 'correctly encrypts with a 192 bit key and 128 multiple block size', ->
            inputkey = { 
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF 
            }
            inputdata = {
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF,
                0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10, 0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10
            }
            expected = {
                0x07, 0x06, 0x9B, 0xE6, 0x24, 0x8A, 0xA2, 0x1C, 0xFB, 0x17, 0x27, 0xB6, 0xEC, 0xC4, 0x57, 0x08,
                0x4A, 0x8D, 0xD3, 0x13, 0xC1, 0xFE, 0x7C, 0x37, 0x22, 0xFC, 0x89, 0xE5, 0x42, 0x20, 0xDE, 0x9E
            }
            encrypt = secua.aes.ecb.encrypt
            assert.are.same expected, (encrypt inputdata, inputkey)
        it 'correctly encrypts with a 256 bit key and 128 multiple block size', ->
            inputkey = { 
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF 
            }
            inputdata = {
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF,
                0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10, 0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10
            }
            expected = {
                0xE9, 0x71, 0xA5, 0x43, 0x08, 0xFE, 0xB2, 0x11, 0xE3, 0x96, 0xE7, 0x69, 0x8A, 0x1C, 0x2F, 0xD1,
                0xBD, 0x60, 0xEE, 0x77, 0x1C, 0x50, 0x6D, 0x50, 0x8D, 0x76, 0xD2, 0x6F, 0x5A, 0xDD, 0x70, 0x39
            }
            encrypt = secua.aes.ecb.encrypt
            assert.are.same expected, (encrypt inputdata, inputkey)
    describe 'Block size requires padding', ->
        it 'correctly encrypts with a 128 bit key and a block requiring 4 byte padding', ->
            inputkey = { 
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF 
            }
            inputdata = {
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF,
                0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10, 0xFE, 0xDC, 0xBA, 0x98
            }
            expected = {
                0xA1, 0xEE, 0x56, 0x08, 0xB3, 0x3A, 0xF0, 0x54, 0x70, 0x85, 0x86, 0x08, 0xD1, 0xDE, 0x08, 0x0F,
                0xE3, 0x74, 0xDE, 0xEB, 0x6F, 0xAE, 0xC4, 0x04, 0xAE, 0xA4, 0x84, 0xB5, 0x36, 0xC5, 0x68, 0x71
            }
            encrypt = secua.aes.ecb.encrypt
            assert.are.same expected, (encrypt inputdata, inputkey)
            assert.stub(print).was.called 1
        it 'correctly encrypts with a 192 bit key and a block requiring 5 byte padding', ->
            inputkey = { 
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF  
            }
            inputdata = {
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF,
                0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10, 0xFE, 0xDC, 0xBA
            }
            expected = {
                0x07, 0x06, 0x9B, 0xE6, 0x24, 0x8A, 0xA2, 0x1C, 0xFB, 0x17, 0x27, 0xB6, 0xEC, 0xC4, 0x57, 0x08,
                0x53, 0xA3, 0x65, 0x3F, 0x6C, 0xBA, 0xB4, 0x3C, 0xA3, 0x89, 0x8A, 0x47, 0x57, 0xA3, 0x4A, 0x81
            }
            encrypt = secua.aes.ecb.encrypt
            assert.are.same expected, (encrypt inputdata, inputkey)
            assert.stub(print).was.called 1
        it 'correctly encrypts with a 256 bit key and a block requiring 7 byte padding', ->
            inputkey = { 
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF  
            }
            inputdata = {
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF,
                0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10, 0xFE
            }
            expected = {
                0xE9, 0x71, 0xA5, 0x43, 0x08, 0xFE, 0xB2, 0x11, 0xE3, 0x96, 0xE7, 0x69, 0x8A, 0x1C, 0x2F, 0xD1,
                0x6A, 0x32, 0xF5, 0xA2, 0x8D, 0xAF, 0x77, 0x6A, 0xC0, 0xCA, 0x52, 0x1A, 0xC8, 0x8A, 0x53, 0x85
            }
            encrypt = secua.aes.ecb.encrypt
            assert.are.same expected, (encrypt inputdata, inputkey)
            assert.stub(print).was.called 1
    describe 'Error handling code', ->
        it 'rejects non existent data', ->
            inputkey = { 
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF  
            }
            encrypt = secua.aes.ecb.encrypt
            assert.is_nil (encrypt nil, inputkey)
            assert.stub(print).was.called 1
        it 'rejects non existent key', ->
            inputdata = { 
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF  
            }
            encrypt = secua.aes.ecb.encrypt
            assert.is_nil (encrypt inputdata, nil)
            assert.stub(print).was.called 1
        it 'rejects nil key and input', ->
            encrypt = secua.aes.ecb.encrypt
            assert.is_nil (encrypt nil, nil)
            assert.stub(print).was.called 1
        it 'rejects non table data', ->
            inputkey = { 
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF  
            }
            encrypt = secua.aes.ecb.encrypt
            assert.is_nil (encrypt 'This is not the data you are looking for', inputkey)
            assert.stub(print).was.called 1
        it 'rejects non table key', ->
            inputdata = { 
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF  
            }
            encrypt = secua.aes.ecb.encrypt
            assert.is_nil (encrypt inputdata, 'Only keys speak in absolutes')
            assert.stub(print).was.called 1
        it 'rejects non table key and input', ->
            encrypt = secua.aes.ecb.encrypt
            assert.is_nil (encrypt 'The apprentice has become the master', 'only a master of evil darth')
            assert.stub(print).was.called 1
        it 'A key of incorrect length', ->
            inputkey = { 
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x67, 0x89, 0xAB, 0xCD, 0xEF  
            }
            inputdata = {
                0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF,
                0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10, 0xFE
            }
            encrypt = secua.aes.ecb.encrypt
            assert.is_nil (encrypt inputdata, inputkey)
            assert.stub(print).was.called 1