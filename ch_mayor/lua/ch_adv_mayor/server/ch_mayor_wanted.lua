net.Receive( "CH_Mayor_Net_MakeUnwanted", function( len, ply )
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
	
	-- If they are not wanted then don't do anything.
	if not target:isWanted() then
		return
	end
	
	-- Perform action
	target:unWanted( ply )
	
	DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, target:Nick() .." ".. CH_Mayor.LangString( "is no longer wanted by the police." ) )
end )