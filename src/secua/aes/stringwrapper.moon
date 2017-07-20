return (path) ->
    log = (require path .. '/utils/errorlog')
    stringify = (require path .. '/utils/stringify')(path)
    bytify = (require path .. '/utils/bytify')(path)
    hexify = (require path .. '/utils/hexify')(path)

    return (cipherMode) ->
        if (not cipherMode) or (type cipherMode) != 'table'
            log 'No cipher mode provided or cipher mode is invalid', 1
            return nil
        if (not cipherMode.encrypt) or (not cipherMode.decrypt)
            log 'Cipher mode does not contain the necessary functions - encrypt and decrypt', 1
            return nil
        switch cipherMode.mode
            when 'cbc'
                return { 
                    stringEncrypt: (str, key, iv) ->
                        hexify cipherMode.encrypt (bytify str), (bytify key), iv
                    stringDecrypt: (str, key, iv) ->
                        hexify cipherMode.decrypt (bytify str), (bytify key), iv
                    encrypt: cipherMode.encrypt
                    decrypt: cipherMode.decrypt
                }
            when 'ecb'
                return { 
                    stringEncrypt: (str, key) ->
                        hexify cipherMode.encrypt (bytify str), (bytify key)
                    stringDecrypt: (str, key) ->
                        hexify cipherMode.decrypt (bytify str), (bytify key)
                    hexEncrypt: (str, key) ->
                        hexify cipherMode.encrypt (bytify str), (bytify key)
                    hexDecrypt: (str, key) ->
                        hexify cipherMode.decrypt (bytify str), (bytify key)
                    
                    encrypt: cipherMode.encrypt
                    decrypt: cipherMode.decrypt
                }