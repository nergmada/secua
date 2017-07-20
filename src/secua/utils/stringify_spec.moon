describe 'Stringify Bytes Function tests', ->
    secua = nil

    setup () ->
        secua = (require 'secua')('secua')
    
    before_each () ->
        stub _G, 'print'

    it 'correctly converts a given string to its byte equivalent', ->
        stringify = secua.utils.stringify
        inputbytes = { 
            0x4f, 0x62, 0x69, 0x20, 0x57, 0x61, 0x6e, 0x20, 0x4b, 0x65, 0x6e, 0x6f, 0x62, 0x69
        }
        result = stringify inputbytes
        assert.are.same 'Obi Wan Kenobi', result
    
    it 'rejects a non-existent input', ->
        stringify = secua.utils.stringify
        assert.is_nil stringify!
        assert.stub(print).was.called!
    
    it 'rejects a non string input', ->
        stringify = secua.utils.stringify
        assert.is_nil stringify 12
        assert.stub(print).was.called!