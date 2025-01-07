function CH_Mayor.PlayerLoaded( ply )
	-- Network mayor vault to player
	CH_Mayor.NetworkMayorVault( ply )
	
	-- Send laws from our table
	CH_Mayor.LawInitialize( ply )
end

--[[
	Call this net when the player is actually loaded in properly
--]]
net.Receive( "CH_Mayor_Net_HUDPaintLoad", function( len, ply )
	-- The player is fully loaded in
	CH_Mayor.PlayerLoaded( ply )
end )