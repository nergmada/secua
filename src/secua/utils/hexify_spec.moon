describe 'Stringify Bytes Function tests', ->
    secua = nil

    setup () ->
        secua = (require 'secua')('secua')
    
    before_each () ->
        stub _G, 'print'

    it 'correctly converts a given string to its byte equivalent', ->
        hexify = secua.utils.hexify
        inputbytes = { 
            0x4f, 0x62, 0x69, 0x20, 0x57, 0x61, 0x6e, 0x20, 0x4b, 0x65, 0x6e, 0x6f, 0x62, 0x69
        }
        result = hexify inputbytes
        assert.are.same '4F62692057616E204B656E6F6269', result
    
    it 'rejects a non-existent input', ->
        hexify = secua.utils.hexify
        assert.is_nil hexify!
        assert.stub(print).was.called!
    
    it 'rejects a non string input', ->
        hexify = secua.utils.hexify
        assert.is_nil hexify 12
        assert.stub(print).was.called!