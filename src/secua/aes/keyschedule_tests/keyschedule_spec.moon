secua = (require 'secua')('secua')
keyschedule = secua.aes.keyschedule


describe 'AES Key Schedule tests', () ->
    inputkeys, outputkeys = nil, nil
    setup () ->
        keydata = (require 'secua/aes/keyschedule_tests/keydata')
        inputkeys, outputkeys = keydata.inputkeys, keydata.outputkeys
        
    it 'parses the first key correctly (128 bits)', () ->
        assert.are.same((keyschedule inputkeys[1]), outputkeys[1])
    it 'parses the second key correctly (128 bits)', () ->
        assert.are.same((keyschedule inputkeys[2]), outputkeys[2])
    it 'parses the third key correctly (128 bits)', () ->
        assert.are.same((keyschedule inputkeys[3]), outputkeys[3])
    it 'parses the fourth key correctly (128 bits)', () ->
        assert.are.same((keyschedule inputkeys[4]), outputkeys[4])
    it 'parses the fifth key correctly (192 bits)', () ->
        assert.are.same((keyschedule inputkeys[5]), outputkeys[5])
    it 'parses the sixth key correctly (192 bits)', () ->
        assert.are.same((keyschedule inputkeys[6]), outputkeys[6])
    it 'parses the seventh key correctly (192 bits)', () ->
        assert.are.same((keyschedule inputkeys[7]), outputkeys[7])
    it 'parses the eighth key correctly (256 bits)', () ->
        assert.are.same((keyschedule inputkeys[8]), outputkeys[8])
    it 'parses the ninth key correctly (256 bits)', () ->
        assert.are.same((keyschedule inputkeys[9]), outputkeys[9])
    it 'parses the tenth key correctly (256 bits)', () ->
        assert.are.same((keyschedule inputkeys[10]), outputkeys[10])