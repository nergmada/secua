describe 'Theta step tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        --stub _G, "print"
    
    it 'correctly loads and returns a provided byte array', ->
        input = { 
            0x01, 0x02, 0x03, 0x04, 0x05, 
            0x06, 0x07, 0x08, 0x09, 0x0a, 
            0x01, 0x02, 0x03, 0x04, 0x05, 
            0x06, 0x07, 0x08, 0x09, 0x0a, 
            0x01, 0x02, 0x03, 0x04, 0x05 
        }
        expected = {
            0x05, 0x82, 0x03, 0x85, 0x81,
            0x02, 0x87, 0x08, 0x88, 0x8E,
            0x05, 0x82, 0x03, 0x85, 0x81,
            0x02, 0x87, 0x08, 0x88, 0x8E,
            0x05, 0x82, 0x03, 0x85, 0x81
        }
        state = secua.sha3.state input
        assert.are.same expected, (secua.sha3.steps.theta state).getBytes!