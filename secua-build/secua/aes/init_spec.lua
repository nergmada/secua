local keyschedule_tests = require('secua/aes/keyschedule_spec')
return function()
  print('- running key schedule tests')
  return keyschedule_tests()
end
