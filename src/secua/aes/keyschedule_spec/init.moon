secua = (require 'secua')('secua')
keyschedule = secua.aes.keyschedule
keycomparator = secua.utils.keycomparator

keydata = (require 'secua/aes/keyschedule_spec/keydata')

return () ->
    for keytestno = 1, #keydata.inputkeys
        inputkey = keydata.inputkeys[keytestno]
        outputkey = keydata.outputkeys[keytestno]

        keyscheduleresult = keyschedule inputkey

        resultA = keycomparator outputkey, keyscheduleresult
        print '- - comparing expanded key ' .. keytestno .. ' to expected (' .. #inputkey * 8 .. ' bit): ' .. tostring(resultA == true)
    