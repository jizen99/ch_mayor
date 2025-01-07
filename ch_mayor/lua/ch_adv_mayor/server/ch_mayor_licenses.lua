net.Receive( "CH_Mayor_Net_ManageLicense", function( len, ply )
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
	local grant = net.ReadBool()
	
	-- Run canGiveLicenses hook
	local canGive, cantGiveReason = hook.Call( "canGiveLicense", DarkRP.hooks, ply, target )
    if canGive == false then
        cantGiveReason = isstring( cantGiveReason ) and cantGiveReason or DarkRP.getPhrase( "unable", "/givelicense", "" )
        DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, cantGiveReason )
        return
    end
	
	-- Perform action
	if grant then -- GRANT LICENSE
		DarkRP.notify( target, 0, CH_Mayor.Config.NotificationTime, DarkRP.getPhrase( "gunlicense_granted", ply:Nick(), target:Nick() ) )
		DarkRP.notify( ply, 0, CH_Mayor.Config.NotificationTime, DarkRP.getPhrase( "gunlicense_granted", ply:Nick(), target:Nick() ) )
		
		target:setDarkRPVar( "HasGunlicense", true )

		hook.Run( "playerGotLicense", target, ply )
	else -- REVOKE LICENSE
		target:setDarkRPVar( "HasGunlicense", nil )
        target:StripWeapons()
		
        gamemode.Call( "PlayerLoadout", target )
		
        DarkRP.notifyAll( 0, CH_Mayor.Config.NotificationTime, DarkRP.getPhrase( "gunlicense_removed", target:Nick() ) )
	end
end )