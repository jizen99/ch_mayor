CH_Mayor.VaultMoney = CH_Mayor.VaultMoney or 0
CH_Mayor.MaxVaultMoney = CH_Mayor.Config.VaultDefaultMax

--[[
	Function to generate money in the mayors vault
--]]
function CH_Mayor.GenerateVaultMoney()
	timer.Create( "CH_Mayor_Timer_GenerateMoney", CH_Mayor.Config.GenerateMoneyInterval, 0, function()
		local random_money = math.random( CH_Mayor.Config.GenerateMoneyMin, CH_Mayor.Config.GenerateMoneyMax )
		
		CH_Mayor.AddVaultMoney( random_money, true )
	end )
end

--[[
	Add money to the mayors vault
--]]
function CH_Mayor.AddVaultMoney( amount, notify )
	-- Check we're adding positive number
	if amount <= 0 then
		return
	end
	
	-- Add the amount to the current total
	CH_Mayor.SetVaultMoney( CH_Mayor.VaultMoney + amount )
	
	-- Notify the mayor
	local mayor = CH_Mayor.GetMayor()
	if IsValid( mayor ) and notify then
		DarkRP.notify( mayor, 1, CH_Mayor.Config.NotificationTime, DarkRP.formatMoney( amount ) .." ".. CH_Mayor.LangString( "has been added to the city funds." ) )
	end
end

--[[
	Take money from the mayors vault
--]]
function CH_Mayor.TakeVaultMoney( amount )
	-- Check if mayor vault has enough
	if CH_Mayor.VaultMoney < amount then
		return
	end
	
	-- Check we're deducting positive number
	if amount <= 0 then
		return
	end
	
	-- Deduct the amount from the current total
	CH_Mayor.SetVaultMoney( CH_Mayor.VaultMoney - amount )
	
	-- Notify the mayor
	local mayor = CH_Mayor.GetMayor()
	if IsValid( mayor ) then
		DarkRP.notify( mayor, 1, CH_Mayor.Config.NotificationTime, DarkRP.formatMoney( amount ) .." ".. CH_Mayor.LangString( "has been deducted from the city funds." ) )
	end
end

--[[
	Sets the vault money to an amount (used by Add/Take functions)
--]]
function CH_Mayor.SetVaultMoney( amount )
	-- Update the value
	CH_Mayor.VaultMoney = amount
	
	-- If amount exceeds the citys maximum then clamp it
	if CH_Mayor.VaultMoney > CH_Mayor.MaxVaultMoney then
		CH_Mayor.VaultMoney = math.Clamp( CH_Mayor.VaultMoney, 0, CH_Mayor.MaxVaultMoney )
		
		-- If clamped the notify about the clamping
		if IsValid( mayor ) then
			DarkRP.notify( mayor, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "The maximum amount has been exceeded and the city vault has been clamped to" ) .." ".. DarkRP.formatMoney( CH_Mayor.MaxVaultMoney ) )
		end
	end
	
	-- Network it to everyone
	for k, ply in ipairs( player.GetAll() ) do
		CH_Mayor.NetworkMayorVault( ply )
	end
	
	-- Update bodygroup on vault model
	local vault = CH_Mayor.MayorVaultEntity
	if IsValid( vault ) then
		vault:ControlBodygroup()
	end
	
	-- Update sql if permanent is enabled
	if CH_Mayor.Config.PermanentlySaveVaultMoney then
		CH_Mayor.SQL.Query( "UPDATE ch_mayor_vault SET Money = '" .. CH_Mayor.VaultMoney .. "';" )
	end
end

--[[
	Update max vault money
--]]
function CH_Mayor.SetMaxVaultMoney( ply, amount )
	CH_Mayor.MaxVaultMoney = amount
	
	-- Network it
	if IsValid( ply ) then
		CH_Mayor.NetworkMayorVault( ply )
	end
end

--[[
	Networks the vault money to the player
--]]
function CH_Mayor.NetworkMayorVault( ply )
	-- Send the data to the client
	net.Start( "CH_Mayor_Net_MayorVault" )
		net.WriteUInt( CH_Mayor.VaultMoney, 32 )
		net.WriteUInt( CH_Mayor.MaxVaultMoney, 32 )
	net.Send( ply )
end