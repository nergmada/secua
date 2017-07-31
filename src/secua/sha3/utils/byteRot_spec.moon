describe 'Keccak SHA 33 tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        --stub _G, "print"
    it 'correctly rotates a given byte array one bit', ->
        result = secua.sha3.utils.byteRot { 0x80, 0x01 }, 1
        assert.are.same { 0x00, 0x03 }, result
    it 'correctly rotates a given byte array one byte', ->
        result = secua.sha3.utils.byteRot { 0x80, 0x01 }, 8
        assert.are.same { 0x01, 0x80 }, result
    it 'correctly rotates a given byte array nine bits', ->
        result = secua.sha3.utils.byteRot { 0x80, 0x01 }, 9
        assert.are.same { 0x03, 0x00 }, result
    it 'correctly rotates a given lane 18 bits', ->
        result = secua.sha3.utils.byteRot { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01 }, 18
        assert.are.same { 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00 }, result