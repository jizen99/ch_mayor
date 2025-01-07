net.Receive( "CH_Mayor_Net_MayorStats", function( length, ply )
	-- Setup their stats clientside
	local ply = LocalPlayer()
	
	ply.CH_Mayor_Stats = {
		["WarrantsPlaced"] = net.ReadUInt( 32 ),
		["PlayersWanted"] = net.ReadUInt( 32 ),
		["TimesElected"] = net.ReadUInt( 32 ),
		["VaultRobbed"] = net.ReadUInt( 32 ),
		["TotalPlaytime"] = net.ReadUInt( 32 ),
		["PlayersDemoted"] = net.ReadUInt( 32 ),
		["PlayersPromoted"] = net.ReadUInt( 32 ),
		["CapitalAdded"] = net.ReadUInt( 32 ),
		["LockdownsInitiated"] = net.ReadUInt( 32 ),
		["LotteriesStarted"] = net.ReadUInt( 32 ),
	}
end )