net.Receive( "CH_Mayor_Net_DemotePlayer", function( len, ply )
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
	DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You have demoted" ) .." ".. target:Nick() .." ".. CH_Mayor.LangString( "from" ).. " ".. team.GetName( target:Team() ) )
	DarkRP.notify( target, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "The mayor has demoted you from your current job." ) )
	
	target:teamBan()
	target:changeTeam( GAMEMODE.DefaultTeam, true )
	
	-- Add stat
	CH_Mayor.AddStat( ply, "PlayersDemoted", 1 )
end )

net.Receive( "CH_Mayor_Net_PromotePlayer", function( len, ply )
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
	local new_team = net.ReadString()
	
	-- Find the index of the team to join
	local team_index = 0
	
	for k, v in ipairs( RPExtraTeams ) do
		if new_team == v.name then
			team_index = k
			break
		end
	end
	
	-- If the team we are trying to promote to does not exist (DUE TO CONFIG ERROR) then stop here
	if team_index == 0 then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "The team you are trying to promote the player to does not exist!" ) )
		return
	end
	
	-- Perform action
	DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You have promoted" ) .." ".. target:Nick() .." ".. CH_Mayor.LangString( "to" ) .." ".. new_team )
	DarkRP.notify( target, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "The mayor has promoted you to" ) .." ".. new_team )
	
	target:changeTeam( team_index, true )
	
	-- Add stat
	CH_Mayor.AddStat( ply, "PlayersPromoted", 1 )
end )