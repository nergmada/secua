local secua = (require('secua'))('secua')
return function()
  local _ = secua.utils.keys
  local resultA = secua.utils.keycomparator('9sei38s93', '9sei38s93')
  print('- - compares two matching string keys: ' .. tostring(resultA == true))
  local resultB = secua.utils.keycomparator('f834jek', '9sei38s93')
  print('- - compares two non-matching string keys: ' .. tostring(resultB ~= true))
  local resultC = secua.utils.keycomparator('434vrf', true)
  print('- - does not compare invalid types: ' .. tostring(resultC ~= true))
  local resultD = secua.utils.keycomparator({
    0xff,
    0xff
  }, {
    0xff,
    0xff
  })
  print('- - compares two matching byte keys: ' .. tostring(resultD == true))
  local resultE = secua.utils.keycomparator({
    0xff,
    0xff
  }, {
    0x00,
    0x00
  })
  return print('- - compares two non-matching byte keys: ' .. tostring(resultE ~= true))
end
