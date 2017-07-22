describe 'RC lookup tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        --stub _G, "print"
    
    it 'corresponds correctly to the RC Lookup table', ->
        assert.is_equal (secua.sha3.steps.rclookup[22]), (secua.sha3.steps.rc 22) 