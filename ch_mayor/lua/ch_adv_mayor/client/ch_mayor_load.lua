--[[
	This is a method of ensuring that the player is loaded in, so we can network stuff to them (PlayerInitialSpawn is unreliable)
	-- 76561198422234222
--]]
function CH_Mayor.IsPlayerLoadedIn()
	if IsValid( LocalPlayer() ) then
		net.Start( "CH_Mayor_Net_HUDPaintLoad" )
		net.SendToServer()
		
		hook.Remove( "HUDPaint", "CH_Mayor.IsPlayerLoadedIn" )
	end
end
hook.Add( "HUDPaint", "CH_Mayor.IsPlayerLoadedIn", CH_Mayor.IsPlayerLoadedIn )