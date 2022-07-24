# ByteLuaObfuscator
Simple Lua Bytecode-Method Obfuscator for Lua 5.1 / Luau / RBXLua. <br>
Obfuscator for Lua 5.1 / Luau / RBXLua in Lua. <br>
Reboy is me.
### Credits
- FiOne LBI (created by same author as Rerubi) - https://github.com/Rerumu/FiOne
- Yueliang 5 (Lua compiler in Lua) - http://yueliang.luaforge.net/
- Moonshine (improved version of Yueliang) - https://github.com/gamesys/moonshine
- ARCFOUR implementation in pure Lua (RC4) - https://www.rjek.com/
## Features
* Convert to bytecode
* Encode bytecode to plain text
* Encrypt encoded code with random password
* Minified code
* Customizable variable name, variable comment, comment
* Obfuscated code is executed internally without source code revert it's bytecode
* Executable in Lua 5.1 / Luau / RBXLua (needed getfenv & setfenv, no loadstring)
## Usage
Require the module: 
```lua
local module = require("path.to.module")
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
