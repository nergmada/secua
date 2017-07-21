describe 'Bit Array tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        stub _G, "print"

    it 'correctly loads a new array of bytes and returns upon request', ->
        bitArray = secua.sha3.bitArray
        array = bitArray { 0x01, 0x02, 0x03, 0x04 }
        expected = { 0x01, 0x02, 0x03, 0x04 }
        assert.are.same expected, array.getBytes!
    
    it 'correctly changes a bit in the array', ->
        bitArray = secua.sha3.bitArray
        array = bitArray { 0x01, 0x02, 0x03, 0x04 }
        expected = { 0x81, 0x02, 0x03, 0x04 }
        array.setBit 1, true
        assert.are.same expected, array.getBytes!
    
    it 'correctly retrieves a given false bit', ->
        bitArray = secua.sha3.bitArray
        array = bitArray { 0x01, 0x02, 0x03, 0x04 }
        assert.is_false array.getBit 10
    
    it 'correctly retrieves a given true bit', ->
        bitArray = secua.sha3.bitArray
        array = bitArray { 0x01, 0x02, 0x03, 0x04 }
        assert.is_true array.getBit 8