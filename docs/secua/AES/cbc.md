# secua.aes.cbc (AES CBC Mode)
secua.aes.cbc is the Secua implementation of Cipher Block Chaining
mode of operation. it contains two functions:
```lua
secua.aes.cbc.encrypt(data, key, iv)
secua.aes.cbc.decrypt(data, key, iv)
```

## What is Cipher Block Chaining?
Cipher block chaining is a mode of operation for AES. 

Basically, when AES encrypts data, it *normally* breaks it into chunks, called
blocks. These blocks are then encrypted one by one.

This type of encryption, known as Electronic Codebook is 
normally insecure and not good at getting rid of patterns in the data 
being encrypted, because two identical blocks create the same encrypted blocks

here's an example, pre and post encryption using ECB

![pre encryption](https://upload.wikimedia.org/wikipedia/commons/5/56/Tux.jpg)
![post encryption](https://upload.wikimedia.org/wikipedia/commons/f/f0/Tux_ecb.jpg)

Cipher Block Chaining aims to solve this by XORing the the next block with the encrypted
previous block, before encrypting the next block with the given key

![cbc](https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/CBC_encryption.svg/1202px-CBC_encryption.svg.png)

Above shows the diagram. The problem is, we need something XOR the first block against.
The solution is to use what is known as an initialisation vector.

Unlike the key, the IV does really need to be kept secure, as it's only useful for decrypting the first block
after said block has been decrypted by the AES algorithm with the secret key

## aes.cbc.encrypt(data, key, iv)
To encrypt we need data to encrypt, a secret key and an IV.

for now we will assume we have all three. Key generation and IV generation
are not provided by this library currently as I have no Cryptographically secure
pseudo-random Number Generators (CSPRNG) implemented.

The data is of course provided by you. This function expects all data to be 
passed in in a table of bytes. The utils part of this package provides tools to 
translate your data (for example strings) into byte tables with minimal effort.

```lua
local secua = require('path/to/secua')('path/to/secua')
--Our data as single bytes
local data = { 0x01, 0x02, 0x03, 0x04, 0x05 }
--Our key, 16 bytes long, or 128 bits
local key = { 
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 
    0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f 
}
-- Our IV has to be as large as our blocksize (which is also 128 bits) NOT our key size
local iv = {
    0x0f, 0x0e, 0x0d, 0x0c, 0x0b, 0x0a, 0x09, 0x08,
    0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00
}
--Our encrypted data also comes out as a table of bytes
local encrypteddata = secua.aes.cbc.encrypt(data, key, iv)
```

let's be honest though, no one writes byte arrays of data. Here's an example that
uses some `secua.utils` methods. 

```lua
--Import secua
local secua = require('path/to/secua')('path/to/secua')
--Get the function for turning strings into bytes
local bytify = secua.utils.bytify
--Get the function for turn hexidecimal strings into bytes
local hexBytify = secua.utils.hexBytify
--Get the function for turning a byte table into a hex string
local hexify = secua.utils.hexify

--Serious top secret rebel communique
local data = bytify('Why, you stuck up... half-witted... scruffy-looking... Nerf-herder!')
--Our secret key a hexidecimal string which is 32 characters long and can be turned into 16 bytes
local key = hexBytify('ab0fcd03eb12fc11aa437982ecba1bf2')
--Our initialisation vector, again a 32 character hexidecimal string which equates to 16 bytes
local iv = hexBytify('de3283bc38eb218a28f88ac3e9912cde')

--encrypt our data and turn the resulting byte table into a hexidecimal string
local encrypteddata = hexify(secua.aes.cbc.encrypt(data, key, iv))
```

## aes.cbc.decrypt(data, key, iv)
If we are decrypting data, we can assume that we know the data, key
and iv already as they've been used to encrypt the data. 

In this example we won't use the utils as shown in the second example
for encrypting

```lua
local secua = require('path/to/secua')('path/to/secua')
--Our data as single bytes
local data = { 0xad, 0x2c, 0xb6, 0x1c, 0x75 }
--Our key, 16 bytes long, or 128 bits
local key = { 
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 
    0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f 
}
-- Our IV has to be as large as our blocksize (which is also 128 bits) NOT our key size
local iv = {
    0x0f, 0x0e, 0x0d, 0x0c, 0x0b, 0x0a, 0x09, 0x08,
    0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00
}
--Our decrypted data also comes out as a table of bytes
local decrypteddata = secua.aes.cbc.decrypt(data, key, iv)
```

The same utils as discussed in encryption can be used as well, with one added
tool which may also be useful

```lua
--Import secua
local secua = require('path/to/secua')('path/to/secua')
--Get the function for turning bytes into strings
local stringify = secua.utils.stringify
--Get the function for turn hexidecimal strings into bytes
local hexBytify = secua.utils.hexBytify
--Get the function for turning a byte table into a hex string
local hexify = secua.utils.hexify

--Our completely indecipherable data NOTE: the encrypted data here is not an encryption of the text in the 
--encrypted example. It's just some random hexidecimal I entered
local data = hexBytify('0390bac90ae809deb190cf09de0a90b9c9se8237276a21b')
--Our secret key a hexidecimal string which is 32 characters long and can be turned into 16 bytes
local key = hexBytify('ab0fcd03eb12fc11aa437982ecba1bf2')
--Our initialisation vector, again a 32 character hexidecimal string which equates to 16 bytes
local iv = hexBytify('de3283bc38eb218a28f88ac3e9912cde')

--decrypt our data and turn the resulting byte table into a string
local decrypteddata = stringify(secua.aes.cbc.decrypt(data, key, iv))
```

## Other Important info
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
