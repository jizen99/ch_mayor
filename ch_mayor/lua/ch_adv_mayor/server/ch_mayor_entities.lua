CH_Mayor.Entities = {}
CH_Mayor.Entities.Cityboard = {}
CH_Mayor.Entities.Announcement = {}
CH_Mayor.Entities.Leaderboard = {}
CH_Mayor.Entities.Trashcan = {}
CH_Mayor.Entities.Wanted = {}

local map = string.lower( game.GetMap() )

--[[
	Spawn entities function
--]]
function CH_Mayor.SpawnMayorVault()
	local pos_file = file.Read( "craphead_scripts/ch_mayor/".. map .."/mayor_vault.json", "DATA" )
	local file_table = util.JSONToTable( pos_file )

	-- Spawn entity
	local mayor_vault = ents.Create( "ch_mayor_vault" )
	mayor_vault:SetPos( file_table.EntityVector )
	mayor_vault:SetAngles( file_table.EntityAngles )
	mayor_vault:Spawn()
	
	-- If permanent money is enabled then read SQL and set money
	if CH_Mayor.Config.PermanentlySaveVaultMoney then
		-- Select query to get the vault money
		CH_Mayor.SQL.Query( "SELECT Money FROM ch_mayor_vault;", function( data )
			if data then
				CH_Mayor.SetVaultMoney( tonumber( data.Money ) )
			else
				CH_Mayor.SetVaultMoney( 0 )
				
				-- If first time then write into table
				CH_Mayor.SQL.Query( "INSERT INTO ch_mayor_vault ( Money ) VALUES( 0 );" )
			end
		end, true )
	end
end

--[[
	Console command to set mayor vault position
--]]
local function CH_Mayor_SetVaultPos( ply )
	if not ply:IsSuperAdmin() then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "Only administrators can perform this action." ) )
		return
	end
	
	local pos_file = {
		EntityVector = ply:GetPos(),
		EntityAngles = ply:GetAngles(),
	}

	file.Write( "craphead_scripts/ch_mayor/".. map .."/mayor_vault.json", util.TableToJSON( pos_file ), "DATA" )

	DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "New position for the vault has been succesfully set." ) )
	DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "The vault will respawn in 5 seconds. Move out the way." ) )
	
	-- Respawn the vault after 5 seconds
	-- 76561198422234222
	local vault = CH_Mayor.Entities.Vault
	if IsValid( vault ) then
		vault:Remove()
	end
	
	timer.Simple( 5, function()
		CH_Mayor.SpawnMayorVault()
		
		if IsValid( ply ) then
			DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "The vault has been respawned." ) )
		end
	end )
end
concommand.Add( "ch_mayor_setvaultpos", CH_Mayor_SetVaultPos )

--[[
	Spawn all announcement and wanted screens
--]]
function CH_Mayor.SpawnMayorEntities()
	for k, v in ipairs( file.Find( "craphead_scripts/ch_mayor/".. map .."/entities/announcement_*.json", "DATA" ) ) do
		local pos_file = file.Read( "craphead_scripts/ch_mayor/".. map .."/entities/".. v, "DATA" )
		local file_table = util.JSONToTable( pos_file )
	
		local announcement_screen = ents.Create( "ch_mayor_announcements" )
		announcement_screen:SetPos( file_table.EntityVector )
		announcement_screen:SetAngles( file_table.EntityAngles )
		announcement_screen:Spawn()
	end
	
	-- Wanted screens
	for k, v in ipairs( file.Find( "craphead_scripts/ch_mayor/".. map .."/entities/wanted_*.json", "DATA" ) ) do
		local pos_file = file.Read( "craphead_scripts/ch_mayor/".. map .."/entities/".. v, "DATA" )
		local file_table = util.JSONToTable( pos_file )
	
		local wanted_screen = ents.Create( "ch_mayor_wanted" )
		wanted_screen:SetPos( file_table.EntityVector )
		wanted_screen:SetAngles( file_table.EntityAngles )
		wanted_screen:Spawn()
	end
	
	-- Leaderboard screens
	for k, v in ipairs( file.Find( "craphead_scripts/ch_mayor/".. map .."/entities/leaderboard_*.json", "DATA" ) ) do
		local pos_file = file.Read( "craphead_scripts/ch_mayor/".. map .."/entities/".. v, "DATA" )
		local file_table = util.JSONToTable( pos_file )
	
		local wanted_screen = ents.Create( "ch_mayor_leaderboard" )
		wanted_screen:SetPos( file_table.EntityVector )
		wanted_screen:SetAngles( file_table.EntityAngles )
		wanted_screen:Spawn()
	end
	
	-- City boards
	for k, v in ipairs( file.Find( "craphead_scripts/ch_mayor/".. map .."/entities/cityboard_*.json", "DATA" ) ) do
		local pos_file = file.Read( "craphead_scripts/ch_mayor/".. map .."/entities/".. v, "DATA" )
		local file_table = util.JSONToTable( pos_file )
	
		local wanted_screen = ents.Create( "ch_mayor_cityboard" )
		wanted_screen:SetPos( file_table.EntityVector )
		wanted_screen:SetAngles( file_table.EntityAngles )
		wanted_screen:Spawn()
	end
