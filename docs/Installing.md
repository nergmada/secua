# Installing Secua
Oh come on... it's not that hard.

Joking. To get cooking with Secua, you need to download it.
Despite having a rockspec, it is not currently published on LuaRocks
as such, you've only got two options, which I've broken down below

## Download My .zip or .tar.gz
With each major implementation, I will publish a .zip or .tar.gz 

These can be found under [releases](https://github.com/nergmada/secua/releases)

the .tar.gz and .zip files are completely identical inside. The .zip is there for
Windows users (like me), who don't have 7zip or similar. (btw, strongly recommend 7zip)

## Unzipping and Adding Secua to your project
Unzip the downloaded file. Now that you unzipped it or untarred(?) it, you should find a folder called 'secua' and in 
it a file called 'init.lua', innit? (little british humour, sorry). 

If the 'init.lua' file is inside the 'secua' folder, then you're ready to go. Simply drop the whole 'secua' file into 
your project folder, or your project library folder.

It doesn't matter where you drop it really as long as it is within one of your require paths. In other words
if it's with files and folders you've been able to use the `require()` function on, then you should be able to use it

## Using Secua
Now it's somewhere within your codes reach, you can require it, firstly let's take an imaginary look at what your 
project layout may look like

```
| My project folder
--- Some folder
--- Some other folder
--| libs
----- secua
----- Another library
----- And Another one
--- mymaincode.lua
--- somemorecode.lua
```

assuming your code requires from where the file 'mymaincode.lua' is, i.e. you can do `require('somemorecode')` 
and it works, then you can require secua like this `require('libs/secua')('libs/secua')`

No, that second brackets and 'lib/secua' combo is not a wardrobe malfunction or a typo, it has to be there so
that Secua can require all of it's sub files and folders

## Actually using Secua
Secua does not load into the global namespace (at least not when I just tested it). Therefore, you should store 
it in it's own variable, like this
```lua
local secua = require('path/to/secua')('path/to/secua')
```
you can call this anything you want, like
```lua
local hansolo = require('path/to/secua')('path/to/secua')
```
but you have to live with it so go with something informative to help you remember what it does
```lua
local completelyuselesscryptolibrary = require('path/to/secua')('path/to/secua')
```
...well... that just hurts.

For more info on usage, see the [API page](/secua/api)