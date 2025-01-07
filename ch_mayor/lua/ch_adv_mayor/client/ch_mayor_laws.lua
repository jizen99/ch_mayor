CH_Mayor.Laws = CH_Mayor.Laws or {}

--[[
	Code elements inspired from DarkRP source code
	Credits: https://github.com/FPtje/DarkRP/search?q=addLaw
--]]

--[[
	When a law is added via darkrps usual chat commands we write it to our table.
--]]
function CH_Mayor.LawAdded( num, law )
	law = DarkRP.textWrap( law, "CH_Mayor_Font_3D2D_50", 1340 )
	
	table.insert( CH_Mayor.Laws, law )
end
hook.Add( "addLaw", "CH_Mayor.LawAdded", CH_Mayor.LawAdded )

--[[
	When a law is removed via darkrps usual chat commands we remove it from our table.
--]]
function CH_Mayor.LawRemoved( num, law )
	table.remove( CH_Mayor.Laws, num )
end
hook.Add( "removeLaw", "CH_Mayor.LawRemoved", CH_Mayor.LawRemoved )

--[[
	When laws are reset we also empty our table.
--]]
function CH_Mayor.LawsReset()
	CH_Mayor.Laws = {}

	for k, v in ipairs( GAMEMODE.Config.DefaultLaws ) do
		CH_Mayor.LawAdded( 0, v )
	end
end
hook.Add( "resetLaws", "CH_Mayor.LawsReset", CH_Mayor.LawsReset )

--[[
	Allow us to reset laws from server -> client when mayor is demoted/leaves
	Called in ch_mayor_hooks.lua when player leaves/is demoted from mayor.
--]]
net.Receive( "CH_Mayor_Net_ResetLaws", function( length, ply )
	CH_Mayor.LawsReset()
end )

--[[
	Allows us to add laws to the clients own table when they join first time
--]]
net.Receive( "CH_Mayor_Net_AddLaw", function( length, ply )
	local law = net.ReadString()
	
	hook.Run( "addLaw", 0, law )
end )