describe 'PCKS7 Padding Tests', () ->
    secua = nil

    setup () ->
        secua = (require 'secua')('secua')
    
    before_each () ->
        stub _G, 'print'

    describe 'Add Padding Tests', ->
        it 'correctly adds padding to data', ->
            pcks7 = secua.utils.padding.pcks7
            input = { 0x05, 0xf3, 0x06, 0x12 }
            expected = { 0x05, 0xf3, 0x06, 0x12, 0x04, 0x04, 0x04, 0x04 }
            result = pcks7.pad input, 8
            assert.are.same expected, result
        
        it 'rejects an non existent desired block size', ->
            pcks7 = secua.utils.padding.pcks7
            input = { 0x05, 0xf3, 0x06, 0x12 }
            assert.is_nil pcks7.pad input, nil
            assert.stub(print).was.called!

        it 'rejects an non existent desired data', ->
            pcks7 = secua.utils.padding.pcks7
            assert.is_nil pcks7.pad nil, 8
            assert.stub(print).was.called!

        it 'rejects an invalid data argument', ->
            pcks7 = secua.utils.padding.pcks7
            assert.is_nil pcks7.pad 'not a table of bytes, sorry', 8
            assert.stub(print).was.called!
        
        it 'rejects an invalid type for desired block size', ->
            pcks7 = secua.utils.padding.pcks7
            input = { 0x05, 0xf3, 0x06, 0x12 }
            assert.is_nil pcks7.pad input, '8 is not an answer'
            assert.stub(print).was.called!

    describe 'Remove Padding Tests', ->
        it 'correctly removes padding to data', ->
            pcks7 = secua.utils.padding.pcks7
            input = { 0x05, 0xf3, 0x06, 0x12, 0x04, 0x04, 0x04, 0x04 }
            expected = { 0x05, 0xf3, 0x06, 0x12 }
            result = pcks7.depad input
            assert.are.same expected, result
        
        it 'rejects an invalid type for data', ->
            pcks7 = secua.utils.padding.pcks7
            assert.is_nil pcks7.pad '8 is not an answer'
            assert.stub(print).was.called!
        
        it 'rejects non existent data', ->
            pcks7 = secua.utils.padding.pcks7
            assert.is_nil pcks7.pad nil
            assert.stub(print).was.called!
    