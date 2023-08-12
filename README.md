# ByteLuaObfuscator
Simple Lua Bytecode-Method Obfuscator for Lua 5.1+ / RBXLua. <br>
Obfuscator for Lua 5.1 in Lua. <br>
Reboy is me. <br>
Sorry for dirty code but it's obfuscator. <br>
The obfuscator does not have luau support, if you want luau support with the obfuscator, try this: [ShinyMoon](https://github.com/kosuke14/ShinyMoon)
### Credits
- FiOne LBI (created by same author as Rerubi) - https://github.com/Rerumu/FiOne
- ~~Yueliang 5 (Lua compiler in Lua) - http://yueliang.luaforge.net/~~
- Moonshine (improved version of Yueliang) - https://github.com/gamesys/moonshine
- ARCFOUR implementation in pure Lua (RC4) - https://www.rjek.com/
## Features
* Convert to bytecode
* Encode bytecode to plain text
* Encrypt encoded code with random password
* Minified code
* Customizable variable name, variable comment, comment
* Lua 5.1 format
* Executable in Lua 5.1+ / RBXLua (no loadstring)
## Usage of Non-module ver (but you need module)
You will need Lua 5.1: [Lua for windows](https://github.com/rjpcomputing/luaforwindows/releases/tag/v5.1.5-52)
1. Download module.lua and MLoader.lua
2. Run MLoader.lua as lua script (cmd > `lua MLoader.lua`)
3. Type a path to module.lua
4. Type a path to lua file to obfuscate
5. Type a path to new lua file to write
6. Type some options
7. And it will be obfuscated.
## Usage (Module ver CLI Usage)
Run this command to view help:
```sh
lua path/to/module.lua
```
Help:
```sh
ByteLuaObfuscator
Copyright (c) 2023 Reboy / M0dder

Usage:
lua module.lua -s "<FILE_PATH>" -o "<FILE_PATH>" [..]

Available Arguments:
--help -h   Shows help.
-s --source "<FILE_PATH>"  Path to Lua script to obfuscate.
-o --output "<FILE_PATH>"  Path to Lua script to output (document will be created if there isn't).
-c --comment "<COMMENT>"   Comment Option.
-vc --varcomm "<COMMENT>"   Comment Option for lua variable value.
-vn --varname "<STRING>"    Lua variable name (Special characters, spaces will be replaced with underline).
-C --cryptvarcomm          Encode (Decodable) comment for vartiable value.

```
## Usage (Module ver)
Require the module: 
```lua
local module = require("path.to.module") -- require module.lua
```
Call module with these arguments:
```lua
module(<string> source[, <table> options])
```
Options table like this:
```lua
{ -- default options
	comment = "// CRYPTED", -- ex result: "--// comment"
	variablecomment = "lol you have to stop trying to deobfuscate",
	cryptvarcomment = true, -- encrypt variablecomment with bytecode ex: "a" -> "\97"
	variablename = "CRYPT", -- ex: "local 'variablename' = 'variablecomment'"
}
```
The module will returns obfuscated source (string, about 20KB~) or error.
