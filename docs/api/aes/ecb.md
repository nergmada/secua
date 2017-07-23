# secua.aes.ecb (ECB Mode)
`secua.aes.ecb` contains two functions, for encrypting and decrypting 
according to the ECB encryption mode. these functions are as follows

```lua
secua.aes.ecb.encrypt(data, key)
secua.aes.ecb.decrypt(data, key)
```

No prizes for which one does which.

## What is Electronic Code Book?
Electronic Code Book is the most fundamentally basic form of encryption 
pretty much all encryption algorithms are specified to take in a set size
of information and transform it. 

However, as a result of this, two pieces of data of that are identical 
get encrypted to the same encryption block. This is not ideal as it results
in patterns emerging in the encrypted data, particular when patterns already 
exist

![pre encryption](https://upload.wikimedia.org/wikipedia/commons/5/56/Tux.jpg)
![post encryption](https://upload.wikimedia.org/wikipedia/commons/f/f0/Tux_ecb.jpg)

see the example above for pre and post encryption of an image according to 
ECB. 

*ECB is not a recommended encryption mode*, it is provided because it was easy to
implement and because no matter how much you safety proof something, people can still
find ways to hurt themselves.

## secua.aes.ecb.encrypt(data, key)
The encrypt method in ECB is able to take an arbitrary length of data, and either
a 128, 192 or 256 bit length key and encrypt it. The key should not be expanded.

```lua
local secua = require('path/to/secua')('path/to/secua')
--Our data as single bytes
local data = { 0x01, 0x02, 0x03, 0x04, 0x05 }
--Our key, 16 bytes long, or 128 bits
local key = { 
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 
    0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f 
}
--Our encrypted data also comes out as a table of bytes
local encrypteddata = secua.aes.ecb.encrypt(data, key)
```
of course it's not ideal that our data is currently a table of bytes,
we almost certainly want to encrypt strings or hexidecimal.

I provide a set of functions for -ifying stuff into a table of bytes,
these include `bytify` and `hexBytify`.

```lua
local secua = require('path/to/secua')('path/to/secua')
-- a function for converting a string to a table of bytes
local bytify = secua.utils.bytify
-- a function for converting a hexidecimal string into a table of bytes
local hexBytify = secua.utils.hexBytify
-- a function for converting a table of bytes into a hex string
local hexify = secua.utils.hexify
--Our secret information
local data = bytify('Say what one more time... I dare you')
--Our key, 16 bytes long, or 128 bits as a hexidecimal string
local key = hexBytify('0ab987c60d9e7232f7a89bcde827a736')
--Our encrypted data also comes out as a table of bytes so lets turn it 
-- into a hex string
local encrypteddata = hexify(secua.aes.ecb.encrypt(data, key))
```

## secua.aes.ecb.decrypt(data, key)
The decrypt method in ECB is able to take an arbitrary length of data, and either
a 128, 192 or 256 bit length key and decrypt it. The key should not be expanded.

furthermore, the decrypt method will not decrypt data that is not a multiple of the blocksize
unlike encrypt which will pad the data, aes decrypt assumes that the data being
decrypted is already encrypted.
```lua
local secua = require('path/to/secua')('path/to/secua')
--Our data as single bytes, NOTE: the decrypt method will not accept
-- data that is not a multiple of the block size. 
local data = { 
    0xad, 0x2c, 0xb6, 0x1c, 0x75, 0xac, 0x0a, 0x12, 
    0x21, 0x43, 0xbd, 0x1a, 0x21, 0x32, 0x01, 0xad
}
--Our key, 16 bytes long, or 128 bits
local key = { 
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 
    0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f 
}
--Our decrypted data also comes out as a table of bytes
local decrypteddata = secua.aes.ecb.decrypt(data, key)
```
of course it's not ideal that our data is currently a table of bytes,
we almost certainly want to decrypt strings or hexidecimal - ideally
hex as strings don't play well as ciphertext.

I provide a set of functions for -ifying stuff into a table of bytes,
these include `bytify` and `hexBytify`.

```lua
local secua = require('path/to/secua')('path/to/secua')
-- a function for converting a table of bytes to a string
local stringify = secua.utils.stringify
-- a function for converting a hexidecimal string into a table of bytes
local hexBytify = secua.utils.hexBytify
-- a function for converting a table of bytes into a hex string
local hexify = secua.utils.hexify
--Our secret information to be decrypted. Note this data 
--is not the encrypted data of the example in the encryption method
local data = hexBytify('0390bac90ae809deb190cf09de0a90b9c9se8237276a21b0acde426d7ab6cd5e')
--Our key, 16 bytes long, or 128 bits as a hexidecimal string
local key = hexBytify('0ab987c60d9e7232f7a89bcde827a736')
--Our encrypted data also comes out as a table of bytes so lets turn it 
-- into the original string
local decrypteddata = stringify(secua.aes.ecb.decrypt(data, key))
```

## More Important information
- Auto Padding - if the data provided is not a multiple of the aes
    128 bit block size, then it will be padded to make it a multiple. This is according to PCKS7
    padding scheme. 

    If you don't want this, I will eventually provided
    additional padding functions in utils, so you can pad it before passing
- block size and keysize don't have to match. AES allows three key sizes
    but only one block size. 
- the stringify and bytify functions appear to be cross platform compatible
    but whilst writing them I found a weird footnote in the lua library saying that
    not all systems will return the same character numbers when evaluating `string.byte()`
- the decrypt method will not accept data that is not a multiple of the block size. Auto padding
    only happens during encryption and not decryption