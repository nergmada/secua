local keyschedule = (require('aes/keyschedule'))('')
return describe('Secua Unit Tests', function()
  return describe('Advanced Encryption Standard Unit Tests', function()
    return describe('Key Schedule Unit Tests', function()
      return print(keyschedule.keyschedule({
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00
      }))
    end)
  end)
end)
