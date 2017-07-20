describe 'Stringify Bytes Function tests', ->
    secua = nil

    setup () ->
        secua = (require 'secua')('secua')
    
    before_each () ->
        stub _G, 'print'

    it 'correctly converts a given string to its byte equivalent', ->
        hexBytify = secua.utils.hexBytify
        expected = { 
            0x4f, 0x62, 0x69, 0x20, 0x57, 0x61, 0x6e, 0x20, 0x4b, 0x65, 0x6e, 0x6f, 0x62, 0x69
        }
        result = hexBytify '4F62692057616E204B656E6F6269'
        assert.are.same expected, result
    
    it 'rejects a non-existent input', ->
        hexBytify = secua.utils.hexBytify
        assert.is_nil hexBytify!
        assert.stub(print).was.called!
    
    it 'rejects a non string input', ->
        hexBytify = secua.utils.hexBytify
        assert.is_nil hexBytify 12
        assert.stub(print).was.called!