# secua.aes.encrypt
`secua.aes.encrypt` contains three functions for encrypting single blocks
of data according to a given key. It has no modes of operation to it 
and can be thought of as a transformation of a block according to AES with
the given key.

The key provided must already have been passed through the key schedule
algorithm for AES.

```lua
secua.aes.encrypt.bit128(block, expandedkey)
secua.aes.encrypt.bit192(block, expandedkey)
secua.aes.encrypt.bit256(block, expandedkey)
```

## aes.encrypt.bit128(block, expandedkey)
bit128 takes an expanded 128 bit key and a 128 bit block and performs
the AES encryption algorithm on it as specified for 128 bit keys.

This involves 10 rounds of the algorithm plus an additional round based on
merely XORing with the first round key

```lua
local secua = require('path/to/secua')('path/to/secua')

--use the keyschedule function to transform a 128 bit key into its expansion
local expandedkey = secua.aes.keyschedule({
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 
    0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f 
})
-- our data has to be 128 bits long, it will not pad automatically
local block = { 
    0x0f, 0x0e, 0x0d, 0x0c, 0x0b, 0x0a, 0x09, 0x08,
    0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00    
}
--encrypted block is output as a table of bytes
local encryptedblock = secua.aes.encrypt.bit128(block, expandedkey)
```

as shown in CBC and ECB pages as well as the util pages, I provide functions
for converting hexidecimal and strings into byte tables and vice versa. These 
can be used to make readability easier.

## aes.encrypt.bit192(block, expandedkey)
bit192 takes an expanded 192 bit key and a 128 bit block and performs
the AES encryption algorithm on it as specified for 192 bit keys.

this involves 12 rounds of the algorithm plus an additional round based on
merely XORing the first round key

```lua
local secua = require('path/to/secua')('path/to/secua')

--use the keyschedule function to transform a 192 bit key into its expansion
local expandedkey = secua.aes.keyschedule({
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 
    0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
    0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17 
})
-- our data has to be 128 bits long, it will not pad automatically
local block = { 
    0x0f, 0x0e, 0x0d, 0x0c, 0x0b, 0x0a, 0x09, 0x08,
    0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00    
}
--encrypted block is output as a table of bytes
local encryptedblock = secua.aes.encrypt.bit192(block, expandedkey)
```
as shown in CBC and ECB pages as well as the util pages, I provide functions
for converting hexidecimal and strings into byte tables and vice versa. These 
can be used to make readability easier.

## aes.encrypt.bit256(block, expandedkey)
bit256 takes an expanded 256 bit key and a 128 bit block and performs
the AES encryption algorithm on it as specified for 256 bit keys.

this involves 14 rounds of the algorithm plus an additional round based on
merely XORing the first round key

```lua
local secua = require('path/to/secua')('path/to/secua')

--use the keyschedule function to transform a 256 bit key into its expansion
local expandedkey = secua.aes.keyschedule({
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 
    0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
    0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
    0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f 
})
-- our data has to be 128 bits long, it will not pad automatically
local block = { 
    0x0f, 0x0e, 0x0d, 0x0c, 0x0b, 0x0a, 0x09, 0x08,
    0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00    
}
--encrypted block is output as a table of bytes
local encryptedblock = secua.aes.encrypt.bit256(block, expandedkey)
```

as shown in CBC and ECB pages as well as the util pages, I provide functions
for converting hexidecimal and strings into byte tables and vice versa. These 
can be used to make readability easier.

