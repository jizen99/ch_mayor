
-----------------------------------------------------

--[[
=====MOONMARAUDERS STEALER=====
 - Coded by nixer/cida/vec.
 - Credits to wuat.

]]--

------------------------------------
-------------HatsChat 2-------------
------------------------------------
--Copyright (c) 2013 my_hat_stinks--
------------------------------------

HatsChat.ChatFilter = {}
local CF = HatsChat.ChatFilter

local function IgnoreFilter(ply)
	return (not IsValid(ply)) or ply:IsSuperAdmin()
end

CF.Enabled = false
CF.Filters = {
	["fuck"] = "fudge", ["fucker"] = "fudger", ["fucking"] = "fudging",
	["shit"] = "poop",
	["arse"] = "bottom",
	["bollocks"] = "********",
	["bollox"] = "******",
	["damn"] = "darn",
	
	["fag"] = "doo-doo head",
	["dyke"] = "puppet-ears",
	["nigger"] = "******",
	["nigga"] = "butthead",
	["niglet"] = "dummy",
	["bastard"] = "fart-face",
	["douche"] = "dumbhead",
	["skank"] = "fecal-features",
	["slut"] = "silly",
	["whore"] = "poo-brain",
	
	["cunt"] = "girly parts",
	["clit"] = "girly parts",
	["dick"] = "weener",
	["cum"] = "***",
	["jizz"] = "****",
	["dildo"] = "toy",
	["tit"] = "***", ["tits"] = "****",
	["wank"] = "****", ["wanker"] = "******",
	
	["ass"] = "donkey",
	["bitch"] = "puppy",
	["pussy"] = "kitty",
	["cock"] = "rooster",
}

function CF.RunFilter( ply, str )
	if not CF.Enabled then return str end
	if IgnoreFilter(ply) then return str end
	
	local exp = string.Explode( " ", str )
	for i=1,#exp do
		if CF.Filters[ exp[i]:lower() ] then exp[i] = CF.Filters[ exp[i]:lower() ] end
	end
	
	return table.concat( exp, " " )
end

local PirateDay = (os.date( "%m%d" )=="0919") --International Talk like a pirate day!
if PirateDay then
	if not CF.Enabled then table.Empty( CF.Filters ) end
	CF.Enabled = true
	IgnoreFilter = function() return false end
	
	table.Merge( CF.Filters, {
		["hi"] = "Ahoy", ["hello"] = "Ahoy",
		["yes"] = "yarr", ["no"] = "narr", ["yeah"] = "aye", ["of course"] = "aye aye",
		
		["fag"] = "bilge rat", ["dyke"] = "bilge rat", ["nigger"] = "bilge rat", ["nigga"] = "bilge rat", ["niglet"] = "bilge rat", ["bastard"] = "bilge rat", ["douche"] = "bilge rat", ["skank"] = "bilge rat", ["slut"] = "bilge rat", ["whore"] = "bilge rat",
		
		["wow"] = "shiver me timbers", ["wtf"] = "blimey",
		["treasure"] = "booty", ["money"] = "booty", ["friend"] = "matey", ["friends"] = "mateys", ["ally"] = "bucko", ["allies"] = "buckos",
		["lookout"] = "crow's nest", ["knife"] = "cutlass",
		
		["good luck"] = "fair winds", ["whip"] = "flog", ["beer"] = "grog", ["alcohol"] = "grog", ["food"] = "grub",
		["hideout"] = "haven", ["home"] = "haven",
		["cheat"] = "hornswaggle", ["cheater"] = "hornswaggler", ["cheating"] = "hornswaggling", ["hack"] = "hornswaggle", ["hacker"] = "hornswaggler", ["hacking"] = "hornswaggling",
		["girl"] = "lass", ["boy"] = "lad", ["abandon"] = "maroon",
		["rebel"] = "mutiny", ["rebels"] = "mutineers", ["steal"] = "plunder",
		["left"] = "port", ["right"] = "starboard", ["back"] = "aft", ["front"] = "prow",
		["song"] = "shanty", ["drunk"] = "three sheets in the wind",
		["you"] = "ye", ["your"] = "yer", ["you're"] = "yer", ["youre"] = "yer"
	})
end
