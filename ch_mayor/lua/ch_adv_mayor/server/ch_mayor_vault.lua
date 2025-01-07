CH_Mayor.DepositAmount = 0
CH_Mayor.DepositLimit = CH_Mayor.Config.DepositMaximumPerMayor

CH_Mayor.WithdrawAmount = 0
CH_Mayor.WithdrawLimit = CH_Mayor.Config.WithdrawMaximumPerMayor

--[[
	Net to deposit money into vault
--]]
net.Receive( "CH_Mayor_Net_DepositMoneyVault", function( len, ply )
	if not CH_Mayor.Config.EnableDeposit then
		return
	end
	
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
	
	-- Check if close enough (if enabled)
	if CH_Mayor.Config.MustBeCloseToVault then
		if not CH_Mayor.IsPlayerCloseToVault( ply ) then
			DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You must be close to the mayor vault in order to do this!" ) )
			return
		end
	end
	
	-- Read net
	local amount = net.ReadUInt( 32 )
	
	-- Make sure is positive
	if amount <= 0 then
		return
	end
	
	-- Make sure player has enough money
	if not ply:canAfford( amount ) then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You cannot afford this!" ) )
		return
	end
	
	-- Check max
	local max_remaining = CH_Mayor.DepositLimit - CH_Mayor.DepositAmount
	
	if max_remaining == 0 then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You have reached the maximum!" ) )
		return
	elseif amount > max_remaining then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You are only allowed to deposit another" ) .." ".. DarkRP.formatMoney( max_remaining ) )
		return
	end
	
	-- Update deposit amount total
	CH_Mayor.DepositAmount = CH_Mayor.DepositAmount + amount
	
	-- Take money from player
	ply:addMoney( amount * -1 )
	
	-- Add money to vault
	CH_Mayor.AddVaultMoney( amount, true )
	
	-- bLogs support
	hook.Run( "CH_Mayor_Vault_DepositMoney", ply, amount )
	
	-- Add stats
	CH_Mayor.AddStat( ply, "CapitalAdded", amount )
	
	-- Notify
	DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You have deposited" ) .." ".. DarkRP.formatMoney( amount ) .." ".. CH_Mayor.LangString( "into the mayor vault." ) )
	
	-- Network new limits
	CH_Mayor.NetworkWithdrawDepositLimits( ply )
end )

--[[
	Net to withdraw money into vault
--]]
net.Receive( "CH_Mayor_Net_WithdrawMoneyVault", function( len, ply )
	if not CH_Mayor.Config.EnableWithdraw then
		return
	end
	
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
	
	-- Check if close enough (if enabled)
	if CH_Mayor.Config.MustBeCloseToVault then
		if not CH_Mayor.IsPlayerCloseToVault( ply ) then
			DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You must be close to the mayor vault in order to do this!" ) )
			return
		end
	end
	
	-- Read net
	local amount = net.ReadUInt( 32 )
	
	-- Make sure is positive
	if amount <= 0 then
		return
	end
	
	-- Check that the vault has this amount
	if CH_Mayor.VaultMoney <= amount then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "The vault does not have enough money!" ) )
		return
	end
	
	-- Check max
	local max_remaining = CH_Mayor.WithdrawLimit - CH_Mayor.WithdrawAmount
	
	if max_remaining == 0 then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You have reached the maximum!" ) )
		return
	elseif amount > max_remaining then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You are only allowed to withdraw another" ) .." ".. DarkRP.formatMoney( max_remaining ) )
		return
	end

	-- Update withdrawn amount total
	CH_Mayor.WithdrawAmount = CH_Mayor.WithdrawAmount + amount
	
	-- Add money to the player
	ply:addMoney( amount )
	
	-- Take money from vault
	CH_Mayor.TakeVaultMoney( amount )
	
	-- bLogs support
	hook.Run( "CH_Mayor_Vault_WithdrawMoney", ply, amount )
	
	-- Notify
	DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You have withdrawn" ) .." ".. DarkRP.formatMoney( amount ) .." ".. CH_Mayor.LangString( "from the mayor vault." ) )
	
	-- Network new limits
	CH_Mayor.NetworkWithdrawDepositLimits( ply )
end )

--[[
	Network the current limits to the client
--]]
function CH_Mayor.NetworkWithdrawDepositLimits( ply )
	net.Start( "CH_Mayor_Net_NetworkWithdrawDepositLimit" )
		net.WriteUInt( CH_Mayor.DepositAmount, 32 )
		net.WriteUInt( CH_Mayor.DepositLimit, 32 )
		net.WriteUInt( CH_Mayor.WithdrawAmount, 32 )
		net.WriteUInt( CH_Mayor.WithdrawLimit, 32 )
	net.Send( ply )
end