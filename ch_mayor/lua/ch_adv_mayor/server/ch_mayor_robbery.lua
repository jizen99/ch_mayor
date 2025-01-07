CH_Mayor.Vault = CH_Mayor.Vault or {}

CH_Mayor.Vault.Cooldown = false
CH_Mayor.Vault.IsBeingRobbed = false

function CH_Mayor.StartVaultRobbery( ply, vault )
	-- Check if someone/themselves is already robbing it
	if CH_Mayor.Vault.IsBeingRobbed then
		if ply.CH_Mayor_IsRobbingVault then
			DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You are already robbing the mayor vault!" ) )
		else
			DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "Someone is already robbing the mayor vault!" ) )
		end
		
		return
	end
	
	-- Check if mayor required
	if CH_Mayor.Config.MayorRequiredToRob then
		if not IsValid( CH_Mayor.GetMayor() ) then
			DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "The mayor vault cannot be robbed when there is not a mayor online!" ) )
			return
		end
	end
	
	-- Team restriction check
	if not ply:CH_Mayor_IsCriminalTeam() then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You are not allowed to rob the mayor vault as a" ) .." ".. team.GetName( ply:Team() ).."!" )
		return
	end
	
	-- Check if vault is on cooldown, empty or already being robbed as the very first.
	if CH_Mayor.Vault.Cooldown then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "The mayor vault is currently on a cooldown and cannot be robbed!" ) )
		return
	end
	
	-- Check if the vault is empty
	if CH_Mayor.VaultMoney <= 0 then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "The mayor vault is empty and cannot be robbed!" ) )
		return
	end
	
	-- Check required police teams
	if CH_Mayor.GetPoliceCount() < CH_Mayor.Config.PoliceRequired then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.Config.PoliceRequired .." ".. CH_Mayor.LangString( "police officers are required before you can rob the mayor vault." ) )
		return
	end
	
	-- Check total player count
	if player.GetCount() < CH_Mayor.Config.PlayersRequired then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.Config.PlayersRequired .." "..CH_Mayor.LangString( "players required before you can rob the mayor vault." ) )
		return
	end
	
	--[[
		Initialize the robbery after all checks has been passed!
	--]]
	
	-- bLogs support
	hook.Run( "CH_Mayor_RobberyInitiated", ply )
	
	-- Start distance checker
	CH_Mayor.RobberyDistanceCheck()
	
	-- Notify police teams
	for k, cop in ipairs( player.GetAll() ) do
		if cop:CH_Mayor_IsPoliceTeam() then
			DarkRP.notify( cop, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "The mayor vault is being robbed!" ) )
		end
	end
	
	-- Set variables on the robbery and notify
	CH_Mayor.Vault.IsBeingRobbed = true
	ply.CH_Mayor_IsRobbingVault = true
	
	DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You have started a robbery on the mayor vault!" ) )
	DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You must stay alive for" ) .." ".. CH_Mayor.Config.RobberyAliveTime .." ".. CH_Mayor.LangString( "minutes to receive the money." ) )
	DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "If you go too far away from the mayor vault or die then the robbery will fail!" ) )
	
	-- Play alarm if config is enabled
	if CH_Mayor.Config.EmitSoundOnRob then
		local AlarmSound = CreateSound( vault, CH_Mayor.Config.TheSound )
		AlarmSound:SetSoundLevel( CH_Mayor.Config.SoundVolume )
		AlarmSound:Play()
		
		timer.Simple( CH_Mayor.Config.SoundDuration, function()
			AlarmSound:Stop()
		end )
	end
	
	-- Call net to start the robbery timer
	net.Start( "CH_Mayor_RestartTimer" )
	net.Broadcast()
	
	-- Create a timer
	timer.Simple( CH_Mayor.Config.RobberyAliveTime * 60, function()
		if not IsValid( ply ) then
			return
		end
		
		if not ply.CH_Mayor_IsRobbingVault then
			return
		end
		
		-- Robbery is finished and successfull
		CH_Mayor.RobberyFinished( ply, true )
	
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "Congratulations! You have successfully robbed the mayor vault." ) )
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "The money has been spawned in front of the mayor vault." ) )
		
		-- Spawn money
		local spawn_pos = vault:GetPos()
		spawn_pos = spawn_pos + vault:GetForward() * 50 + vault:GetUp() * 5
		DarkRP.createMoneyBag( spawn_pos, CH_Mayor.VaultMoney )
		
		-- bLogs support
		hook.Run( "CH_Mayor_RobberySuccessful", ply, CH_Mayor.VaultMoney )
		
		-- XP System Support
		CH_Mayor.GiveXP( ply, CH_Mayor.Config.XPSuccessfulRobbery, CH_Mayor.LangString( "for successfully robbing the mayor vault." ) )
	
		-- Set money to 0
		CH_Mayor.SetVaultMoney( 0 )
		
		-- Notify mayor and add stat
		local mayor = CH_Mayor.GetMayor()
		if IsValid( mayor ) then
			CH_Mayor.AddStat( mayor, "WarrantsPlaced", 1 )
			
			DarkRP.notify( mayor, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "The vault has been successfully robbed." ) )
		end
	end )
