--[[
	Give XP support
--]]
function CH_Mayor.GiveXP( ply, amount, reason )
	-- Give XP (Vronkadis DarkRP Level System)
	if LevelSystemConfiguration then
		self:addXP( amount, true )
	end
	
	-- Give XP (Sublime Levels)
	if Sublime and Sublime.Config and Sublime.Config.BaseExperience then
		self:SL_AddExperience( amount, reason )
	end
	
	-- Give XP (Elite XP system)
	if EliteXP then
		EliteXP.CheckXP( self, amount )
	end
	
	-- Give XP (DarkRP essentials & Brick's Essentials)
	if ( BRICKS_SERVER and BRICKS_SERVER.CONFIG and BRICKS_SERVER.CONFIG.LEVELING ) or ( DARKRP_ESSENTIALS and DARKRP_ESSENTIALS.CONFIG and DARKRP_ESSENTIALS.CONFIG.Enable_Leveling ) then
		self:AddExperience( amount, reason )
	end

	-- Give XP (GlorifiedLeveling)
	if GlorifiedLeveling then
		GlorifiedLeveling.AddPlayerXP( self, amount )
	end
end