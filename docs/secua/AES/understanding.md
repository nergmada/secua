# Understanding AES
## Introduction
AES, or rather Advanced Encryption Standard, is a commonly used Standard
for encryption. Like most other forms of Symmetric Encryption it has 
the following properties.

- It uses a secret (also called a key) to both encrypt and decrypt data
- It encrypts and decrypts data in chunks, called blocks of a fixed size
- It operates on binary data

AES is the algorithm used to transform a single block, according to a key 
into either an encrypted block, or a decrypted block, depending on if the input
was already encrypted.

It is extended to encrypt data of any length using a combination of padding 
(increasing the data's length to be a multiple of the block size) and splitting
of the data into individual blocks which can then be encrypted either sequentially or
in parallel.

## The Big Secret 
The secret or the key, can be thought of as the means to both obfuscate and 
recover the data. As such it should be kept secret from people whom you do not 
wish to be able to recover the data.

A secret is a fixed length. In AES the algorithm will accept one of three fixed sizes
for the secret. Either 128, 192 or 256 bit keys. 

## Rounds
AES consists of a number of individual steps, each of which are used to
perform a single "round" of encryption on a given block. When encrypting 
with a key of 128 bits, 10 rounds are performed on the block. 

However, the original key given is not large enough to be used in all the rounds
without using the same part more than once. For this reason, the key is expanded using
a key schedule algorithm. 

For more information on the key schedule algorithm and it's implementation
see the keyschedule page under AES.

## Steps 
the steps that make up each round in the AES are fully documented in 
the steps section. But for more information on what order these are
applied in, see the following [wikipedia](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard#High-level_description_of_the_algorithm) article

## Modes of Operation

AES is designed to be applied to single blocks of data. Hence the AES 
encrypt and decrypt methods only accept a fixed size block and key, and
do not perform any padding of data. 

For more information on these, please see the respective encrypt and decrypt 
pages.

But the kind of data we traditionally deal with, for example messages, do 
not have a guaranteed fixed size and as such require something capable of handling
encrypting variable size data.

this is where modes of operation come in. Modes of operation govern how 
an algorithm is used to encrypt data. 

### Electronic Code Book
The most basic and easy to understand is Electronic Code Book. It simply takes 
in a piece of data, pads it until it is a multiple of the 128 bit block size and 
then breaks the data into sequential blocks, which it encrypts and returns as 
the cipher text. 

For more information on this mode, it's implementation in Secua and it's usage, see
the ECB article 

### Cipher Text Chaining 
ECB, however, is not the only nor best way to encrypt data. Cipher Block Chaining 
involves not only encrypting data but also XOR the next block against the previously 
encrypted block. 

For more information on this mode, it's implementation in secua and it's usage see 
the CBC article.

### Other Modes 
Secua exposes the algorithm and it's underlying functions at various levels 
allowing you to use as much or as little of the each part of the library.

More Modes Of Operation are on my agenda, but they will not come fast. If you wish 
to implement your own, then you can use the underlying functions to build them 

If you do build other modes, consider forking this repo and filing a pull request 
so that others can bask in the glory of your Mode of Operation.
