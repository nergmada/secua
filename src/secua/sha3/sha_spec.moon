describe 'SHA3 Tests tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    before_each ->
        --stub _G, "print"
    it 'correctly hashes Elisa in SHA224', ->
        hexBytify = secua.utils.hexBytify
        bytify = secua.utils.bytify
        
        result = secua.sha3.sha224 bytify 'Elisa'
        expected = hexBytify '7fed3c40266c5f629e9a6eea27375781a0e98c7e4c56cf3c078b3be9'
        assert.are.same expected, result
    it 'correctly hashes Elisa in SHA256', ->
        hexBytify = secua.utils.hexBytify
        bytify = secua.utils.bytify

        result = secua.sha3.sha256 bytify 'Elisa'
        expected = hexBytify '5117db8b1beb1e303b302a3f00dea434e0908faceb18b676f08a438b7546aa87'
        assert.are.same expected, result
    it 'correctly hashes Elisa in SHA384', ->
        hexBytify = secua.utils.hexBytify
        bytify = secua.utils.bytify

        result = secua.sha3.sha384 bytify 'Elisa'
        expected = hexBytify '8b3335325f570a8d8ad0076b06e9a18c1940cf6e2682fe9a2736dedd44f90a41b278994cfaef23d5a87b5daeb08918e8'
        assert.are.same expected, result
    it 'correctly hashes Elisa in SHA512', ->
        hexBytify = secua.utils.hexBytify
        bytify = secua.utils.bytify

        result = secua.sha3.sha512 bytify 'Elisa'
        expected = hexBytify '5bceeeb07e110aa32e083842baa32cab9378e4fa4a588c357f50b9b0c369dcbb34b65b2ea7c0be57dfe045d908cda987820b78c53ae8df3b3e116844f25b459c'
        assert.are.same expected, result

