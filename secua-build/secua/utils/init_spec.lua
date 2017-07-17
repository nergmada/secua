local keycomparator_tests = require('secua/utils/keycomparator_spec')
return function()
  print('- running key comparator tests')
  return keycomparator_tests()
end
