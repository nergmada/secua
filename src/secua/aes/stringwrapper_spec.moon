describe 'AES Block Cipher Mode wrapper encryption', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        stub _G, "print"

    describe 'Electronic Codebook Mode', ->
        it 'correctly encrypts a given string with a given string key', ->
            ecbCipher = secua.aes.stringEncryption secua.aes.ecb
            expected = {
                0x84, 0x17, 0x07, 0x63, 0x46, 0x1D, 0x7C, 0xFD, 0x7D, 0x56, 0xEF, 0xCD, 0xA8, 0x7D, 0x59, 0x3B
            }
            assert.are.same '84170763461D7CFD7D56EFCDA87D593B', ecbCipher.stringEncrypt 'hello world', 'losingmyreligion'