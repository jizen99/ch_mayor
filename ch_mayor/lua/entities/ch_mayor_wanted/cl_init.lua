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
local mat_page_next = Material( "materials/craphead_scripts/advanced_mayor/gui/entities/page_next.png", "noclamp smooth" )
local mat_page_back = Material( "materials/craphead_scripts/advanced_mayor/gui/entities/page_back.png", "noclamp smooth" )

--[[
	Initialize the entity
--]]
function ENT:Initialize()
	-- Pagination stuff
	self.PAGES_CurrentPage = 1
	self.PAGES_AmountOfPages = 0
	self.PAGES_PageContent = {}
	
	-- First screen on init
	self:SCREEN_WantedPlayers()
	
	self.GUI_BigPlayerModel = vgui.Create( "SpawnIcon" )
	self.GUI_BigPlayerModel:SetSize( 710, 700 )
	self.GUI_BigPlayerModel:ParentToHUD()
	self.GUI_BigPlayerModel:SetPaintedManually( true )
end

--[[
	Net message to reload the wanted screen
	Called when a player is wanted/unwanted to reload the list
--]]
net.Receive( "CH_Mayor_Net_ReloadWantedScreen", function( len, ply )
	for k, ent in ipairs( ents.FindByClass( "ch_mayor_wanted" ) ) do
		ent:SCREEN_Refresh()
	end
end )

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
	
		draw.SimpleText( CH_Mayor.LangString( "Wanted Criminals" ), "CH_Mayor_Font_3D2D_110", sw / 2, 70, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
		-- Draw icons left and right
		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Ent_Exclamation )
		surface.DrawTexturedRect( 50, 30, 90, 90 )
		
		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Ent_Exclamation )
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
	Show all wanted players
