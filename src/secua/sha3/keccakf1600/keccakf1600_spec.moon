describe 'Keccak f1600 rearrangement tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        stub _G, "print"
    
    it 'correctly rearranges the data and produce the correct state', ->
        result = secua.sha3.keccakf1600 [ 0x00 for i = 1, 200]
        expected = secua.utils.hexBytify "E7DDE140798F25F18A47C033F9CCD584EEA95AA61E2698D54D49806F304715BD57D05362054E288BD46F8E7F2DA497FFC44746A4A0E5FE90762E19D60CDA5B8C9C05191BF7A630AD64FC8FD0B75A933035D617233FA95AEB0321710D26E6A6A95F55CFDB167CA58126C84703CD31B8439F56A5111A2FF20161AED9215A63E505F270C98CF2FEBE641166C47B95703661CB0ED04F555A7CB8C832CF1C8AE83E8C14263AAE22790C94E409C5A224F94118C26504E72635F5163BA1307FE944F67549A2EC5C7BFFF1EA"
        assert.are.same expected, result
    it 'correctly rejects a non existent byte array input', ->
        result = secua.sha3.keccakf1600!
        assert.is_nil result 
        assert.stub(print).was.called!
    it 'correctly rejects a byte array that is too short for a 1600 bit transform', ->
        result = secua.sha3.keccakf1600 { 0x00 }
        assert.is_nil result 
        assert.stub(print).was.called!