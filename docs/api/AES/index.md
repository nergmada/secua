# secua.aes
AES is a cryptographic standard used across a variety of applications
and is considered one of the best symmetric cryptographic algorithms currently
widely available and well tested. That's why I decided to butcher it first.

AES comes in three flavours, AES-128, AES-192 and AES-256. The difference between
these flavours is the key size they accept. This index page will not delve deeply into
the mechanics and understanding of AES, for that, please see this understanding page.

`secua.aes` exposes the following
```
secua.aes.cbc
secua.aes.decrypt
secua.aes.ecb
secua.aes.encrypt
secua.aes.keyschedule(key)
secua.aes.steps
```
## secua.aes.cbc
CBC stands for Cipher Block Chaining and is a 'mode of operation'. It can be used to encrypt
data, for more information on its implementation and use, please see the CBC page

## secua.aes.decrypt
the decrypt table contains a set of functions for decrypting a single block, using either a 128, 192
or 256 bit key.
For more information on its implementation and use, please see the aes.decrypt page

## secua.aes.ecb
ECB stands for Electronic Code Book, and is another 'mode of operation'. It can be used to encrypt 
data, for more information on its implementation, and use please see the ECB page

## secua.aes.encrypt
the encrypt table contains a set of functions for encrypting a single block, using either a 128, 192
or 256 bit key.
For more information on its implementation and use, please see the aes.encrypt page

## secua.aes.keyschedule(key)
`secua.aes.keyschedule` is the function all of the AES cryptographic functions here use to 'expand' their
given key. For more information on its implementation, purpose and usage, please see the keyschedule page

## secua.aes.steps
`secua.aes.steps` exposes the underlying individual steps to transform data from encrypt to decrypt and vice
versa. It contains each of the main steps involved in the AES encryption and decryption process.

for more information on its contents, please see the aes.steps page