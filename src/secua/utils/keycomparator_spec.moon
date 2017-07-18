describe 'Key Comparator Tests', () ->
    secua = nil
    
    setup () ->
        secua = (require 'secua')('secua')

    it 'compares two matching string keys', () ->
        assert.is_true(secua.utils.keycomparator '9sei38s93', '9sei38s93')
    
    it 'compares two non-matching string keys', () ->
        assert.is_false(secua.utils.keycomparator 'f834jek', '9sei38s93')

    it 'compares two matching byte keys', () ->
        assert.is_true(secua.utils.keycomparator { 0xff, 0xff }, { 0xff, 0xff })

    it 'compares two non-matching byte keys', () ->
        assert.is_false(secua.utils.keycomparator { 0xff, 0xff }, { 0x00, 0x00 })
    
    it 'does not compare invalid types', () ->
        assert.is_false(secua.utils.keycomparator '434vrf', true)
