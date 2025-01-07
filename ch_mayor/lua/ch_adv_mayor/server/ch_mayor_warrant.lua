CH_Mayor.WarrantedPlayers = CH_Mayor.WarrantedPlayers or {}

--[[
	Net message to unwarrant a player from the mayor menu
--]]
net.Receive( "CH_Mayor_Net_MakeUnwarrant", function( len, ply )
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
	
	-- Read net
	local target = net.ReadEntity()
	
	-- Perform action
	target:unWarrant( ply )
end )

--[[
	When a player is warranted write them to the table in our addon
	So we have a reason and time (plus the player) clientside as well
--]]
function CH_Mayor.PlayerWarranted( target, warranter, reason )
	local time = GAMEMODE.Config.searchtime
	
	CH_Mayor.WarrantedPlayers[ target ] = {
		warrant_reason = reason,
		warrant_time = CurTime() + time,
	}
	
	local mayor = CH_Mayor.GetMayor()
	if IsValid( mayor ) then
		CH_Mayor.NetworkWarrantedPlayers( mayor )
	end
end
hook.Add( "playerWarranted", "CH_Mayor.PlayerWarranted", CH_Mayor.PlayerWarranted )

--[[
	When a player is unwarranted remove them from the table and network it
--]]
function CH_Mayor.PlayerUnWarranted( target, warranter )
	CH_Mayor.WarrantedPlayers[ target ] = nil
	
	-- Remove that player clientside as well
	local mayor = CH_Mayor.GetMayor()
	if IsValid( mayor ) then
		net.Start( "CH_Mayor_Net_RemoveWarrantedPlayer" )
			net.WriteEntity( target )
		net.Send( mayor )
	end
end
hook.Add( "playerUnWarranted", "CH_Mayor.PlayerUnWarranted", CH_Mayor.PlayerUnWarranted )

--[[
	Network all warranted players with their info to the mayor
--]]
function CH_Mayor.NetworkWarrantedPlayers( ply )
	local table_length = table.Count( CH_Mayor.WarrantedPlayers )

	net.Start( "CH_Mayor_Net_UpdateWarrants" )
		net.WriteUInt( table_length, 6 )
	
		for k, v in pairs( CH_Mayor.WarrantedPlayers ) do
			net.WriteEntity( k )
			net.WriteString( v.warrant_reason )
			net.WriteDouble( v.warrant_time )
		end
	net.Send( ply )
end