end

--[[
	Save function
--]]
local function CH_Mayor_SaveEntities( ply, cmd, args )
	if not ply:IsSuperAdmin() then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "Only administrators can perform this action." ) )
		return
	end
	
	-- Delete all files
	for k, v in ipairs( file.Find( "craphead_scripts/ch_mayor/".. map .."/entities/*.json", "DATA" ) ) do
		file.Delete( "craphead_scripts/ch_mayor/".. map .."/entities/".. v )
	end
	
	-- Variables for auto increment ids
	local auto_increment_id_announcement = 0
	local auto_increment_id_wanted = 0
	local auto_increment_id_leaderboard = 0
	local auto_increment_id_cityboard = 0
	
	-- Save announcement screens
	for ent, value in pairs( CH_Mayor.Entities.Announcement ) do
		local pos_file = {
			EntityVector = ent:GetPos(),
			EntityAngles = ent:GetAngles(),
		}
		
		auto_increment_id_announcement = auto_increment_id_announcement + 1
		
		file.Write( "craphead_scripts/ch_mayor/".. map .."/entities/announcement_".. auto_increment_id_announcement ..".json", util.TableToJSON( pos_file ), "DATA" )
	end
	
	-- Save wanted screens
	for ent, value in pairs( CH_Mayor.Entities.Wanted ) do
		local pos_file = {
			EntityVector = ent:GetPos(),
			EntityAngles = ent:GetAngles(),
		}
		
		auto_increment_id_wanted = auto_increment_id_wanted + 1
		
		file.Write( "craphead_scripts/ch_mayor/".. map .."/entities/wanted_".. auto_increment_id_wanted ..".json", util.TableToJSON( pos_file ), "DATA" )
	end
	
	-- Save leaderboards
	for ent, value in pairs( CH_Mayor.Entities.Leaderboard ) do
		local pos_file = {
			EntityVector = ent:GetPos(),
			EntityAngles = ent:GetAngles(),
		}
		
		auto_increment_id_leaderboard = auto_increment_id_leaderboard + 1
		
		file.Write( "craphead_scripts/ch_mayor/".. map .."/entities/leaderboard_".. auto_increment_id_leaderboard ..".json", util.TableToJSON( pos_file ), "DATA" )
	end
	
	-- Save city boards
	for ent, value in pairs( CH_Mayor.Entities.Cityboard ) do
		local pos_file = {
			EntityVector = ent:GetPos(),
			EntityAngles = ent:GetAngles(),
		}
		
		auto_increment_id_cityboard = auto_increment_id_cityboard + 1
		
		file.Write( "craphead_scripts/ch_mayor/".. map .."/entities/cityboard_".. auto_increment_id_cityboard ..".json", util.TableToJSON( pos_file ), "DATA" )
	end
	
	-- Notify the player
	DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "All permanent mayor entities have been saved to the map." ) )
end
concommand.Add( "ch_mayor_saveents", CH_Mayor_SaveEntities )