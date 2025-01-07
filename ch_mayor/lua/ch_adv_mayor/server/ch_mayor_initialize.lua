util.AddNetworkString( "CH_Mayor_Net_ShowMayorMenu" )
util.AddNetworkString( "CH_Mayor_Net_HUDPaintLoad" )
util.AddNetworkString( "CH_Mayor_Net_MayorVault" )

-- Dashboard
util.AddNetworkString( "CH_Mayor_Net_DepositMoneyVault" )
util.AddNetworkString( "CH_Mayor_Net_WithdrawMoneyVault" )
util.AddNetworkString( "CH_Mayor_Net_NetworkWithdrawDepositLimit" )

-- Robbery
util.AddNetworkString( "CH_Mayor_RestartCooldown" )
util.AddNetworkString( "CH_Mayor_StopCooldown" )
util.AddNetworkString( "CH_Mayor_RestartTimer" )
util.AddNetworkString( "CH_Mayor_StopTimer" )

-- Licenses
util.AddNetworkString( "CH_Mayor_Net_ManageLicense" )

-- Wanted
util.AddNetworkString( "CH_Mayor_Net_MakeUnwanted" )

-- Warrant
util.AddNetworkString( "CH_Mayor_Net_MakeUnwarrant" )
util.AddNetworkString( "CH_Mayor_Net_UpdateWarrants" )
util.AddNetworkString( "CH_Mayor_Net_RemoveWarrantedPlayer" )

-- Civilians
util.AddNetworkString( "CH_Mayor_Net_WantedPlayer" )
util.AddNetworkString( "CH_Mayor_Net_WarrantPlayer" )

-- Officials
util.AddNetworkString( "CH_Mayor_Net_DemotePlayer" )
util.AddNetworkString( "CH_Mayor_Net_PromotePlayer" )

-- Taxes
util.AddNetworkString( "CH_Mayor_Net_UpdateTeamTax" )
util.AddNetworkString( "CH_Mayor_Net_NetworkTeamTaxes" )

-- Lockdown
util.AddNetworkString( "CH_Mayor_Net_StartLockdown" )
util.AddNetworkString( "CH_Mayor_Net_StopLockdown" )

-- Announcement
util.AddNetworkString( "CH_Mayor_Net_UpdateMayorAnnouncement" )
util.AddNetworkString( "CH_Mayor_Net_NewAnnouncementFlash" )

-- Statistics
util.AddNetworkString( "CH_Mayor_Net_MayorStats" )

-- Wanted Screen
util.AddNetworkString( "CH_Mayor_Net_ReloadWantedScreen" )

-- Laws
util.AddNetworkString( "CH_Mayor_Net_AddLaw" )
util.AddNetworkString( "CH_Mayor_Net_ResetLaws" )

-- Leaderboard
util.AddNetworkString( "CH_Mayor_Net_InitLeaderboards" )
util.AddNetworkString( "CH_Mayor_Net_Leaderboards" )

-- Catalog
util.AddNetworkString( "CH_Mayor_Net_BuyCatalogItem" )

-- Upgrades
util.AddNetworkString( "CH_Mayor_Net_BuyUpgrade" )
util.AddNetworkString( "CH_Mayor_Net_NetworkUpgradeLevels" )

resource.AddWorkshop( "2925952159")

--[[
	Setup directories on server
--]]
local map = string.lower( game.GetMap() )

local function CH_Mayor_Initialize()
	print( "[CH Mayor] - Script initialized." )
	
	if not file.IsDir( "craphead_scripts", "DATA" ) then
		file.CreateDir( "craphead_scripts", "DATA" )
	end
	
	if not file.IsDir( "craphead_scripts/ch_mayor/", "DATA" ) then
		file.CreateDir( "craphead_scripts/ch_mayor/", "DATA" )
	end
	
	if not file.IsDir( "craphead_scripts/ch_mayor/".. map, "DATA" ) then
		file.CreateDir( "craphead_scripts/ch_mayor/".. map, "DATA" )
		
		local pos_file = {
			EntityVector = Vector( 0, 0, 0 ),
			EntityAngles = Angle( 0, 0, 0 ),
		}
		
		file.Write( "craphead_scripts/ch_mayor/".. map .."/mayor_vault.json", util.TableToJSON( pos_file ), "DATA" )
	end
	
	if not file.IsDir( "craphead_scripts/ch_mayor/".. map .."/entities/", "DATA" ) then
		file.CreateDir( "craphead_scripts/ch_mayor/".. map .."/entities/", "DATA" )
	end
	
	-- Spawn mayor vault
	CH_Mayor.SpawnMayorVault()
	
	-- Spawn announcement and wanted screens
	CH_Mayor.SpawnMayorEntities()
	
	-- Setup team taxes
	CH_Mayor.SetupTeamTaxes()
	
	-- Setup mayor upgrades
	CH_Mayor.SetupUpgradeLevels()
	
	-- Start the timer to generate money if enabled in the config
	if CH_Mayor.Config.VaultGenerateMoney then
		CH_Mayor.GenerateVaultMoney()
	end
end
hook.Add( "InitPostEntity", "CH_Mayor_Initialize", CH_Mayor_Initialize )

--[[
	Respawn rocks on admin cleanup map
--]]
function CH_Mayor.CleanupRespawnEntities()
	print( "[CH Mayor] - Map cleaned up. Respawning entities." )

	timer.Simple( 1, function()
		CH_Mayor.SpawnMayorVault()
		
		CH_Mayor.SpawnMayorEntities()
	end )
end
hook.Add( "PostCleanupMap", "CH_Mayor.CleanupRespawnEntities", CH_Mayor.CleanupRespawnEntities )