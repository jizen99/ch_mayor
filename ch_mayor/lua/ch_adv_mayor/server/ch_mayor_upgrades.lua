--[[
	Initialize all upgrades into a table.
--]]
function CH_Mayor.SetupUpgradeLevels()
	CH_Mayor.UpgradeLevels = {}
	
	for k, upgrade in pairs( CH_Mayor.Upgrades ) do
		CH_Mayor.UpgradeLevels[ k ] = 0
	end
end

net.Receive( "CH_Mayor_Net_BuyUpgrade", function( len, ply )
	local cur_time = CurTime()
	
	if ( ply.CH_Mayor_NetDelay or 0 ) > cur_time then
		ply:ChatPrint( "You're running the command too fast. Slow down champ!" )
		return
	end
	ply.CH_Mayor_NetDelay = cur_time + 0.5
	
	-- Check if player is mayor
	if not ply:CH_Mayor_IsMayor() then
		return
	end
	
	-- Read net and buy function
	local upgrade = net.ReadString()
	
	CH_Mayor.BuyUpgrade( ply, upgrade )
end )

function CH_Mayor.BuyUpgrade( ply, upgrade )
	-- Check that skills exist
	if not CH_Mayor.Upgrades[ upgrade ] then
		print( "ERROR: Upgrade does not exist!" )
		return
	end
	
	local to_buy = CH_Mayor.Upgrades[ upgrade ]
	local cur_level = CH_Mayor.UpgradeLevels[ upgrade ]
	local next_level = to_buy.Levels[ 1 ]
	
	-- Check that we are not maxed on this upgrade
	if ( cur_level + 1 ) > to_buy.MaxLevel then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "This upgrade is maxed out!" ) )
		return
	end
	
	-- Check that we can afford the next level
	if CH_Mayor.VaultMoney < next_level.Price then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You cannot afford this!" ) )
		return
	end
	
	-- BUY
	
	-- Take money from vault
	CH_Mayor.TakeVaultMoney( next_level.Price )
	
	-- Run upgrade function
	next_level.UpgradeFunction( ply )
	
	-- Update table
	CH_Mayor.UpgradeLevels[ upgrade ] = cur_level + 1
	
	-- Network and notify the mayor
	local mayor = CH_Mayor.GetMayor()
	if IsValid( mayor ) then
		CH_Mayor.NetworkUpgrades( mayor )
		
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You have successfully upgraded to level" ) .." ".. CH_Mayor.UpgradeLevels[ upgrade ] )
	end
	
	-- bLogs support
	hook.Run( "CH_Mayor_UpgradeBuy", ply, to_buy.Name, CH_Mayor.UpgradeLevels[ upgrade ], next_level.Price )
end

--[[
	Network the upgrade levels to the mayor
--]]
function CH_Mayor.NetworkUpgrades( ply )
	-- Get the length of the table so we know how many uints and floats we need to receive on the other end
	local table_length = table.Count( CH_Mayor.UpgradeLevels )
	
	-- Network it to the client as efficient as possible
	net.Start( "CH_Mayor_Net_NetworkUpgradeLevels" )
		net.WriteUInt( table_length, 6 )
	
		for name, level in pairs( CH_Mayor.UpgradeLevels ) do
			net.WriteString( name )
			net.WriteUInt( level, 6 )
		end
	net.Send( ply )
end

--[[
	Function to reset upgrades
--]]
function CH_Mayor.ResetMayorUpgrades()
	-- Run remove function for all upgrades
	for k, item in pairs( CH_Mayor.Upgrades ) do
		if item.RemoveFunction != nil then
			item.RemoveFunction( CH_Mayor.GetMayor() )
		end
	end
	
	-- Reset table
	CH_Mayor.SetupUpgradeLevels()
	
	-- bLogs support
	hook.Run( "CH_Mayor_UpgradeReset" )
end