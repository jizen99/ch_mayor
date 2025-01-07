include( "shared.lua" )
local imgui = include( "ch_adv_mayor/client/ch_mayor_imgui.lua" )

--[[
	Cache some variables for the main screen
--]]
local sw, sh = 1785, 980
local pos = Vector( 44.6, 0.1, 28.5 )
local ang = Angle( 0, 180, 90 )
local scale = 0.05

local mat_loading = Material( "materials/craphead_scripts/advanced_mayor/gui/entities/loading.png", "noclamp smooth" )

--[[
	Initialize the entity
--]]
function ENT:Initialize()
	-- First leaderboard on init
	self:SCREEN_ShowLeaderboard( "WarrantsPlaced", false )
	
	self.SCREEN_LastRefreshed = 0
end

--[[
	DrawTranslucent function to draw 3d2d UI on ATM
--]]
function ENT:DrawTranslucent()
	self:DrawModel()
	
	if LocalPlayer():GetPos():DistToSqr( self:GetPos() ) >= CH_Mayor.Config.DistanceTo3D2D then
		return
	end
	
	if imgui.Entity3D2D( self, pos, ang, scale ) then
		-- BG
		surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
		surface.DrawRect( 0, 0, sw, sh )
		
		-- Top
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, sw, 150 )

		-- Draw icons left and right
		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Ent_Leaderboard )
		surface.DrawTexturedRect( 50, 30, 90, 90 )
		
		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Ent_Leaderboard )
		surface.DrawTexturedRect( 1650, 30, 90, 90 )

		imgui.End3D2D()
	end
	
	-- 3D2D functions
	self.Draw3D2DPage()
end

--[[
	These functions are later used to store only the 3d2d that we're currently rendering for the player
--]]
function ENT.Draw3D2DPage()
end

--[[
	Format some text based on the board
--]]
local function CH_Mayor_Board_FormatText( input, board )
	if board == "WarrantsPlaced" then
		return string.Comma( input ) .." ".. CH_Mayor.LangString( "warrants" )
	elseif board == "PlayersWanted" then
		return string.Comma( input ) .." ".. CH_Mayor.LangString( "players" )
	elseif board == "TimesElected" then
		return string.Comma( input ) .." ".. CH_Mayor.LangString( "times" )
	elseif board == "VaultRobbed" then
		return string.Comma( input ) .." ".. CH_Mayor.LangString( "robberies" )
	elseif board == "TotalPlaytime" then
		return CH_Mayor.FormatPlaytime( input )
	elseif board == "PlayersDemoted" then
		return string.Comma( input ) .." ".. CH_Mayor.LangString( "players" )
	elseif board == "PlayersPromoted" then
		return string.Comma( input ) .." ".. CH_Mayor.LangString( "players" )
	elseif board == "CapitalAdded" then
		return DarkRP.formatMoney( input )
	elseif board == "LockdownsInitiated" then
		return string.Comma( input ) .." ".. CH_Mayor.LangString( "lockdowns" )
	elseif board == "LotteriesStarted" then
		return string.Comma( input ) .." ".. CH_Mayor.LangString( "lotteries" )
	end
	
	return input
end

local function CH_Mayor_Board_FormatTitle( board )
	if board == "WarrantsPlaced" then
		return CH_Mayor.LangString( "Most warrants placed" )
	elseif board == "PlayersWanted" then
		return CH_Mayor.LangString( "Most players wanted" )
	elseif board == "TimesElected" then
		return CH_Mayor.LangString( "Most times elected" )
	elseif board == "VaultRobbed" then
		return CH_Mayor.LangString( "Most robberies during period" )
	elseif board == "TotalPlaytime" then
		return CH_Mayor.LangString( "Most mayor playtime" )
	elseif board == "PlayersDemoted" then
		return CH_Mayor.LangString( "Most players demoted" )
	elseif board == "PlayersPromoted" then
		return CH_Mayor.LangString( "Most players promoted" )
	elseif board == "CapitalAdded" then
		return CH_Mayor.LangString( "Most money deposited" )
	elseif board == "LockdownsInitiated" then
		return CH_Mayor.LangString( "Most lockdowns initiated" )
	elseif board == "LotteriesStarted" then
		return CH_Mayor.LangString( "Most lotteries started" )
	end
	
	return board
end

--[[
	Show a specified leaderboard
--]]
function ENT:SCREEN_ShowLeaderboard( board )
	local ply = LocalPlayer()

	self.Draw3D2DPage = function()
		if imgui.Entity3D2D( self, pos, ang, scale ) then
			local pressing = imgui.IsPressing()

			local leaderboard = CH_Mayor.Leaderboards[ board ]
			
			if not leaderboard then
				-- Title
				draw.SimpleText( CH_Mayor.LangString( "Mayor Leaderboards" ), "CH_Mayor_Font_3D2D_110", sw / 2, 70, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				
				-- Network button
				surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
				surface.DrawRect( 540, 450, 700, 150 )
				
				draw.SimpleText( CH_Mayor.LangString( "Network Leaderboards" ), "CH_Mayor_Font_3D2D_70", sw / 2, 485, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				
				local hovering = imgui.IsHovering( 540, 450, 700, 150 )
			
				if hovering and pressing then
					net.Start( "CH_Mayor_Net_InitLeaderboards" )
					net.SendToServer()
				elseif hovering then
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 540, 450, 2, 150 )
					surface.DrawRect( 1238, 450, 2, 150 )
					surface.DrawRect( 540, 450, 700, 2 )
					surface.DrawRect( 540, 598, 700, 2 )
				else
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 540, 450, 2, 10 )
					surface.DrawRect( 540, 450, 10, 2 )
					surface.DrawRect( 540, 590, 2, 10 )
					surface.DrawRect( 540, 598, 10, 2 )
					surface.DrawRect( 1238, 450, 2, 10 )
					surface.DrawRect( 1230, 450, 10, 2 )
					surface.DrawRect( 1238, 590, 2, 10 )
					surface.DrawRect( 1230, 598, 10, 2 )
				end
			else
				-- Title
				draw.SimpleText( CH_Mayor_Board_FormatTitle( board ), "CH_Mayor_Font_3D2D_110", sw / 2, 70, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				
				-- Warrants Placed button
				surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
				surface.DrawRect( 21, 170, 330, 50 )
				
				draw.SimpleText( CH_Mayor.LangString( "Warrants Placed" ), "CH_Mayor_Font_3D2D_40", 185, 172.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				
				local hovering = imgui.IsHovering( 21, 170, 330, 50 )
			
				if hovering and pressing then
					self:SCREEN_Refresh( "WarrantsPlaced" )
				elseif hovering then
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 21, 170, 2, 50 )
					surface.DrawRect( 349, 170, 2, 50 )
					surface.DrawRect( 21, 170, 330, 2 )
					surface.DrawRect( 21, 218, 330, 2 )
				else
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 21, 170, 2, 10 )
					surface.DrawRect( 21, 170, 10, 2 )
					surface.DrawRect( 21, 210, 2, 10 )
					surface.DrawRect( 21, 218, 10, 2 )
					surface.DrawRect( 349, 170, 2, 10 )
					surface.DrawRect( 340, 170, 10, 2 )
					surface.DrawRect( 349, 210, 2, 10 )
					surface.DrawRect( 340, 218, 10, 2 )
				end
				
				-- PlayersWanted button
				surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
				surface.DrawRect( 372, 170, 330, 50 )
				
				draw.SimpleText( CH_Mayor.LangString( "Players Wanted" ), "CH_Mayor_Font_3D2D_40", 540, 172.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				
				local hovering = imgui.IsHovering( 372, 170, 330, 50 )
				
				if hovering and pressing then
					self:SCREEN_Refresh( "PlayersWanted" )
				elseif hovering then
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 372, 170, 2, 50 )
					surface.DrawRect( 700, 170, 2, 50 )
					surface.DrawRect( 372, 170, 330, 2 )
					surface.DrawRect( 372, 218, 330, 2 )
				else
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 372, 170, 2, 10 )
					surface.DrawRect( 372, 170, 10, 2 )
					surface.DrawRect( 372, 210, 2, 10 )
					surface.DrawRect( 372, 218, 10, 2 )
					surface.DrawRect( 700, 170, 2, 10 )
					surface.DrawRect( 692, 170, 10, 2 )
					surface.DrawRect( 700, 210, 2, 10 )
					surface.DrawRect( 692, 218, 10, 2 )
				end
				
				-- TimesElected button
				surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
				surface.DrawRect( 724, 170, 330, 50 )
				
				draw.SimpleText( CH_Mayor.LangString( "Times Elected" ), "CH_Mayor_Font_3D2D_40", 890, 172.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				
				local hovering = imgui.IsHovering( 724, 170, 330, 50 )
			
				if hovering and pressing then
					self:SCREEN_Refresh( "TimesElected" )
				elseif hovering then
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 724, 170, 2, 50 )
					surface.DrawRect( 1052, 170, 2, 50 )
					surface.DrawRect( 724, 170, 330, 2 )
					surface.DrawRect( 724, 218, 330, 2 )
				else
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 724, 170, 2, 10 )
					surface.DrawRect( 724, 170, 10, 2 )
					surface.DrawRect( 724, 210, 2, 10 )
					surface.DrawRect( 724, 218, 10, 2 )
					surface.DrawRect( 1052, 170, 2, 10 )
					surface.DrawRect( 1044, 170, 10, 2 )
					surface.DrawRect( 1052, 210, 2, 10 )
					surface.DrawRect( 1044, 218, 10, 2 )
				end
				
				-- VaultRobbed button
				surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
				surface.DrawRect( 1078, 170, 330, 50 )
				
				draw.SimpleText( CH_Mayor.LangString( "Vaults Robbed" ), "CH_Mayor_Font_3D2D_40", 1250, 172.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				
				local hovering = imgui.IsHovering( 1078, 170, 330, 50 )
			
				if hovering and pressing then
					self:SCREEN_Refresh( "VaultRobbed" )
				elseif hovering then
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 1078, 170, 2, 50 )
					surface.DrawRect( 1406, 170, 2, 50 )
					surface.DrawRect( 1078, 170, 330, 2 )
					surface.DrawRect( 1078, 218, 330, 2 )
				else
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 1078, 170, 2, 10 )
					surface.DrawRect( 1078, 170, 10, 2 )
					surface.DrawRect( 1078, 210, 2, 10 )
					surface.DrawRect( 1078, 218, 10, 2 )
					surface.DrawRect( 1406, 170, 2, 10 )
					surface.DrawRect( 1398, 170, 10, 2 )
					surface.DrawRect( 1406, 210, 2, 10 )
					surface.DrawRect( 1398, 218, 10, 2 )
				end
				
				-- TotalPlaytime button
				surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
				surface.DrawRect( 1430, 170, 330, 50 )
				
				draw.SimpleText( CH_Mayor.LangString( "Mayor Playtime" ), "CH_Mayor_Font_3D2D_40", 1595, 172.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				
				local hovering = imgui.IsHovering( 1430, 170, 330, 50 )
			
				if hovering and pressing then
					self:SCREEN_Refresh( "TotalPlaytime" )
				elseif hovering then
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 1430, 170, 2, 50 )
					surface.DrawRect( 1758, 170, 2, 50 )
					surface.DrawRect( 1430, 170, 330, 2 )
					surface.DrawRect( 1430, 218, 330, 2 )
				else
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 1430, 170, 2, 10 )
					surface.DrawRect( 1430, 170, 10, 2 )
					surface.DrawRect( 1430, 210, 2, 10 )
					surface.DrawRect( 1430, 218, 10, 2 )
					surface.DrawRect( 1758, 170, 2, 10 )
					surface.DrawRect( 1750, 170, 10, 2 )
					surface.DrawRect( 1758, 210, 2, 10 )
					surface.DrawRect( 1750, 218, 10, 2 )
				end
				
				-- PlayersDemoted button
				surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
				surface.DrawRect( 21, 240, 330, 50 )
				
				draw.SimpleText( CH_Mayor.LangString( "Players Demoted"), "CH_Mayor_Font_3D2D_40", 185, 242.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				
				local hovering = imgui.IsHovering( 21, 240, 330, 50 )
				
				if hovering and pressing then
					self:SCREEN_Refresh( "PlayersDemoted" )
				elseif hovering then
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 21, 240, 2, 50 )
					surface.DrawRect( 349, 240, 2, 50 )
					surface.DrawRect( 21, 240, 330, 2 )
					surface.DrawRect( 21, 288, 330, 2 )
				else
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 21, 240, 2, 10 )
					surface.DrawRect( 21, 240, 10, 2 )
					surface.DrawRect( 21, 280, 2, 10 )
					surface.DrawRect( 21, 288, 10, 2 )
					surface.DrawRect( 349, 240, 2, 10 )
					surface.DrawRect( 340, 240, 10, 2 )
					surface.DrawRect( 349, 280, 2, 10 )
					surface.DrawRect( 340, 288, 10, 2 )
				end
				
				-- PlayersPromoted button
				surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
				surface.DrawRect( 372, 240, 330, 50 )
				
				draw.SimpleText( CH_Mayor.LangString( "Players Promoted" ), "CH_Mayor_Font_3D2D_40", 540, 242.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				
				local hovering = imgui.IsHovering( 372, 240, 330, 50 )
			
				if hovering and pressing then
					self:SCREEN_Refresh( "PlayersPromoted" )
				elseif hovering then
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 372, 240, 2, 50 )
					surface.DrawRect( 700, 240, 2, 50 )
					surface.DrawRect( 372, 240, 330, 2 )
					surface.DrawRect( 372, 288, 330, 2 )
				else
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 372, 240, 2, 10 )
					surface.DrawRect( 372, 240, 10, 2 )
					surface.DrawRect( 372, 280, 2, 10 )
					surface.DrawRect( 372, 288, 10, 2 )
					surface.DrawRect( 700, 240, 2, 10 )
					surface.DrawRect( 692, 240, 10, 2 )
					surface.DrawRect( 700, 280, 2, 10 )
					surface.DrawRect( 692, 288, 10, 2 )
				end
				
				-- CapitalAdded button
				surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
				surface.DrawRect( 724, 240, 330, 50 )
				
				draw.SimpleText( CH_Mayor.LangString( "Capital Added" ), "CH_Mayor_Font_3D2D_40", 890, 242.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				
				local hovering = imgui.IsHovering( 724, 240, 330, 50 )
			
				if hovering and pressing then
					self:SCREEN_Refresh( "CapitalAdded" )
				elseif hovering then
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 724, 240, 2, 50 )
					surface.DrawRect( 1052, 240, 2, 50 )
					surface.DrawRect( 724, 240, 330, 2 )
					surface.DrawRect( 724, 288, 330, 2 )
				else
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 724, 240, 2, 10 )
					surface.DrawRect( 724, 240, 10, 2 )
					surface.DrawRect( 724, 280, 2, 10 )
					surface.DrawRect( 724, 288, 10, 2 )
					surface.DrawRect( 1052, 240, 2, 10 )
					surface.DrawRect( 1044, 240, 10, 2 )
					surface.DrawRect( 1052, 280, 2, 10 )
					surface.DrawRect( 1044, 288, 10, 2 )
				end
				
				-- LockdownsInitiated button
				surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
				surface.DrawRect( 1078, 240, 330, 50 )
				
				draw.SimpleText( CH_Mayor.LangString( "Lockdowns Initiated" ), "CH_Mayor_Font_3D2D_40", 1250, 242.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				
				local hovering = imgui.IsHovering( 1078, 240, 330, 50 )
			
				if hovering and pressing then
					self:SCREEN_Refresh( "LockdownsInitiated" )
				elseif hovering then
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 1078, 240, 2, 50 )
					surface.DrawRect( 1406, 240, 2, 50 )
					surface.DrawRect( 1078, 240, 330, 2 )
					surface.DrawRect( 1078, 288, 330, 2 )
				else
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 1078, 240, 2, 10 )
					surface.DrawRect( 1078, 240, 10, 2 )
					surface.DrawRect( 1078, 280, 2, 10 )
					surface.DrawRect( 1078, 288, 10, 2 )
					surface.DrawRect( 1406, 240, 2, 10 )
					surface.DrawRect( 1398, 240, 10, 2 )
					surface.DrawRect( 1406, 280, 2, 10 )
					surface.DrawRect( 1398, 288, 10, 2 )
				end
				
				-- LotteriesStarted button
				surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
				surface.DrawRect( 1430, 240, 330, 50 )
				
				draw.SimpleText( CH_Mayor.LangString( "Lotteries Started" ), "CH_Mayor_Font_3D2D_40", 1595, 242.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				
				local hovering = imgui.IsHovering( 1430, 240, 330, 50 )
			
				if hovering and pressing then
					self:SCREEN_Refresh( "LotteriesStarted" )
				elseif hovering then
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 1430, 240, 2, 50 )
					surface.DrawRect( 1758, 240, 2, 50 )
					surface.DrawRect( 1430, 240, 330, 2 )
					surface.DrawRect( 1430, 288, 330, 2 )
				else
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
					surface.DrawRect( 1430, 240, 2, 10 )
					surface.DrawRect( 1430, 240, 10, 2 )
					surface.DrawRect( 1430, 280, 2, 10 )
					surface.DrawRect( 1430, 288, 10, 2 )
					surface.DrawRect( 1758, 240, 2, 10 )
					surface.DrawRect( 1750, 240, 10, 2 )
					surface.DrawRect( 1758, 280, 2, 10 )
					surface.DrawRect( 1750, 288, 10, 2 )
				end
				
				-- First place
				surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
				surface.DrawRect( 607.5, 320, 565, 180 )
				
				surface.SetDrawColor( color_white )
				surface.SetMaterial( CH_Mayor.Materials.Icon_Ent_Leaderboard_First )
				surface.DrawTexturedRect( 850, 300, 80, 80 )
				
				if leaderboard[1] then
					draw.SimpleText( leaderboard[1].Name, "CH_Mayor_Font_3D2D_70", sw / 2, 370, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
					draw.SimpleText( CH_Mayor_Board_FormatText( leaderboard[1].Amount, board ), "CH_Mayor_Font_3D2D_60", sw / 2, 430, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				end
				
				-- Second place
				surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
				surface.DrawRect( 20, 320, 565, 180 )
				
				surface.SetDrawColor( color_white )
				surface.SetMaterial( CH_Mayor.Materials.Icon_Ent_Leaderboard_Second )
				surface.DrawTexturedRect( 265, 300, 80, 80 )
				
				if leaderboard[2] then
					draw.SimpleText( leaderboard[2].Name, "CH_Mayor_Font_3D2D_70", 300, 370, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
					draw.SimpleText( CH_Mayor_Board_FormatText( leaderboard[2].Amount, board ), "CH_Mayor_Font_3D2D_60", 300, 430,  color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				end
				
				-- Third place
				surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
				surface.DrawRect( 1195, 320, 565, 180 )
				
				surface.SetDrawColor( color_white )
				surface.SetMaterial( CH_Mayor.Materials.Icon_Ent_Leaderboard_Third )
				surface.DrawTexturedRect( 1425, 300, 80, 80 )
				
				if leaderboard[3] then
					draw.SimpleText( leaderboard[3].Name, "CH_Mayor_Font_3D2D_70", 1470, 370, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
					draw.SimpleText( CH_Mayor_Board_FormatText( leaderboard[3].Amount, board ), "CH_Mayor_Font_3D2D_60", 1470, 430,  color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				end

				-- Fourth place
				surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
				surface.DrawRect( 0, 525, sw, 65 )
				
				if leaderboard[4] then
					draw.SimpleText( "#4", "CH_Mayor_Font_3D2D_50", 300, 530, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
					draw.SimpleText( leaderboard[4].Name, "CH_Mayor_Font_3D2D_50", sw / 2, 530, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
					draw.SimpleText( CH_Mayor_Board_FormatText( leaderboard[4].Amount, board ), "CH_Mayor_Font_3D2D_50", 1470, 530,  color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				end
				
				-- Fifth place
				if leaderboard[5] then
					draw.SimpleText( "#5", "CH_Mayor_Font_3D2D_50", 300, 595, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
					draw.SimpleText( leaderboard[5].Name, "CH_Mayor_Font_3D2D_50", sw / 2, 595, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
					draw.SimpleText( CH_Mayor_Board_FormatText( leaderboard[5].Amount, board ), "CH_Mayor_Font_3D2D_50", 1470, 595,  color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				end
				
				-- Six place
				surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
				surface.DrawRect( 0, 655, sw, 65 )
				
				if leaderboard[6] then
					draw.SimpleText( "#6", "CH_Mayor_Font_3D2D_50", 300, 660, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
					draw.SimpleText( leaderboard[6].Name, "CH_Mayor_Font_3D2D_50", sw / 2, 660, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
					draw.SimpleText( CH_Mayor_Board_FormatText( leaderboard[6].Amount, board ), "CH_Mayor_Font_3D2D_50", 1470, 660,  color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				end
				
				-- Seventh place
				if leaderboard[7] then
					draw.SimpleText( "#7", "CH_Mayor_Font_3D2D_50", 300, 725, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
					draw.SimpleText( leaderboard[7].Name, "CH_Mayor_Font_3D2D_50", sw / 2, 725, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
					draw.SimpleText( CH_Mayor_Board_FormatText( leaderboard[7].Amount, board ), "CH_Mayor_Font_3D2D_50", 1470, 725,  color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				end
				
				-- Eight place
				surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
				surface.DrawRect( 0, 785, sw, 65 )
				
				if leaderboard[8] then
					draw.SimpleText( "#8", "CH_Mayor_Font_3D2D_50", 300, 790, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
					draw.SimpleText( leaderboard[8].Name, "CH_Mayor_Font_3D2D_50", sw / 2, 790, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
					draw.SimpleText( CH_Mayor_Board_FormatText( leaderboard[8].Amount, board ), "CH_Mayor_Font_3D2D_50", 1470, 790,  color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				end
				
				-- Ninth place
				if leaderboard[9] then
					draw.SimpleText( "#9", "CH_Mayor_Font_3D2D_50", 300, 855, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
					draw.SimpleText( leaderboard[9].Name, "CH_Mayor_Font_3D2D_50", sw / 2, 855, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
					draw.SimpleText( CH_Mayor_Board_FormatText( leaderboard[9].Amount, board ), "CH_Mayor_Font_3D2D_50", 1470, 855,  color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				end
				
				-- Tenth place
				surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
				surface.DrawRect( 0, 915, sw, 65 )
				
				if leaderboard[10] then
					draw.SimpleText( "#10", "CH_Mayor_Font_3D2D_50", 300, 920, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
					draw.SimpleText( leaderboard[10].Name, "CH_Mayor_Font_3D2D_50", sw / 2, 920, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
					draw.SimpleText( CH_Mayor_Board_FormatText( leaderboard[10].Amount, board ), "CH_Mayor_Font_3D2D_50", 1470, 920,  color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				end
				
				-- button to refresh
				local cur_time = CurTime()
				
				if ( self.SCREEN_LastRefreshed or 0 ) < cur_time then
					local hovering = imgui.IsHovering( 1720, 925, 45, 45 )
					
					surface.SetDrawColor( not hovering and color_white or CH_Mayor.Colors.GMSBlue )
					surface.SetMaterial( mat_loading )
					if hovering then
						surface.DrawTexturedRectRotated( 1742.5, 947.5, 45, 45, cur_time * -75 )
					else
						surface.DrawTexturedRect( 1720, 925, 45, 45 )
					end
					
					if hovering and pressing then
						surface.PlaySound( "buttons/lightswitch2.wav" )
						
						net.Start( "CH_Mayor_Net_InitLeaderboards" )
						net.SendToServer()
						
						self:SCREEN_Refresh( board )
						
						self.SCREEN_LastRefreshed = cur_time + 60
					end
				end
			end
			
			-- Draw curser
			imgui.xCursor( 0, 0, sw, sh )
			
			imgui.End3D2D()
		end
	end
end

--[[
	Loading screen
--]]
function ENT:SCREEN_Refresh( board )
	surface.PlaySound( "buttons/lightswitch2.wav" )
	
	self.Draw3D2DPage = function()
		if imgui.Entity3D2D( self, pos, ang, scale ) then
			-- Draw spinning loading icon
			surface.SetDrawColor( color_white )
			surface.SetMaterial( mat_loading )
			surface.DrawTexturedRectRotated( sw / 2, 500, 256, 256, CurTime() * -75 )
			
			draw.SimpleText( CH_Mayor.LangString( "Loading leaderboard" ), "CH_Mayor_Font_3D2D_70", sw / 2, 700, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			
			imgui.End3D2D()
		end
	end
	
	timer.Simple( 1, function()
		if IsValid( self ) then
			self:SCREEN_ShowLeaderboard( board )
		end
	end )
end