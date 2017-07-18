local secua = (require('secua'))('secua')
local keyschedule = secua.aes.keyschedule
local keycomparator = secua.utils.keycomparator
local keydata = (require('secua/aes/keyschedule_spec/keydata'))
return function()
  for keytestno = 1, #keydata.inputkeys do
    local inputkey = keydata.inputkeys[keytestno]
    local outputkey = keydata.outputkeys[keytestno]
    local keyscheduleresult = keyschedule(inputkey)
    local resultA = keycomparator(outputkey, keyscheduleresult)
    print('- - comparing expanded key ' .. keytestno .. ' to expected: ' .. tostring(resultA == true))
  end
end
