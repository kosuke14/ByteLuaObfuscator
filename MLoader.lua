--[==[
	ByteLuaObfuscator Module Loader (Github: kosuke14)
	Just execute "lua MLoader.lua" to use.
--]==]

if not (_VERSION and _VERSION == "Lua 5.1" or _VERSION == "LuaJIT" or _VERSION == "Luau") then -- version check (if you have getfenv / setfenv function, you can remove this code.)
	print("Your Lua version is not supported for this script. This script only supports Lua 5.1.")
	return
end -- version check end

print("ByteLuaObfuscator (Github: \107\111\115\117\107\101\49\52) Loader (^C to exit)")
print("Put a path to an obfuscator module: ")

local function getmodule()
	io.write("> ")
	local mpath = io.read("*l")
	local mloaded, module = pcall(function()
		return dofile(mpath)
	end)
	if not mloaded or module == nil then
		if not mloaded then
			print(module)
		end
		print("Put a path correctly! (ex: C:\\path\\to\\module.lua)")
		return getmodule()
	else
		return module
	end
end
local M_ = getmodule()
if not (M_.crypt ~= nil and type(M_.crypt) == 'function') then
	print("Put a path to *module*! Please run loader again.")
	return nil
end
local function getRfile()
	io.write("> ")
	local mpath = io.read("*l")
	local mloaded, f, err = pcall(function()
		return io.open(mpath, "rb")
	end)
	if not mloaded or f == nil then
		if not mloaded then
			print(f)
		end
		print("Put a path correctly! (ex: savetheoof.lua)")
		return getRfile()
	else
		return f
	end
end
print("Put a path to a lua file to obfuscate: ")
local obrfile = getRfile()
local obrcode = obrfile:read("*a")
obrfile:close()

local function getWfile()
	io.write("> ")
	local mpath = io.read("*l")
	local mloaded, f, err = pcall(function()
		return io.open(mpath, "w")
	end)
	if not mloaded or f == nil then
		if not mloaded then
			print(f)
		end
		print("Put a path correctly! (ex: soof_obfuscated.lua)")
		return getWfile()
	else
		return f
	end
end
print("Put a path to a lua file to write obfuscated source (new file will be created if not): ")
local wfile = getWfile()

local _settings = { -- default options
	comment = "// CRYPTED", -- "--'comment'"
	variablecomment = "lol you have to stop trying to deobfuscate",
	cryptvarcomment = true, -- encrypt variablecomment with bytecode
	variablename = "CRYPTED", -- "local 'variablename' = 'variablecomment' or something"
}
print("options (Do not enter special characters and leave blank to use default): ")
io.write("Custom Comment [// CRYPTED]> ")
local com_ = io.read("*l")
if com_ == "" then
	com_ = _settings.comment
end
io.write("Variable Value String [lol you have to stop trying to deobfuscate]> ")
local varcom_ = io.read("*l")
if varcom_ == "" then
	varcom_ = _settings.variablecomment
end
io.write("Variable Name [CRYPTED]> ")
local varnam_ = io.read("*l")
if varnam_ == "" then
	varnam_ = _settings.variablecomment
end
io.write("Crypt Var Value [y]/n> ")
local cryvar_ = io.read("*l")
local cryyes = true
if cryvar_:lower() == "n" then
	cryyes = false
else
	cryyes = true
end
local options_ = {
	comment = com_, -- "--'comment'"
	variablecomment = varcom_,
	cryptvarcomment = cryyes, -- encrypt variablecomment with bytecode
	variablename = varnam_, -- "local 'variablename' = 'variablecomment' or something"
}
io.write("Press Enter to continue or ^C to cancel...")io.read()

local memoryleakerlolwhat = M_(obrcode,options_)

wfile:write(memoryleakerlolwhat)
wfile:close()
io.write("Done! Press Enter to exit...")io.read()
