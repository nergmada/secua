describe 'Byte to State Utility tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        stub _G, "print"
    it 'correctly converts a byte to a state', ->
        hexBytify = secua.utils.hexBytify
        input = hexBytify "0000000000000000000000000000000100000000000000020000000000000003000000000000000400000000000000050000000000000006000000000000000700000000000000080000000000000009000000000000000A000000000000000B000000000000000C000000000000000D000000000000000E000000000000000F000000000000001000000000000000110000000000000012000000000000001300000000000000140000000000000015000000000000001600000000000000170000000000000018"
        expected = {
            [0]: {
                [0]: hexBytify '0000000000000000',
                hexBytify '0500000000000000',
                hexBytify '0a00000000000000',
                hexBytify '0f00000000000000',
                hexBytify '1400000000000000',
            }, {
                [0]: hexBytify '0100000000000000',
                hexBytify '0600000000000000',
                hexBytify '0b00000000000000',
                hexBytify '1000000000000000',
                hexBytify '1500000000000000',
            }, {
                [0]: hexBytify '0200000000000000',
                hexBytify '0700000000000000',
                hexBytify '0c00000000000000',
                hexBytify '1100000000000000',
                hexBytify '1600000000000000',
            }, {
                [0]: hexBytify '0300000000000000',
                hexBytify '0800000000000000',
                hexBytify '0d00000000000000',
                hexBytify '1200000000000000',
                hexBytify '1700000000000000',
            }, {
                [0]: hexBytify '0400000000000000',
                hexBytify '0900000000000000',
                hexBytify '0e00000000000000',
                hexBytify '1300000000000000',
                hexBytify '1800000000000000',
            }
        }
        assert.are.same expected, secua.sha3.utils.bytesToState input
    it 'rejects a non-existent byte array', ->
        result = secua.sha3.utils.bytesToState!
        assert.is_nil result 
        assert.stub(print).was.called!