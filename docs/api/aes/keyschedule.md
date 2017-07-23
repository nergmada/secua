# secua.aes.keyschedule(key)
The `secua.aes.keyschedule` function is used for "expanding" the key
according to the AES encryption standard.

As stated in the encrypt and decrypt pages of this wiki, AES performs a
different number of encryption and decryption rounds on data according to the key
size.

- 128 Bit Key - 10 rounds
- 192 Bit Key - 12 rounds
- 256 Bit Key - 14 rounds

The key schedule makes the keys large enough so that they can perform each
one of these rounds. in the case of a 128 bit key, an expanded key of
`128 bits * 11` is generated, for 192 bit keys it's `192 * 13` and for 256
bit keys, it's `256 * 15`.

They keyschedule is really easy to use, but really hard to understand the inner workings
of. It can be used like this 

```lua
local secua = require('path/to/secua')('path/to/secua')

local key = {
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
    0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f
}

local expandedkey = secua.aes.keyschedule(key)
```

the keyschedule function will accept any of the three key sizes, 128, 192 or 256 bit
keys and expanded them according to how many rounds need to be performed with 
such a key. 

It will not accept hexidecimal string input or pure string input, but you 
can use the utils functions in this library to convert such inputs into bytes

## How Key Schedule works
the first part of the expanded key is always the key you originally passedc in.

the key is then chunked into words of 4 bytes, which are rotated, substituted and 
transformed according to the RCON step. for both the substitution and Rcon step 
secua uses a pre calculated table, which can be found in the `precomputation` folder
in the `secua/aes` directory. 

`precomputation` is not currently exposed by the API as it is pure data.
