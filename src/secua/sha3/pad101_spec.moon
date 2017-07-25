describe 'Pad 10*1 tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        stub _G, "print"
    
    it 'correctly pads a given piece of data to the correct length, including two bit suffix', ->
        input = { 0x00, 0x01, 0x02, 0x03, 0x04 }
        expected = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x60, 0x00, 0x01 }
        result = secua.sha3.pad101 64, input, true
        assert.are.same expected, result