end

-- When a robbery ends (succesfully or not)
function CH_Mayor.RobberyFinished( ply, success )
	local vault = CH_Mayor.Entities.Vault
	
	-- Reset var on player
	ply.CH_Mayor_IsRobbingVault = false
	
	-- Set general vars
	CH_Mayor.Vault.Cooldown = true
	CH_Mayor.Vault.IsBeingRobbed = false
	
	if not success then
		-- bLogs support
		hook.Run( "CH_Mayor_RobberyFailed", ply )
		
		-- Notify cops
		for k, cop in ipairs( player.GetAll() ) do
			if cop:CH_Mayor_IsPoliceTeam() then
				DarkRP.notify( cop, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "The mayor vault robbery has failed!" ) )
			end
		end
	end
	
	-- Network to stop the timer
	net.Start( "CH_Mayor_StopTimer" )
	net.Broadcast()
	
	-- Restart cooldown
	net.Start( "CH_Mayor_RestartCooldown" )
	net.Broadcast()
	
	-- Stop distance timer
	if timer.Exists( "CH_Mayor_DistRobberyCheck" ) then
		timer.Remove( "CH_Mayor_DistRobberyCheck" )
	end
	
	timer.Simple( CH_Mayor.Config.RobberyCooldownTime * 60, function()
		if not IsValid( vault ) then
			return
		end
		
		CH_Mayor.Vault.Cooldown = false
		
		-- Send cooldown is over to net
		net.Start( "CH_Mayor_StopCooldown" )
		net.Broadcast()
	end )
end

function CH_Mayor.RobberyDistanceCheck()
	timer.Create( "CH_Mayor_DistRobberyCheck", 2, 0, function()
		if not CH_Mayor.Vault.IsBeingRobbed then
			return
		end
		
		local vault = CH_Mayor.Entities.Vault
		
		for k, ply in ipairs( player.GetAll() ) do
			if ply.CH_Mayor_IsRobbingVault and IsValid( vault ) then
				if ply:GetPos():DistToSqr( vault:GetPos() ) > CH_Mayor.Config.RobberyDistance then
					DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You have moved too far away from the mayor vault and the robbery has failed!" ) )
				
					CH_Mayor.RobberyFinished( ply, false )
				end
			end
		end
	end )
end

--[[
	Robbery failure check on PlayerDeath
--]]
function CH_Mayor.PlayerDeath( ply, inflictor, attacker )
	if ply.CH_Mayor_IsRobbingVault then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You have failed to rob the mayor vault!" ) )
	
		-- Check attacker is valid and that it isn't suicide (ply not attacker)
		if IsValid( attacker ) and ply != attacker then
			DarkRP.notify( attacker, 1, CH_Mayor.Config.NotificationTime, "+".. DarkRP.formatMoney( CH_Mayor.Config.KillReward ) .." ".. CH_Mayor.LangString( "rewarded for killing the robber." ) )
			attacker:addMoney( CH_Mayor.Config.KillReward )
			
			-- XP System Support
			CH_Mayor.GiveXP( attacker, CH_Mayor.Config.XPStoppingRobber, CH_Mayor.LangString( "rewarded for killing the robber." ) )
		end
		
		-- Robbery failed
		CH_Mayor.RobberyFinished( ply, false )
	end
end
hook.Add( "PlayerDeath", "CH_Mayor.PlayerDeath", CH_Mayor.PlayerDeath )

--[[
	Robbery failure check on PlayerDisconnected
--]]
function CH_Mayor.PlayerDisconnected( ply )
	if ply.CH_Mayor_IsRobbingVault then			
		CH_Mayor.RobberyFinished( ply, false )
	end
end
hook.Add( "PlayerDisconnected", "CH_Mayor.PlayerDisconnected", CH_Mayor.PlayerDisconnected )