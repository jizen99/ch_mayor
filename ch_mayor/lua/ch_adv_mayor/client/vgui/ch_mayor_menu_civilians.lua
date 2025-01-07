--[[
	MAYOR CIVILIANS MENU
--]]
function CH_Mayor.CiviliansMenu()
	local ply = LocalPlayer()

	local GUI_CiviliansFrame = vgui.Create( "DFrame" )
	GUI_CiviliansFrame:SetTitle( "" )
	GUI_CiviliansFrame:SetSize( CH_Mayor.ScrW * 0.6, CH_Mayor.ScrH * 0.665 )
	GUI_CiviliansFrame:Center()
	GUI_CiviliansFrame.Paint = function( self, w, h )
		-- Draw frame
		surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
		surface.DrawRect( 0, 0, w, h )
		
		-- Draw top
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h * 0.059 )
		
		-- Draw the top title.
		draw.SimpleText( CH_Mayor.LangString( "City Management" ), "CH_Mayor_Font_Size10", w / 2, h * 0.03, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
		-- Draw titles
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( w * 0.182, h * 0.0724, w * 0.812, h * 0.06 )
		
		draw.SimpleText( "#", "CH_Mayor_Font_Size10", w * 0.2, h * 0.1, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
		draw.SimpleText( CH_Mayor.LangString( "Citizen" ), "CH_Mayor_Font_Size10", w * 0.375, h * 0.1, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
		draw.SimpleText( CH_Mayor.LangString( "Job" ), "CH_Mayor_Font_Size10", w * 0.55, h * 0.1, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
		draw.SimpleText( CH_Mayor.LangString( "Action" ), "CH_Mayor_Font_Size10", w * 0.725, h * 0.1, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
		draw.SimpleText( CH_Mayor.LangString( "Action" ), "CH_Mayor_Font_Size10", w * 0.9, h * 0.1, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	GUI_CiviliansFrame:MakePopup()
	GUI_CiviliansFrame:SetDraggable( false )
	GUI_CiviliansFrame:ShowCloseButton( false )
	
	local GUI_CloseMenu = vgui.Create( "DButton", GUI_CiviliansFrame )
	GUI_CloseMenu:SetPos( CH_Mayor.ScrW * 0.582, CH_Mayor.ScrH * 0.01 )
	GUI_CloseMenu:SetSize( CH_Mayor.ScrW * 0.0125, CH_Mayor.ScrH * 0.02223 )
	GUI_CloseMenu:SetText( "" )
	GUI_CloseMenu.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.Red or color_white )
		surface.SetMaterial( CH_Mayor.Materials.CloseIcon )
		surface.DrawTexturedRect( 0, 0, CH_Mayor.ScrW * 0.0125, CH_Mayor.ScrH * 0.02223 )
	end
	GUI_CloseMenu.DoClick = function()
		GUI_CiviliansFrame:Remove()
	end
	
	local GUI_DashboardFrameBtn = vgui.Create( "DButton", GUI_CiviliansFrame )
	GUI_DashboardFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_DashboardFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.0475 )
	GUI_DashboardFrameBtn:SetText( "" )
	GUI_DashboardFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Dashboard )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Dashboard" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, self:IsHovered() and color_white or CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_DashboardFrameBtn.DoClick = function()
		GUI_CiviliansFrame:Remove()
		
		CH_Mayor.DashboardMenu()
	end

	local GUI_UpgradesFrameBtn = vgui.Create( "DButton", GUI_CiviliansFrame )
	GUI_UpgradesFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_UpgradesFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.095 )
	GUI_UpgradesFrameBtn:SetText( "" )
	GUI_UpgradesFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Upgrades )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Upgrades" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, self:IsHovered() and color_white or CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_UpgradesFrameBtn.DoClick = function()
		GUI_CiviliansFrame:Remove()
		
		CH_Mayor.UpgradesMenu()
	end
	
	local GUI_TaxesFrameBtn = vgui.Create( "DButton", GUI_CiviliansFrame )
	GUI_TaxesFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_TaxesFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.1425 )
	GUI_TaxesFrameBtn:SetText( "" )
	GUI_TaxesFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Taxes )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Taxes" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, self:IsHovered() and color_white or CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_TaxesFrameBtn.DoClick = function()
		GUI_CiviliansFrame:Remove()
		
		CH_Mayor.TaxesMenu()
	end

	local GUI_CatalogFrameBtn = vgui.Create( "DButton", GUI_CiviliansFrame )
	GUI_CatalogFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_CatalogFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.19 )
	GUI_CatalogFrameBtn:SetText( "" )
	GUI_CatalogFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Catalog )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Catalog" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, self:IsHovered() and color_white or CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_CatalogFrameBtn.DoClick = function()
		GUI_CiviliansFrame:Remove()
		
		CH_Mayor.CatalogMenu()
	end
	
	local GUI_LawsFrameBtn = vgui.Create( "DButton", GUI_CiviliansFrame )
	GUI_LawsFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_LawsFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.2375 )
	GUI_LawsFrameBtn:SetText( "" )
	GUI_LawsFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Laws )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Laws" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, self:IsHovered() and color_white or CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_LawsFrameBtn.DoClick = function()
		GUI_CiviliansFrame:Remove()
		
		CH_Mayor.LawsMenu()
	end
	
	local GUI_CiviliansFrameBtn = vgui.Create( "DButton", GUI_CiviliansFrame )
	GUI_CiviliansFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_CiviliansFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.285 )
	GUI_CiviliansFrameBtn:SetText( "" )
	GUI_CiviliansFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Licenses )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Licenses" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, self:IsHovered() and color_white or CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_CiviliansFrameBtn.DoClick = function()
		GUI_CiviliansFrame:Remove()
		
		CH_Mayor.LicensesMenu( )
	end
	
	local GUI_OfficialsManagementFrameBtn = vgui.Create( "DButton", GUI_CiviliansFrame )
	GUI_OfficialsManagementFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_OfficialsManagementFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.3325 )
	GUI_OfficialsManagementFrameBtn:SetText( "" )
	GUI_OfficialsManagementFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_OfficialsManagement )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Officials" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, self:IsHovered() and color_white or CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_OfficialsManagementFrameBtn.DoClick = function()
		GUI_CiviliansFrame:Remove()
		
		CH_Mayor.OfficialsMenu()
	end
	
	local GUI_CiviliansManagementFrameBtn = vgui.Create( "DButton", GUI_CiviliansFrame )
	GUI_CiviliansManagementFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_CiviliansManagementFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.38 )
	GUI_CiviliansManagementFrameBtn:SetText( "" )
	GUI_CiviliansManagementFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
		surface.DrawRect( 0, 0, 2, h )
		
		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_CivilianManagement )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Civilians" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_CiviliansManagementFrameBtn.DoClick = function()
		GUI_CiviliansFrame:Remove()
		
		CH_Mayor.CiviliansMenu()
	end
	
	local GUI_WantedFrameBtn = vgui.Create( "DButton", GUI_CiviliansFrame )
	GUI_WantedFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_WantedFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.4275 )
	GUI_WantedFrameBtn:SetText( "" )
	GUI_WantedFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Wanted )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Wanted" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, self:IsHovered() and color_white or CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_WantedFrameBtn.DoClick = function()
		GUI_CiviliansFrame:Remove()
		
		CH_Mayor.WantedMenu()
	end
	
	local GUI_WarrantFrameBtn = vgui.Create( "DButton", GUI_CiviliansFrame )
	GUI_WarrantFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_WarrantFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.475 )
	GUI_WarrantFrameBtn:SetText( "" )
	GUI_WarrantFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Warrant )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Warrant" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, self:IsHovered() and color_white or CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_WarrantFrameBtn.DoClick = function()
		GUI_CiviliansFrame:Remove()
		
		CH_Mayor.WarrantMenu()
	end
	
	local GUI_AnnouncementFrameBtn = vgui.Create( "DButton", GUI_CiviliansFrame )
	GUI_AnnouncementFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_AnnouncementFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.5225 )
	GUI_AnnouncementFrameBtn:SetText( "" )
	GUI_AnnouncementFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Announcement )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Announcement" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, self:IsHovered() and color_white or CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_AnnouncementFrameBtn.DoClick = function()
		GUI_CiviliansFrame:Remove()
		
		CH_Mayor.AnnouncementMenu()
	end
	
	local GUI_LockdownFrameBtn = vgui.Create( "DButton", GUI_CiviliansFrame )
	GUI_LockdownFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_LockdownFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.57 )
	GUI_LockdownFrameBtn:SetText( "" )
	GUI_LockdownFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Lockdown )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Lockdown" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, self:IsHovered() and color_white or CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_LockdownFrameBtn.DoClick = function()
		GUI_CiviliansFrame:Remove()
		
		CH_Mayor.LockdownMenu()
	end
	
	local GUI_StatsFrameBtn = vgui.Create( "DButton", GUI_CiviliansFrame )
	GUI_StatsFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_StatsFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.6175 )
	GUI_StatsFrameBtn:SetText( "" )
	GUI_StatsFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Economy )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Statistics" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, self:IsHovered() and color_white or CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_StatsFrameBtn.DoClick = function()
		GUI_CiviliansFrame:Remove()
		
		CH_Mayor.StatisticsMenu()
	end
	
	-- The list of players
	local total_players = player.GetCount()
	local civilian_players = {}
	
	for k, v in ipairs( player.GetAll() ) do
		if not v:CH_Mayor_IsGovTeam() and ply != v then
			table.insert( civilian_players, v )
		end
	end
	
	local GUI_PlayerList = vgui.Create( "DPanelList", GUI_CiviliansFrame )
	GUI_PlayerList:SetSize( CH_Mayor.ScrW * 0.491, CH_Mayor.ScrH * 0.563 )
	GUI_PlayerList:SetPos( CH_Mayor.ScrW * 0.109, CH_Mayor.ScrH * 0.095 )
	GUI_PlayerList:EnableVerticalScrollbar( true )
	GUI_PlayerList:EnableHorizontal( true )
	GUI_PlayerList:SetSpacing( 8.4 )
	GUI_PlayerList.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, color_transparent )
	end
	if ( GUI_PlayerList.VBar ) then
		GUI_PlayerList.VBar.Paint = function( self, w, h ) -- BG
			surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
			surface.DrawRect( 0, 0, 7, h )
		end
		
		GUI_PlayerList.VBar.btnUp.Paint = function( self, w, h )
			surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
			surface.DrawRect( 0, 0, 7, h )
		end
		
		GUI_PlayerList.VBar.btnGrip.Paint = function( self, w, h )
			surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
			surface.DrawRect( 0, 0, 7, h )
		end
		
		GUI_PlayerList.VBar.btnDown.Paint = function( self, w, h )
			surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
			surface.DrawRect( 0, 0, 7, h )
		end
	end
	
	for k, v in ipairs( civilian_players ) do
		local GUI_PlayerPanel = vgui.Create( "DPanelList" )
		GUI_PlayerPanel:SetSize( CH_Mayor.ScrW * 0.487, CH_Mayor.ScrH * 0.04 )
		GUI_PlayerPanel.Paint = function( self, w, h )
			-- Background
			surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
			if total_players <= 13 then
				surface.DrawRect( 0, 0, w, h )
			else
				surface.DrawRect( 0, 0, w * 0.986, h )
			end
			
			-- Number
			draw.SimpleText( k, "CH_Mayor_Font_Size8", w * 0.0225, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			
			-- Name
			draw.SimpleText( v:Nick(), "CH_Mayor_Font_Size8", w * 0.241, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			
			-- Job
			draw.SimpleText( team.GetName( v:Team() ), "CH_Mayor_Font_Size8", w * 0.455, h / 2, team.GetColor( v:Team() ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
		
		if not v:isWanted() then
			local GUI_WantedPlayerBtn = vgui.Create( "DButton", GUI_PlayerPanel )
			GUI_WantedPlayerBtn:SetSize( CH_Mayor.ScrW * 0.05, CH_Mayor.ScrH * 0.03 )
			GUI_WantedPlayerBtn:SetPos( CH_Mayor.ScrW * 0.3025, CH_Mayor.ScrH * 0.005 )
			GUI_WantedPlayerBtn:SetText( "" )
			GUI_WantedPlayerBtn.Paint = function( self, w, h )
				if self:IsHovered() then
					surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
					surface.DrawRect( 0, 0, w, h )
					
					surface.SetDrawColor( CH_Mayor.Colors.Red )
					surface.DrawRect( 0, 0, w, 1 )
					surface.DrawRect( 0, h-1, w, 1 )
					surface.DrawRect( w-1, 0, 1, h )
					surface.DrawRect( 0, 0, 1, h )
				else
					surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
					surface.DrawRect( 0, 0, w, h )
					
					surface.SetDrawColor( CH_Mayor.Colors.Red )
					surface.DrawRect( 0, 0, 1, 10 )
					surface.DrawRect( 0, 0, 10, 1 )
					surface.DrawRect( 0, h-10, 1, 10 )
					surface.DrawRect( 0, h-1, 10, 1 )
					surface.DrawRect( w-1, 0, 1, 10 )
					surface.DrawRect( w-10, 0, 10, 1 )
					surface.DrawRect( w-1, h-10, 1, 10 )
					surface.DrawRect( w-10, h-1, 10, 1 )
				end

				draw.SimpleText( CH_Mayor.LangString( "Wanted" ), "CH_Mayor_Font_Size8", w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			end
			GUI_WantedPlayerBtn.DoClick = function()
				CH_Mayor.WantedPlayerMenu( v )
				
				GUI_CiviliansFrame:Remove()
			end
		end
		
		if not CH_Mayor.WarrantedPlayers[ v ] then
			local GUI_WarrantPlayerBtn = vgui.Create( "DButton", GUI_PlayerPanel )
			GUI_WarrantPlayerBtn:SetSize( CH_Mayor.ScrW * 0.05, CH_Mayor.ScrH * 0.03 )
			GUI_WarrantPlayerBtn:SetPos( CH_Mayor.ScrW * 0.408, CH_Mayor.ScrH * 0.005 )
			GUI_WarrantPlayerBtn:SetText( "" )
			GUI_WarrantPlayerBtn.Paint = function( self, w, h )
				if self:IsHovered() then
					surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
					surface.DrawRect( 0, 0, w, h )
					
					surface.SetDrawColor( CH_Mayor.Colors.Red )
					surface.DrawRect( 0, 0, w, 1 )
					surface.DrawRect( 0, h-1, w, 1 )
					surface.DrawRect( w-1, 0, 1, h )
					surface.DrawRect( 0, 0, 1, h )
				else
					surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
					surface.DrawRect( 0, 0, w, h )
					
					surface.SetDrawColor( CH_Mayor.Colors.Red )
					surface.DrawRect( 0, 0, 1, 10 )
					surface.DrawRect( 0, 0, 10, 1 )
					surface.DrawRect( 0, h-10, 1, 10 )
					surface.DrawRect( 0, h-1, 10, 1 )
					surface.DrawRect( w-1, 0, 1, 10 )
					surface.DrawRect( w-10, 0, 10, 1 )
					surface.DrawRect( w-1, h-10, 1, 10 )
					surface.DrawRect( w-10, h-1, 10, 1 )
				end

				draw.SimpleText( CH_Mayor.LangString( "Warrant" ), "CH_Mayor_Font_Size8", w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			end
			GUI_WarrantPlayerBtn.DoClick = function()
				CH_Mayor.WarrantPlayerMenu( v )
				
				GUI_CiviliansFrame:Remove()
			end
		end
		
		GUI_PlayerList:AddItem( GUI_PlayerPanel )
	end
end



--[[
	MAKE WANTED MENU
--]]
function CH_Mayor.WantedPlayerMenu( target )
	local ply = LocalPlayer()

	local GUI_MakePlayerWantedFrame = vgui.Create( "DFrame" )
	GUI_MakePlayerWantedFrame:SetTitle( "" )
	GUI_MakePlayerWantedFrame:SetSize( CH_Mayor.ScrW * 0.23, CH_Mayor.ScrH * 0.25 )
	GUI_MakePlayerWantedFrame:Center()
	GUI_MakePlayerWantedFrame.Paint = function( self, w, h )
		-- Draw frame
		surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
		surface.DrawRect( 0, 0, w, h )
		
		-- Draw top
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, CH_Mayor.ScrH * 0.032 )

		-- Draw the top title.
		draw.SimpleText( CH_Mayor.LangString( "Wanted Player" ), "CH_Mayor_Font_Size9", w / 2, CH_Mayor.ScrH * 0.015, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
		-- Criminal name
		draw.SimpleText( target:Nick(), "CH_Mayor_Font_Size12", CH_Mayor.ScrW * 0.04, CH_Mayor.ScrH * 0.055, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		
		draw.SimpleText( team.GetName( target:Team() ), "CH_Mayor_Font_Size8", CH_Mayor.ScrW * 0.04, CH_Mayor.ScrH * 0.078, team.GetColor( target:Team() ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		
		-- Wanted time entry BG
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.102, CH_Mayor.ScrW * 0.221, CH_Mayor.ScrH * 0.04 )
		
		-- Wanted reason entry BG
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.151, CH_Mayor.ScrW * 0.221, CH_Mayor.ScrH * 0.04 )

	end
	GUI_MakePlayerWantedFrame:MakePopup()
	GUI_MakePlayerWantedFrame:SetDraggable( false )
	GUI_MakePlayerWantedFrame:ShowCloseButton( false )
	
	local GUI_CloseMenu = vgui.Create( "DButton", GUI_MakePlayerWantedFrame )
	GUI_CloseMenu:SetPos( CH_Mayor.ScrW * 0.2175, CH_Mayor.ScrH * 0.0085 )
	GUI_CloseMenu:SetSize( 16, 16 )
	GUI_CloseMenu:SetText( "" )
	GUI_CloseMenu.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.Red or color_white )
		surface.SetMaterial( CH_Mayor.Materials.CloseIcon )
		surface.DrawTexturedRect( 0, 0, 16, 16 )
	end
	GUI_CloseMenu.DoClick = function()
		GUI_MakePlayerWantedFrame:Remove()
	end
	
	local GUI_GoBack = vgui.Create( "DButton", GUI_MakePlayerWantedFrame )
	GUI_GoBack:SetPos( CH_Mayor.ScrW * 0.205, CH_Mayor.ScrH * 0.0085 )
	GUI_GoBack:SetSize( 16, 16 )
	GUI_GoBack:SetText( "" )
	GUI_GoBack.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or color_white )
		surface.SetMaterial( CH_Mayor.Materials.BackIcon )
		surface.DrawTexturedRect( 0, 0, 16, 16 )
	end
	GUI_GoBack.DoClick = function()
		CH_Mayor.CiviliansMenu()
		
		GUI_MakePlayerWantedFrame:Remove()
	end
	
	local GUI_TeamModelSpawnI = vgui.Create( "SpawnIcon", GUI_MakePlayerWantedFrame )
	GUI_TeamModelSpawnI:SetSize( CH_Mayor.ScrW * 0.03, CH_Mayor.ScrH * 0.051 )
	GUI_TeamModelSpawnI:SetPos( CH_Mayor.ScrW * 0.0055, CH_Mayor.ScrH * 0.04 )
	GUI_TeamModelSpawnI:SetModel( target:GetModel(), target:GetSkin() )
	GUI_TeamModelSpawnI:SetVisible( true )
	GUI_TeamModelSpawnI.PaintOver = function( self )
		EndTooltip( self )
	end
	GUI_TeamModelSpawnI.OnMousePressed = function()
		return
	end
	
	local GUI_WantedTimeField = vgui.Create( "DTextEntry", GUI_MakePlayerWantedFrame )
	GUI_WantedTimeField:RequestFocus()
	GUI_WantedTimeField:SetPos( CH_Mayor.ScrW * 0.008, CH_Mayor.ScrH * 0.106 )
	GUI_WantedTimeField:SetSize( CH_Mayor.ScrW * 0.216, CH_Mayor.ScrH * 0.03 )
	GUI_WantedTimeField:SetFont( "CH_Mayor_Font_Size9" )
	GUI_WantedTimeField:SetTextColor( color_white )
	GUI_WantedTimeField:SetValue( 30 )
	GUI_WantedTimeField:SetAllowNonAsciiCharacters( false ) -- When allowing non-ASCII characters, a small box appears inside the text entry, indicating your keyboard's current language.  That makes the user unable to input some letters from German, French, Swedish, etc. alphabet. 
	GUI_WantedTimeField:SetMultiline( false )
	GUI_WantedTimeField:SetNumeric( true )
	GUI_WantedTimeField:SetDrawBackground( false )
	
	local GUI_WantedReasonField = vgui.Create( "DTextEntry", GUI_MakePlayerWantedFrame )
	GUI_WantedReasonField:RequestFocus()
	GUI_WantedReasonField:SetPos( CH_Mayor.ScrW * 0.008, CH_Mayor.ScrH * 0.155 )
	GUI_WantedReasonField:SetSize( CH_Mayor.ScrW * 0.216, CH_Mayor.ScrH * 0.03 )
	GUI_WantedReasonField:SetFont( "CH_Mayor_Font_Size9" )
	GUI_WantedReasonField:SetTextColor( color_white )
	GUI_WantedReasonField:SetPlaceholderText( CH_Mayor.LangString( "Enter reason" ) )
	GUI_WantedReasonField:SetAllowNonAsciiCharacters( false ) -- When allowing non-ASCII characters, a small box appears inside the text entry, indicating your keyboard's current language.  That makes the user unable to input some letters from German, French, Swedish, etc. alphabet. 
	GUI_WantedReasonField:SetMultiline( false )
	GUI_WantedReasonField:SetNumeric( false )
	GUI_WantedReasonField:SetDrawBackground( false )
	
	local GUI_MakeWantedBtn = vgui.Create( "DButton", GUI_MakePlayerWantedFrame )
	GUI_MakeWantedBtn:SetSize( CH_Mayor.ScrW * 0.221, CH_Mayor.ScrH * 0.04 )
	GUI_MakeWantedBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.2 )
	GUI_MakeWantedBtn:SetText( "" )
	GUI_MakeWantedBtn.Paint = function( self, w, h )
		if self:IsHovered() then
			surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
			surface.DrawRect( 0, 0, w, h )
		
			surface.SetDrawColor( CH_Mayor.Colors.Red )
			surface.DrawRect( 0, 0, w, 1 )
			surface.DrawRect( 0, h-1, w, 1 )
			surface.DrawRect( w-1, 0, 1, h )
			surface.DrawRect( 0, 0, 1, h )
		else
			surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
			surface.DrawRect( 0, 0, w, h )
			
			surface.SetDrawColor( CH_Mayor.Colors.Red )
			surface.DrawRect( 0, 0, 1, 10 )
			surface.DrawRect( 0, 0, 10, 1 )
			surface.DrawRect( 0, h-10, 1, 10 )
			surface.DrawRect( 0, h-1, 10, 1 )
			surface.DrawRect( w-1, 0, 1, 10 )
			surface.DrawRect( w-10, 0, 10, 1 )
			surface.DrawRect( w-1, h-10, 1, 10 )
			surface.DrawRect( w-10, h-1, 10, 1 )
		end
		
		draw.SimpleText( CH_Mayor.LangString( "Make Wanted" ), "CH_Mayor_Font_Size9", w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	GUI_MakeWantedBtn.DoClick = function()
		local reason = tostring( GUI_WantedReasonField:GetValue() )
		local time = tonumber( GUI_WantedTimeField:GetValue() )
		
		if not reason or string.len( reason ) < 1 then
			ply:ChatPrint( "You must supply a reason" )
			
			surface.PlaySound( "common/wpn_denyselect.wav" )
			return
		end
		
		if time <= 0 then
			ply:ChatPrint( "You must supply a time" )
			
			surface.PlaySound( "common/wpn_denyselect.wav" )
			return
		end
		
		net.Start( "CH_Mayor_Net_WantedPlayer" )
			net.WriteEntity( target )
			net.WriteString( reason )
			net.WriteUInt( time, 8 )
		net.SendToServer()
		
		GUI_MakePlayerWantedFrame:Remove()
	end
end



--[[
	SEARCH WARRANT MENU
--]]
function CH_Mayor.WarrantPlayerMenu( target )
	local ply = LocalPlayer()

	local GUI_SearchWarrantPlayerFrame = vgui.Create( "DFrame" )
	GUI_SearchWarrantPlayerFrame:SetTitle( "" )
	GUI_SearchWarrantPlayerFrame:SetSize( CH_Mayor.ScrW * 0.23, CH_Mayor.ScrH * 0.2 )
	GUI_SearchWarrantPlayerFrame:Center()
	GUI_SearchWarrantPlayerFrame.Paint = function( self, w, h )
		-- Draw frame
		surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
		surface.DrawRect( 0, 0, w, h )
		
		-- Draw top
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, CH_Mayor.ScrH * 0.032 )

		-- Draw the top title.
		draw.SimpleText( CH_Mayor.LangString( "Warrant Player" ), "CH_Mayor_Font_Size9", w / 2, CH_Mayor.ScrH * 0.015, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
		-- Criminal name
		draw.SimpleText( target:Nick(), "CH_Mayor_Font_Size12", CH_Mayor.ScrW * 0.04, CH_Mayor.ScrH * 0.055, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		
		draw.SimpleText( team.GetName( target:Team() ), "CH_Mayor_Font_Size8", CH_Mayor.ScrW * 0.04, CH_Mayor.ScrH * 0.078, team.GetColor( target:Team() ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

		-- Warrant reason entry BG
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.1, CH_Mayor.ScrW * 0.221, CH_Mayor.ScrH * 0.04 )

	end
	GUI_SearchWarrantPlayerFrame:MakePopup()
	GUI_SearchWarrantPlayerFrame:SetDraggable( false )
	GUI_SearchWarrantPlayerFrame:ShowCloseButton( false )
	
	local GUI_CloseMenu = vgui.Create( "DButton", GUI_SearchWarrantPlayerFrame )
	GUI_CloseMenu:SetPos( CH_Mayor.ScrW * 0.2175, CH_Mayor.ScrH * 0.0085 )
	GUI_CloseMenu:SetSize( 16, 16 )
	GUI_CloseMenu:SetText( "" )
	GUI_CloseMenu.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.Red or color_white )
		surface.SetMaterial( CH_Mayor.Materials.CloseIcon )
		surface.DrawTexturedRect( 0, 0, 16, 16 )
	end
	GUI_CloseMenu.DoClick = function()
		GUI_SearchWarrantPlayerFrame:Remove()
	end
	
	local GUI_GoBack = vgui.Create( "DButton", GUI_SearchWarrantPlayerFrame )
	GUI_GoBack:SetPos( CH_Mayor.ScrW * 0.205, CH_Mayor.ScrH * 0.0085 )
	GUI_GoBack:SetSize( 16, 16 )
	GUI_GoBack:SetText( "" )
	GUI_GoBack.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or color_white )
		surface.SetMaterial( CH_Mayor.Materials.BackIcon )
		surface.DrawTexturedRect( 0, 0, 16, 16 )
	end
	GUI_GoBack.DoClick = function()
		CH_Mayor.CiviliansMenu()
		
		GUI_SearchWarrantPlayerFrame:Remove()
	end
	
	local GUI_TeamModelSpawnI = vgui.Create( "SpawnIcon", GUI_SearchWarrantPlayerFrame )
	GUI_TeamModelSpawnI:SetSize( CH_Mayor.ScrW * 0.03, CH_Mayor.ScrH * 0.051 )
	GUI_TeamModelSpawnI:SetPos( CH_Mayor.ScrW * 0.0055, CH_Mayor.ScrH * 0.04 )
	GUI_TeamModelSpawnI:SetModel( target:GetModel(), target:GetSkin() )
	GUI_TeamModelSpawnI:SetVisible( true )
	GUI_TeamModelSpawnI.PaintOver = function( self )
		EndTooltip( self )
	end
	GUI_TeamModelSpawnI.OnMousePressed = function()
		return
	end
	
	local GUI_WarrantReasonField = vgui.Create( "DTextEntry", GUI_SearchWarrantPlayerFrame )
	GUI_WarrantReasonField:RequestFocus()
	GUI_WarrantReasonField:SetPos( CH_Mayor.ScrW * 0.008, CH_Mayor.ScrH * 0.104 )
	GUI_WarrantReasonField:SetSize( CH_Mayor.ScrW * 0.216, CH_Mayor.ScrH * 0.03 )
	GUI_WarrantReasonField:SetFont( "CH_Mayor_Font_Size9" )
	GUI_WarrantReasonField:SetTextColor( color_white )
	GUI_WarrantReasonField:SetPlaceholderText( CH_Mayor.LangString( "Enter reason" ) )
	GUI_WarrantReasonField:SetAllowNonAsciiCharacters( false ) -- When allowing non-ASCII characters, a small box appears inside the text entry, indicating your keyboard's current language.  That makes the user unable to input some letters from German, French, Swedish, etc. alphabet. 
	GUI_WarrantReasonField:SetMultiline( false )
	GUI_WarrantReasonField:SetNumeric( false )
	GUI_WarrantReasonField:SetDrawBackground( false )
	
	local GUI_SearchWarrantBtn = vgui.Create( "DButton", GUI_SearchWarrantPlayerFrame )
	GUI_SearchWarrantBtn:SetSize( CH_Mayor.ScrW * 0.221, CH_Mayor.ScrH * 0.04 )
	GUI_SearchWarrantBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.15 )
	GUI_SearchWarrantBtn:SetText( "" )
	GUI_SearchWarrantBtn.Paint = function( self, w, h )
		if self:IsHovered() then
			surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
			surface.DrawRect( 0, 0, w, h )
		
			surface.SetDrawColor( CH_Mayor.Colors.Red )
			surface.DrawRect( 0, 0, w, 1 )
			surface.DrawRect( 0, h-1, w, 1 )
			surface.DrawRect( w-1, 0, 1, h )
			surface.DrawRect( 0, 0, 1, h )
		else
			surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
			surface.DrawRect( 0, 0, w, h )
			
			surface.SetDrawColor( CH_Mayor.Colors.Red )
			surface.DrawRect( 0, 0, 1, 10 )
			surface.DrawRect( 0, 0, 10, 1 )
			surface.DrawRect( 0, h-10, 1, 10 )
			surface.DrawRect( 0, h-1, 10, 1 )
			surface.DrawRect( w-1, 0, 1, 10 )
			surface.DrawRect( w-10, 0, 10, 1 )
			surface.DrawRect( w-1, h-10, 1, 10 )
			surface.DrawRect( w-10, h-1, 10, 1 )
		end
		
		draw.SimpleText( CH_Mayor.LangString( "Search Warrant" ), "CH_Mayor_Font_Size9", w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	GUI_SearchWarrantBtn.DoClick = function()
		local reason = tostring( GUI_WarrantReasonField:GetValue() )

		if not reason or string.len( reason ) < 1 then
			ply:ChatPrint( "You must supply a reason" )
			
			surface.PlaySound( "common/wpn_denyselect.wav" )
			return
		end
		
		net.Start( "CH_Mayor_Net_WarrantPlayer" )
			net.WriteEntity( target )
			net.WriteString( reason )
		net.SendToServer()
		
		GUI_SearchWarrantPlayerFrame:Remove()
	end
end