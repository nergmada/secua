secua = (require 'secua')('secua')
return () ->
    secua.utils.keys
    
    resultA = secua.utils.keycomparator '9sei38s93', '9sei38s93'
    print '- - compares two matching string keys: ' .. tostring(resultA == true)
    
    resultB = secua.utils.keycomparator 'f834jek', '9sei38s93'
    print '- - compares two non-matching string keys: ' .. tostring(resultB != true)

    resultC = secua.utils.keycomparator '434vrf', true
    print '- - does not compare invalid types: ' .. tostring(resultC != true)

    resultD = secua.utils.keycomparator { 0xff, 0xff }, { 0xff, 0xff }
    print '- - compares two matching byte keys: ' .. tostring(resultD == true)

    resultE = secua.utils.keycomparator { 0xff, 0xff }, { 0x00, 0x00 }
    print '- - compares two non-matching byte keys: ' .. tostring(resultE != true)