--[[
	MAYOR DASHBOARD MENU
--]]
function CH_Mayor.StatisticsMenu()
	local ply = LocalPlayer()

	local GUI_StatisticsFrame = vgui.Create( "DFrame" )
	GUI_StatisticsFrame:SetTitle( "" )
	GUI_StatisticsFrame:SetSize( CH_Mayor.ScrW * 0.6, CH_Mayor.ScrH * 0.665 )
	GUI_StatisticsFrame:Center()
	GUI_StatisticsFrame.Paint = function( self, w, h )
		-- Draw frame
		surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
		surface.DrawRect( 0, 0, w, h )
		
		-- Draw top
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h * 0.059 )
		
		-- Draw the top title.
		draw.SimpleText( CH_Mayor.LangString( "City Management" ), "CH_Mayor_Font_Size10", w / 2, h * 0.03, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	GUI_StatisticsFrame:MakePopup()
	GUI_StatisticsFrame:SetDraggable( false )
	GUI_StatisticsFrame:ShowCloseButton( false )
	
	local GUI_CloseMenu = vgui.Create( "DButton", GUI_StatisticsFrame )
	GUI_CloseMenu:SetPos( CH_Mayor.ScrW * 0.582, CH_Mayor.ScrH * 0.01 )
	GUI_CloseMenu:SetSize( CH_Mayor.ScrW * 0.0125, CH_Mayor.ScrH * 0.02223 )
	GUI_CloseMenu:SetText( "" )
	GUI_CloseMenu.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.Red or color_white )
		surface.SetMaterial( CH_Mayor.Materials.CloseIcon )
		surface.DrawTexturedRect( 0, 0, CH_Mayor.ScrW * 0.0125, CH_Mayor.ScrH * 0.02223 )
	end
	GUI_CloseMenu.DoClick = function()
		GUI_StatisticsFrame:Remove()
	end
	
	local GUI_DashboardFrameBtn = vgui.Create( "DButton", GUI_StatisticsFrame )
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
		GUI_StatisticsFrame:Remove()
		
		CH_Mayor.DashboardMenu()
	end

	local GUI_UpgradesFrameBtn = vgui.Create( "DButton", GUI_StatisticsFrame )
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
		GUI_StatisticsFrame:Remove()
		
		CH_Mayor.UpgradesMenu()
	end
	
	local GUI_TaxesFrameBtn = vgui.Create( "DButton", GUI_StatisticsFrame )
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
		GUI_StatisticsFrame:Remove()
		
		CH_Mayor.TaxesMenu()
	end

	local GUI_CatalogFrameBtn = vgui.Create( "DButton", GUI_StatisticsFrame )
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
		GUI_StatisticsFrame:Remove()
		
		CH_Mayor.CatalogMenu()
	end
	
	local GUI_LawsFrameBtn = vgui.Create( "DButton", GUI_StatisticsFrame )
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
		GUI_StatisticsFrame:Remove()
		
		CH_Mayor.LawsMenu()
	end
	
	local GUI_LicensesFrameBtn = vgui.Create( "DButton", GUI_StatisticsFrame )
	GUI_LicensesFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_LicensesFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.285 )
	GUI_LicensesFrameBtn:SetText( "" )
	GUI_LicensesFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Licenses )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Licenses" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, self:IsHovered() and color_white or CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_LicensesFrameBtn.DoClick = function()
		GUI_StatisticsFrame:Remove()
		
		CH_Mayor.LicensesMenu( )
	end
	
	local GUI_OfficialsManagementFrameBtn = vgui.Create( "DButton", GUI_StatisticsFrame )
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
		GUI_StatisticsFrame:Remove()
		
		CH_Mayor.OfficialsMenu()
	end
	
	local GUI_CiviliansManagementFrameBtn = vgui.Create( "DButton", GUI_StatisticsFrame )
	GUI_CiviliansManagementFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_CiviliansManagementFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.38 )
	GUI_CiviliansManagementFrameBtn:SetText( "" )
	GUI_CiviliansManagementFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_CivilianManagement )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Civilians" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, self:IsHovered() and color_white or CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_CiviliansManagementFrameBtn.DoClick = function()
		GUI_StatisticsFrame:Remove()
		
		CH_Mayor.CiviliansMenu()
	end
	
	local GUI_WantedFrameBtn = vgui.Create( "DButton", GUI_StatisticsFrame )
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
		GUI_StatisticsFrame:Remove()
		
		CH_Mayor.WantedMenu()
	end
	
	local GUI_WarrantFrameBtn = vgui.Create( "DButton", GUI_StatisticsFrame )
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
		GUI_StatisticsFrame:Remove()
		
		CH_Mayor.WarrantMenu()
	end
	
	local GUI_AnnouncementFrameBtn = vgui.Create( "DButton", GUI_StatisticsFrame )
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
		GUI_StatisticsFrame:Remove()
		
		CH_Mayor.AnnouncementMenu()
	end
	
	local GUI_LockdownFrameBtn = vgui.Create( "DButton", GUI_StatisticsFrame )
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
		GUI_StatisticsFrame:Remove()
		
		CH_Mayor.LockdownMenu()
	end
	
	local GUI_StatsFrameBtn = vgui.Create( "DButton", GUI_StatisticsFrame )
	GUI_StatsFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_StatsFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.6175 )
	GUI_StatsFrameBtn:SetText( "" )
	GUI_StatsFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
		surface.DrawRect( 0, 0, 2, h )
		
		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Economy )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Statistics" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_StatsFrameBtn.DoClick = function()
		GUI_StatisticsFrame:Remove()
		
		CH_Mayor.StatisticsMenu()
	end
	
	-- The statistics panel
	local GUI_StatsPanel = vgui.Create( "DPanel", GUI_StatisticsFrame )
	GUI_StatsPanel:SetSize( CH_Mayor.ScrW * 0.487, CH_Mayor.ScrH * 0.6 )
	GUI_StatsPanel:SetPos( CH_Mayor.ScrW * 0.109, CH_Mayor.ScrH * 0.0475 )
	GUI_StatsPanel.Paint = function( self, w, h )
		-- Background
		surface.SetDrawColor( color_transparent )
		surface.DrawRect( 0, 0, w, h )
		
		-- Top box with info
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h * 0.146 )
		
		surface.SetFont( "CH_Mayor_Font_Size14" )
		local welcome_back = CH_Mayor.LangString( "Hey" ) ..", ".. ply:Nick()
		local x, y = surface.GetTextSize( welcome_back )

		draw.SimpleText( welcome_back, "CH_Mayor_Font_Size14", w * 0.01, h * 0.04, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.WavingHand )
		surface.DrawTexturedRect( w * 0.01 + ( x + CH_Mayor.ScrW * 0.005 ), h * 0.0225, 28, 28 )

		draw.SimpleText( CH_Mayor.LangString( "Here are your overall personal mayor statistics." ), "CH_Mayor_Font_Size9", w * 0.01, h * 0.1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		
		-- Make sure stats are loaded
		if not ply.CH_Mayor_Stats then
			return
		end
		
		-- Stat 1
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, CH_Mayor.ScrH * 0.095, w, CH_Mayor.ScrH * 0.04 )

		draw.SimpleText( CH_Mayor.LangString( "Total warrants placed" ), "CH_Mayor_Font_Size10", w * 0.01, h * 0.189, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		draw.SimpleText( string.Comma( ply.CH_Mayor_Stats[ "WarrantsPlaced" ] ) .." ".. CH_Mayor.LangString( "warrants" ), "CH_Mayor_Font_Size10", w * 0.99, h * 0.189, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
		
		-- Stat 2
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, CH_Mayor.ScrH * 0.1425, w, CH_Mayor.ScrH * 0.04 )
		
		draw.SimpleText( CH_Mayor.LangString( "Total players wanted" ), "CH_Mayor_Font_Size10", w * 0.01, h * 0.267, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		draw.SimpleText( string.Comma( ply.CH_Mayor_Stats[ "PlayersWanted" ] ) .." ".. CH_Mayor.LangString( "players" ), "CH_Mayor_Font_Size10", w * 0.99, h * 0.267, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )

		-- Stat 3
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, CH_Mayor.ScrH * 0.19, w, CH_Mayor.ScrH * 0.04 )
		
		draw.SimpleText( CH_Mayor.LangString( "Total times elected as mayor" ), "CH_Mayor_Font_Size10", w * 0.01, h * 0.35, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		draw.SimpleText( string.Comma( ply.CH_Mayor_Stats[ "TimesElected" ] ) .." ".. CH_Mayor.LangString( "times" ), "CH_Mayor_Font_Size10", w * 0.99, h * 0.35, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
		
		-- Stat 4
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, CH_Mayor.ScrH * 0.2375, w, CH_Mayor.ScrH * 0.04 )
		
		draw.SimpleText( CH_Mayor.LangString( "Total successful vault robbies during your period" ), "CH_Mayor_Font_Size10", w * 0.01, h * 0.427, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		draw.SimpleText( string.Comma( ply.CH_Mayor_Stats[ "VaultRobbed" ] ) .." ".. CH_Mayor.LangString( "robberies" ), "CH_Mayor_Font_Size10", w * 0.99, h * 0.427, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
		
		-- Stat 5
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, CH_Mayor.ScrH * 0.285, w, CH_Mayor.ScrH * 0.04 )
		
		draw.SimpleText( CH_Mayor.LangString( "Total playtime as mayor" ), "CH_Mayor_Font_Size10", w * 0.01, h * 0.505, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		draw.SimpleText( CH_Mayor.FormatPlaytime( ply.CH_Mayor_Stats[ "TotalPlaytime" ] ), "CH_Mayor_Font_Size10", w * 0.99, h * 0.505, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
		
		-- Stat 6
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, CH_Mayor.ScrH * 0.3325, w, CH_Mayor.ScrH * 0.04 )
		
		draw.SimpleText( CH_Mayor.LangString( "Total players demoted" ), "CH_Mayor_Font_Size10", w * 0.01, h * 0.585, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		draw.SimpleText( string.Comma( ply.CH_Mayor_Stats[ "PlayersDemoted" ] ) .." ".. CH_Mayor.LangString( "players" ), "CH_Mayor_Font_Size10", w * 0.99, h * 0.585, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
		
		-- Stat 7
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, CH_Mayor.ScrH * 0.38, w, CH_Mayor.ScrH * 0.04 )
		
		draw.SimpleText( CH_Mayor.LangString( "Total players promoted" ), "CH_Mayor_Font_Size10", w * 0.01, h * 0.665, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		draw.SimpleText( string.Comma( ply.CH_Mayor_Stats[ "PlayersPromoted" ] ) .." ".. CH_Mayor.LangString( "players" ), "CH_Mayor_Font_Size10", w * 0.99, h * 0.665, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
		
		-- Stat 8
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, CH_Mayor.ScrH * 0.4275, w, CH_Mayor.ScrH * 0.04 )
		
		draw.SimpleText( CH_Mayor.LangString( "Total capital added to the mayor vault yourself" ), "CH_Mayor_Font_Size10", w * 0.01, h * 0.7425, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		draw.SimpleText( DarkRP.formatMoney( ply.CH_Mayor_Stats[ "CapitalAdded" ] ), "CH_Mayor_Font_Size10", w * 0.99, h * 0.7425, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
		
		-- Stat 8
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, CH_Mayor.ScrH * 0.475, w, CH_Mayor.ScrH * 0.04 )
		
		draw.SimpleText( CH_Mayor.LangString( "Total lockdowns initiated" ), "CH_Mayor_Font_Size10", w * 0.01, h * 0.8225, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		draw.SimpleText( string.Comma( ply.CH_Mayor_Stats[ "LockdownsInitiated" ] ) .." ".. CH_Mayor.LangString( "lockdowns" ), "CH_Mayor_Font_Size10", w * 0.99, h * 0.8225, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
		
		-- Stat 9
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, CH_Mayor.ScrH * 0.5225, w, CH_Mayor.ScrH * 0.04 )
		
		draw.SimpleText( CH_Mayor.LangString( "Total lotteries started" ), "CH_Mayor_Font_Size10", w * 0.01, h * 0.902, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		draw.SimpleText( string.Comma( ply.CH_Mayor_Stats[ "LotteriesStarted" ] ) .." ".. CH_Mayor.LangString( "lotteries" ), "CH_Mayor_Font_Size10", w * 0.99, h * 0.902, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
	end
end