describe 'Bytify String Function tests', ->
    secua = nil

    setup () ->
        secua = (require 'secua')('secua')
    
    before_each () ->
        stub _G, 'print'

    it 'correctly converts a given string to its byte equivalent', ->
        bytify = secua.utils.bytify
        expected = { 
            0x4f, 0x62, 0x69, 0x20, 0x57, 0x61, 0x6e, 0x20, 0x4b, 0x65, 0x6e, 0x6f, 0x62, 0x69
        }
        result = bytify 'Obi Wan Kenobi'
        assert.are.same expected, result
    
    it 'rejects a non-existent input', ->
        bytify = secua.utils.bytify
        assert.is_nil bytify!
        assert.stub(print).was.called!
    
    it 'rejects a non string input', ->
        bytify = secua.utils.bytify
        assert.is_nil bytify 12
        assert.stub(print).was.called!