describe 'Bit Array tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        --stub _G, "print"

    it 'correctly loads a new array of bytes and returns upon request', ->
        bitArray = secua.sha3.bitArray2
        array = bitArray { 0x0101, 0x0202, 0x0303, 0x0404 }, 16
        expected = { 0x01, 0x01, 0x02, 0x02, 0x03, 0x03, 0x04, 0x04 }
        assert.are.same expected, array.getBytes!
    
    it 'correctly changes a bit in the array', ->
        bitArray = secua.sha3.bitArray2
        array = bitArray { 0x01010101, 0x02020202, 0x03030303, 0x04040404 }, 32
        expected = { 0x81, 0x01, 0x01, 0x01, 0x02, 0x02, 0x02, 0x02, 0x03, 0x03, 0x03, 0x03, 0x04, 0x04, 0x04, 0x04 }
        array.setBit 1, true
        assert.are.same expected, array.getBytes!
    
    it 'correctly retrieves a given false bit', ->
        bitArray = secua.sha3.bitArray
        array = bitArray { 0x0101010101010101, 0x0202020202020202, 0x0303030303030303, 0x0404040404040404 }
        assert.is_false array.getBit 10