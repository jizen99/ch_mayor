--[[
	Open mayor menu via chat command
--]]
function CH_Mayor.PlayerSay( ply, text )
	if string.lower( text ) == CH_Mayor.Config.MayorMenuChatCommand then
		if not CH_Mayor.Config.UseMayorChatCommand then
			return
		end
		
		if not ply:CH_Mayor_IsMayor() then
			return ""
		end
		
		net.Start( "CH_Mayor_Net_ShowMayorMenu" )
		net.Send( ply )
		return ""
	end
end
hook.Add( "PlayerSay", "CH_Mayor.PlayerSay", CH_Mayor.PlayerSay )

--[[
	When mayor is elected or demoted we need to perform some stuff
--]]
function CH_Mayor.OnMayorElectedDemoted( ply, before, after )
	-- If the mayor is newly elected
	if team.GetName( after ) == CH_Mayor.Config.MayorTeam then
		-- Network the current team taxes
		CH_Mayor.NetworkTeamTaxes( ply )
		
		-- Network the current warranted players
		CH_Mayor.NetworkWarrantedPlayers( ply )
		
		-- Network current deposit/withdraw
		CH_Mayor.NetworkWithdrawDepositLimits( ply )
		
		-- Network the mayors stats
		CH_Mayor.InitMayorStats( ply )
		
		-- Start mayor playtime
		CH_Mayor.StartMayorPlaytime( ply )
		
		-- Network upgrade levels
		CH_Mayor.NetworkUpgrades( ply )
	elseif team.GetName( before ) == CH_Mayor.Config.MayorTeam then -- Demoted/left mayor team
		CH_Mayor.CleanupMayor( ply )
	end
end
hook.Add( "PlayerChangedTeam", "CH_Mayor.OnMayorElectedDemoted", CH_Mayor.OnMayorElectedDemoted )

--[[
	When mayor disconnects
--]]
function CH_Mayor.OnMayorDisconnected( ply )
	if ply:CH_Mayor_IsMayor() then
		CH_Mayor.CleanupMayor( ply )
	end
end
hook.Add( "PlayerDisconnected", "CH_Mayor.OnMayorDisconnected", CH_Mayor.OnMayorDisconnected )

--[[
	If the config is enabled then demote mayor on death
--]]
function CH_Mayor.DemoteOnDeath( ply )
	if not CH_Mayor.Config.DemoteMayorOnDeath then
		return
	end
	
	if ply:CH_Mayor_IsMayor() then
		ply:teamBan()
		ply:changeTeam( GAMEMODE.DefaultTeam, true )
		
		DarkRP.notifyAll( 0, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "The mayor has died and is therefor demoted." ) )
	end
end
hook.Add( "PostPlayerDeath", "CH_Mayor.DemoteOnDeath", CH_Mayor.DemoteOnDeath )

--[[
	Code ran when the mayor is demoted or leaves the server
--]]
function CH_Mayor.CleanupMayor( ply )
	-- Stop mayor playtime
	CH_Mayor.StopMayorPlaytime( ply )
	
	-- Reset announcement screen
	CH_Mayor.ResetMayorAnnouncement()
	
	-- Reset team taxes if enabled
	if CH_Mayor.Config.ResetTeamTaxOnDemoted then
		CH_Mayor.SetupTeamTaxes()
	end
	
	-- Resets the catalog items (removes stuff, etc)
	CH_Mayor.ResetCatalogItems()
	
	-- Reset upgrades
	CH_Mayor.ResetMayorUpgrades()
	
	-- Reset laws if enabled
	if CH_Mayor.Config.ResetLawsOnDemote then
		hook.Run( "resetLaws" )
		
		net.Start( "CH_Mayor_Net_ResetLaws" )
		net.Broadcast()
	end
	
	-- Reset deposit/withdraw current and limit
	CH_Mayor.DepositAmount = 0
	CH_Mayor.DepositLimit = CH_Mayor.Config.DepositMaximumPerMayor
	
	CH_Mayor.WithdrawAmount = 0
	CH_Mayor.WithdrawtLimit = CH_Mayor.Config.WithdrawMaximumPerMayor
end