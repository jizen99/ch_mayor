-- INITIALIZE SCRIPT
if SERVER then
	for k, v in ipairs( file.Find( "ch_adv_mayor/shared/config/*.lua", "LUA" ) ) do
		include( "ch_adv_mayor/shared/config/".. v )
		AddCSLuaFile( "ch_adv_mayor/shared/config/".. v )
	end
	
	for k, v in ipairs( file.Find( "ch_adv_mayor/shared/config/upgrades/*.lua", "LUA" ) ) do
		include( "ch_adv_mayor/shared/config/upgrades/".. v )
		AddCSLuaFile( "ch_adv_mayor/shared/config/upgrades/".. v )
	end
	
	for k, v in ipairs( file.Find( "ch_adv_mayor/shared/config/catalog/*.lua", "LUA" ) ) do
		include( "ch_adv_mayor/shared/config/catalog/".. v )
		AddCSLuaFile( "ch_adv_mayor/shared/config/catalog/".. v )
	end
	
	for k, v in ipairs( file.Find( "ch_adv_mayor/shared/*.lua", "LUA" ) ) do
		include( "ch_adv_mayor/shared/".. v )
		AddCSLuaFile( "ch_adv_mayor/shared/".. v )
	end
	
	for k, v in ipairs( file.Find( "ch_adv_mayor/server/*.lua", "LUA" ) ) do
		include( "ch_adv_mayor/server/".. v )
	end
	
	for k, v in ipairs( file.Find( "ch_adv_mayor/server/sql/*.lua", "LUA" ) ) do
		include( "ch_adv_mayor/server/sql/".. v )
	end
	
	for k, v in ipairs( file.Find( "ch_adv_mayor/client/*.lua", "LUA" ) ) do
		AddCSLuaFile( "ch_adv_mayor/client/".. v )
	end
	
	for k, v in ipairs( file.Find( "ch_adv_mayor/client/vgui/*.lua", "LUA" ) ) do
		AddCSLuaFile( "ch_adv_mayor/client/vgui/".. v )
	end
end

if CLIENT then
	for k, v in ipairs( file.Find( "ch_adv_mayor/shared/config/*.lua", "LUA" ) ) do
		include( "ch_adv_mayor/shared/config/".. v )
	end
	
	for k, v in ipairs( file.Find( "ch_adv_mayor/shared/config/upgrades/*.lua", "LUA" ) ) do
		include( "ch_adv_mayor/shared/config/upgrades/".. v )
	end
	
	for k, v in ipairs( file.Find( "ch_adv_mayor/shared/config/catalog/*.lua", "LUA" ) ) do
		include( "ch_adv_mayor/shared/config/catalog/".. v )
	end
	
	for k, v in ipairs( file.Find( "ch_adv_mayor/shared/*.lua", "LUA" ) ) do
		include( "ch_adv_mayor/shared/".. v )
	end
	
	for k, v in ipairs( file.Find( "ch_adv_mayor/client/*.lua", "LUA" ) ) do
		include( "ch_adv_mayor/client/".. v )
	end
	
	for k, v in ipairs( file.Find( "ch_adv_mayor/client/vgui/*.lua", "LUA" ) ) do
		include( "ch_adv_mayor/client/vgui/".. v )
	end
end