keyschedule = (require 'aes/keyschedule')('')
describe 'Secua Unit Tests', () ->
    describe 'Advanced Encryption Standard Unit Tests', () ->
        describe 'Key Schedule Unit Tests', () ->
            print keyschedule.keyschedule { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }
