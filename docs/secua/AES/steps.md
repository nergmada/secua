# secua.aes.steps
`secua.aes.steps` is a table containing the individual low level steps used by
all AES implementations in this library. 

They are as follows
```lua
--used for encrypting and decrypting
secua.aes.steps.addRoundKey(state, key)
--used for encrypting
secua.aes.steps.shiftRows(state)
secua.aes.steps.mixColumns(state)
secua.aes.steps.subBytes(state)
--used for decrypting
secua.aes.steps.invShiftRows(state)
secua.aes.steps.invMixColumns(state)
secua.aes.steps.invSubBytes(state)
```

## secua.aes.steps.addRoundKey(state, key)
add round key takes in a state of 128 bytes (16 bytes) and applies
the given 128 bit round key to it using a XOR

basically each byte in the key is XORed with the corresponding byte in
the state.

N.B. we use the word state and not block, because a block is either encrypted
or decrypted, whereas a state can lie somewhere in between,

The result of `addRoundKey` function is the new state

```lua
local secua = require('path/to/secua')('path/to/secua')

local roundKey = {
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
    0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f
}

local state = {
    0x0f, 0x0e, 0x0d, 0x0c, 0x0b, 0x0a, 0x09, 0x08,
    0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00
}

local xoredState = secua.aes.steps.addRoundKey(state, roundKey)

```
of course, XOR is commutative meaning a XOR b is the same as b XOR a
therefore if you were to use the function like so 

```lua
local xoredState = secua.aes.steps.addRoundKey(roundKey, state)
```

it would produce the same result. More importantly, performing it twice 
results in the original data i.e.

```lua
local addRoundKey = secua.aes.steps.addRoundKey

local sameState = addRoundKey(addRoundKey(state, roundKey), roundKey)

-- sameState == state
```

Therefore addRoundKey is used to both encrypt and decrypt

## secua.aes.steps.shiftRows(state) and .invShiftRows(state)
the ShiftRows and invShiftRows function revolves around how we think about
our state.

imagine our state of 16 bytes, arranged in a 4 x 4 matrix like so

```
00 04 08 12
01 05 09 13
02 06 10 14
03 07 11 15
```

Notice how the second third and fourth byte are in the first column 
NOT the first row.

The shiftRows step, shifts each row to the left based on where it's positioned

```
00 04 08 12 -- doesn't move
01 05 09 13 <- 1 to the left
02 06 10 14 <-- 2 to the left
03 07 11 15 <--- 3 to the left
```

the result looks like this
```
00 04 08 12
05 09 13 01
10 14 02 06
15 03 07 11
```

the invShiftRows function reverses this shiftRow, by doing this

```
00 04 08 12 -- doesn't move
05 09 13 01 -> 1 to the right
10 14 02 06 --> 2 to the right
15 03 07 11 ---> 3 to the right
```
to call and use
```lua
local secua = require('path/to/secua')('path/to/secua')

local state = {
    0x0f, 0x0e, 0x0d, 0x0c, 0x0b, 0x0a, 0x09, 0x08,
    0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00
}

local shiftedRowState = secua.aes.steps.shiftRows(state)

```

## secua.aes.steps.mixColumns(state) and .invMixColumns(state)
mixColumns uses a thing called a galois field to change bytes, I really
cannot explain how a galois field works well. For this step, I used a 
lookup table for working it out.

The general gist is for each column of the state we perform a matrix
multiplication against the following matrix to generate a new column

```
a    2 3 1 1    00
b    1 2 3 1    01
c  = 1 1 2 3  x 02
d    3 1 1 2    03
```

the results a, b, c and d then become the new column. For those not 
familiar with matrix multiplication this is what happens:

```
a = (00 * 2) + (01 * 3) + (02 * 1) + (03 * 1)
b = (00 * 1) + (01 * 2) + (02 * 3) + (03 * 1)
c = (00 * 1) + (01 * 1) + (02 * 2) + (03 * 3)
d = (00 * 3) + (01 * 1) + (02 * 1) + (03 * 2)
```

but we don't really actually multiply or add, the add symbols really mean 
the result of a XOR operation and the multiply requires use of the galois field 
lookup table. For a more in-depth explanation than this, take a look at [this](https://en.wikipedia.org/wiki/Rijndael_MixColumns)
wikipedia page.

to use mixColumns 
```lua
local secua = require('path/to/secua')('path/to/secua')

local state = {
    0x0f, 0x0e, 0x0d, 0x0c, 0x0b, 0x0a, 0x09, 0x08,
    0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00
}

local shiftedRowState = secua.aes.steps.mixColumns(state)

```