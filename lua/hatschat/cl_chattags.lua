
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

HatsChat.ChatTags = {}
local CT = HatsChat.ChatTags

CT.Enabled = false
CT.Tags = {
	["owner"] = {Color(85,0,150), "[Owner]"},
	["coowner"] = {Color(90,50,150), "[Co-Owner]"},
	
	["headadmin"] = {Color(180,50,50), "[Head Admin]"},
	
	["sadmin"] = {Color(180,50,100), "[S-Admin]"},
	--["superadmin"] = {Color(180,50,100), "[S-Admin]"},
	["superadmin"] = { {r=180,g=50,b=100,a=255, Glow=true, GlowTarget=Color(255,255,0)}, "[S-Admin]"},
	
	["admin"] = {Color(255,150,50), "[Admin]"},
	["mod"] = {Color(100,200,255), "[Mod]"},
	["moderator"] = {Color(100,200,255), "[Moderator]"},
	
	["dev"] = {Color(100,200,255), "[Dev]"},
	["developer"] = {Color(100,200,255), "[Developer]"},
	["coder"] = {Color(100,200,255), "[Coder]"},
	
	["trusted"] = {Color(50,200,180), "[Trusted]"},
	["respected"] = {Color(50,200,180), "[Respected]"},
	["regular"] = {Color(50,200,180), "[Regular]"},
	
	["trial"] = {Color(50,200,180), "[Trial]"},
	["trialmod"] = {Color(50,200,180), "[Trial Mod]"},
	["trialadmin"] = {Color(50,200,180), "[Trial Admin]"},
	
	["donator"] = {Color(100,200,50), "[Donator]"},
	["vip"] = {Color(100,200,50), "[VIP]"},
	["vip+"] = {Color(180,200,100), "[VIP+]"},
}

function CT.GetTag( ply )
	if not CT.Enabled then return end
	if not IsValid(ply) then return end
	
	if wyozite then --Wyozi Tag Editor support
		local str = ply:GetNWString("wte_sbtstr")
		local col = ply:GetNWVector("wte_sbtclr", Vector(-1,-1,-1))
		if (not col) or col[1]<0 or col[2]<0 or col[3]<0 then
			col = ply:GetNWVector("wte_sbclr", Vector(-1,-1,-1))
			if col[1]<0 or col[2]<0 or col[3]<0 then col = nil end
		end
		if col and str and #str>0 then
			local glow = ply:GetNWVector("wte_sbtclr2")
			return {
				{r=col[1], g=col[2], b=col[3], a=255, Glow = glow~=Vector(0,0,0), GlowTarget = glow},
				"["..str.."]"
			}
		end
	end
	
	local rank = HatsChat.GetPlayerRank(ply)
	return CT.Tags[ string.lower(rank) ]
end
