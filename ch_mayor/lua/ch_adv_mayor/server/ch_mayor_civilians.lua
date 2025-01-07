net.Receive( "CH_Mayor_Net_WantedPlayer", function( len, ply )
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
	local reason = net.ReadString()
	local time = net.ReadUInt( 8 )
	
	-- Check if already wanted
	if target:isWanted() then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, target:Nick() .." ".. CH_Mayor.LangString( "is already wanted by the police." ) )
		return
	end
	
	-- Perform action
	target:wanted( ply, reason, math.Clamp( time, 0, CH_Mayor.Config.MaximumWantedTime ) )
	
	DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You have wanted" ) .." ".. target:Nick() )
end )

net.Receive( "CH_Mayor_Net_WarrantPlayer", function( len, ply )
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
	local reason = net.ReadString()
	
	-- Check if already warranted
	if target.warranted then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, target:Nick() .." ".. CH_Mayor.LangString( "already has an active search warrant." ) )
		return
	end
	
	-- Perform action
	target:warrant( ply, reason )
	
	DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You have called a search warrant on" ) .." ".. target:Nick() )
end )