--]]
function ENT:SCREEN_WantedPlayers()
	local ply = LocalPlayer()
	
	-- Setup the amount of pages
	self.PAGES_PageContent = {}
	local wanted_players = {}
	
	for k, v in ipairs( player.GetAll() ) do
		if v:isWanted() then
			table.insert( wanted_players, v )
		end
	end
	
	local amount_of_players = #wanted_players
	self.PAGES_AmountOfPages = math.ceil( amount_of_players / 6 )
	
	for i = 1, self.PAGES_AmountOfPages do
		-- Create the table for page
		self.PAGES_PageContent[ i ] = {}
	end
	
	-- Insert entries into their respective page
	local count = 0
	for k, v in ipairs( wanted_players ) do
		count = count + 1
		
		local page = math.ceil( count / 6 )
		
		table.insert( self.PAGES_PageContent[ page ], v )
	end

	self.Draw3D2DPage = function()
		if imgui.Entity3D2D( self, pos, ang, scale ) then
			local pressing = imgui.IsPressing()
			
			-- Pages of players
			if self.PAGES_PageContent[ self.PAGES_CurrentPage ] then
				for k, target in pairs( self.PAGES_PageContent[ self.PAGES_CurrentPage ] ) do
					local x_pos = -810
					local y_pos = 190

					local y_offset = 0
					if k <= 2 then
						y_offset = k * 860
						x_pos = x_pos + y_offset
					elseif k <= 4 then
						y_offset = ( k - 2 ) * 860
						x_pos = x_pos + y_offset
						
						y_pos = 430
					elseif k <= 6 then
						y_offset = ( k - 4 ) * 860
						x_pos = x_pos + y_offset
						
						y_pos = 670
					end
					
					-- Player BG
					surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
					surface.DrawRect( x_pos, y_pos, 830, 210 )
					
					surface.SetDrawColor( color_white )
					surface.SetMaterial( CH_Mayor.Materials.Icon_Ent_Wanted )
					surface.DrawTexturedRect( x_pos + 20, y_pos + 25, 160, 160 )
					
					-- Player Info
					local ply_name = ""
					local wanted_reason = ""
					local ply_job = ""
					local job_clr = color_white
					
					if IsValid( target ) and target:isWanted() then
						ply_name = target:Nick()
						wanted_reason = DarkRP.textWrap( CH_Mayor.LangString( "Reason" ) ..": ".. target:getWantedReason(), "CH_Mayor_Font_3D2D_45", 600 )
						ply_job = team.GetName( target:Team() )
						job_clr = team.GetColor( target:Team() )
					else
						ply_name = CH_Mayor.LangString( "Disconnected Player" )
						wanted_reason = CH_Mayor.LangString( "Reason" ) ..": ".. CH_Mayor.LangString( "Expired" )
						ply_job = "N/A"
						job_clr = color_white
					end
					if string.len( ply_name ) > 18 then
						ply_name = string.Left( ply_name, 18 ) ..".."
					end
					if string.len( wanted_reason ) > 65 then
						wanted_reason = DarkRP.textWrap( string.Left( CH_Mayor.LangString( "Reason" ) ..": ".. target:getWantedReason(), 65 ) .."..", "CH_Mayor_Font_3D2D_45", 600 )
					end
					
					-- Draw info
					draw.SimpleText( ply_name, "CH_Mayor_Font_3D2D_60", x_pos + 200, y_pos + 40, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
					draw.SimpleText( ply_job, "CH_Mayor_Font_3D2D_50", x_pos + 200, y_pos + 82.5, job_clr, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
					draw.DrawText( wanted_reason, "CH_Mayor_Font_3D2D_45", x_pos + 200, y_pos + 100, CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT )
					
					-- More Info button
					surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
					surface.DrawRect( x_pos + 580, y_pos + 20, 230, 75 )
					
					draw.SimpleText( CH_Mayor.LangString( "More Info" ), "CH_Mayor_Font_3D2D_50", x_pos + 617.5, y_pos + 53, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
					
					local hovering = imgui.IsHovering( x_pos + 580, y_pos + 20, 230, 75 )
					
					if hovering and pressing and IsValid( target ) then
						surface.PlaySound( "buttons/lightswitch2.wav" )
						
						self:SCREEN_ShowWantedPlayer( target )
					elseif hovering then
						surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
						surface.DrawRect( x_pos + 580, y_pos + 20, 2, 75 )
						surface.DrawRect( x_pos + 808, y_pos + 20, 2, 75 )
						surface.DrawRect( x_pos + 580, y_pos + 20, 230, 2 )
						surface.DrawRect( x_pos + 580, y_pos + 93, 230, 2 )
					else
						surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
						surface.DrawRect( x_pos + 580, y_pos + 20, 2, 10 )
						surface.DrawRect( x_pos + 580, y_pos + 20, 10, 2 )
						surface.DrawRect( x_pos + 580, y_pos + 85, 2, 10 )
						surface.DrawRect( x_pos + 580, y_pos + 93, 10, 2 )
						surface.DrawRect( x_pos + 808, y_pos + 20, 2, 10 )
						surface.DrawRect( x_pos + 800, y_pos + 20, 10, 2 )
						surface.DrawRect( x_pos + 808, y_pos + 85, 2, 10 )
						surface.DrawRect( x_pos + 800, y_pos + 93, 10, 2 )
					end
				end
				
				-- Change pages
				-- Left Page Button
				if self.PAGES_CurrentPage > 1 then
					local hovering = imgui.IsHovering( 50, 890, 80, 80 )
					
					surface.SetDrawColor( not hovering and color_white or CH_Mayor.Colors.GMSBlue )
					surface.SetMaterial( mat_page_back )
					surface.DrawTexturedRect( 50, 890, 80, 80 )
					
					if hovering and pressing then
						surface.PlaySound( "buttons/lightswitch2.wav" )
						
						self.PAGES_CurrentPage = self.PAGES_CurrentPage - 1
					end
				end
				
				-- Right Page Button
				if self.PAGES_AmountOfPages > self.PAGES_CurrentPage then
					local hovering = imgui.IsHovering( 1660, 890, 80, 80 )
					
					surface.SetDrawColor( not hovering and color_white or CH_Mayor.Colors.GMSBlue )
					surface.SetMaterial( mat_page_next )
					surface.DrawTexturedRect( 1660, 890, 80, 80 )
					
					if hovering and pressing then
						surface.PlaySound( "buttons/lightswitch2.wav" )
						
						self.PAGES_CurrentPage = self.PAGES_CurrentPage + 1
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
function ENT:SCREEN_Refresh()
	self.Draw3D2DPage = function()
		if imgui.Entity3D2D( self, pos, ang, scale ) then
			-- Draw spinning loading icon
			surface.SetDrawColor( color_white )
			surface.SetMaterial( mat_loading )
			surface.DrawTexturedRectRotated( sw / 2, 500, 256, 256, CurTime() * -75 )
			
			draw.SimpleText( CH_Mayor.LangString( "Refreshing page" ), "CH_Mayor_Font_3D2D_70", sw / 2, 700, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			
			imgui.End3D2D()
		end
	end
	
	timer.Simple( 1, function()
		if IsValid( self ) then
			self:SCREEN_WantedPlayers()
		end
	end )
end

--[[
	Initial screen when an ATM is not in use
--]]
function ENT:SCREEN_ShowWantedPlayer( target )
	local ply = LocalPlayer()

	self.Draw3D2DPage = function()
		if imgui.Entity3D2D( self, pos, ang, scale ) then
			local pressing = imgui.IsPressing()
		
			-- Player model
			surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
			surface.DrawRect( 50, 190, 700, 750 )
			
			self.GUI_BigPlayerModel:PaintManual()
			self.GUI_BigPlayerModel:SetPos( 70, 210 )
			self.GUI_BigPlayerModel:SetModel( target:GetModel(), target:GetSkin() )
			
			-- Name
			surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
			surface.DrawRect( 790, 190, 950, 750 )
			
			local ply_name = ""
			local wanted_reason = ""
			local ply_job = ""
			local job_clr = color_white
			
			if IsValid( target ) and target:isWanted() then
				ply_name = target:Nick()
				wanted_reason = DarkRP.textWrap( CH_Mayor.LangString( "Reason" ) ..": ".. target:getWantedReason(), "CH_Mayor_Font_3D2D_60", 850 )
				ply_job = team.GetName( target:Team() )
				job_clr = team.GetColor( target:Team() )
			else
				ply_name = CH_Mayor.LangString( "Disconnected Player" )
				wanted_reason = CH_Mayor.LangString( "Reason" ) ..": ".. CH_Mayor.LangString( "Expired" )
				ply_job = "N/A"
				job_clr = color_white
			end
			
			-- Draw info
			draw.SimpleText( ply_name, "CH_Mayor_Font_3D2D_80", 1270, 230, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			draw.SimpleText( ply_job, "CH_Mayor_Font_3D2D_60", 1270, 290, job_clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			draw.DrawText( wanted_reason, "CH_Mayor_Font_3D2D_60", 840, 320, CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT )
			
			-- Back button
			local hovering = imgui.IsHovering( 1635, 845, 80, 80 )
			
			surface.SetDrawColor( not hovering and color_white or CH_Mayor.Colors.GMSBlue )
			surface.SetMaterial( CH_Mayor.Materials.BackIconBig )
			surface.DrawTexturedRect( 1635, 845, 80, 80 )
				
			if hovering and pressing then
				surface.PlaySound( "buttons/lightswitch2.wav" )
				
				-- Show screen
				self:SCREEN_Refresh()
				
				-- Reset page
				self.PAGES_CurrentPage = 1
			end
			
			
			-- Draw curser
			imgui.xCursor( 0, 0, sw, sh )
			
			imgui.End3D2D()
		end
	end
end
