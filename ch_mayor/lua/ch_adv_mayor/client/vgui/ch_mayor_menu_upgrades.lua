--[[
	UPGRADES MENU
--]]
function CH_Mayor.UpgradesMenu()
	local ply = LocalPlayer()
	
	local GUI_UpgradesFrame = vgui.Create( "DFrame" )
	GUI_UpgradesFrame:SetTitle( "" )
	GUI_UpgradesFrame:SetSize( CH_Mayor.ScrW * 0.6, CH_Mayor.ScrH * 0.665 )
	GUI_UpgradesFrame:Center()
	GUI_UpgradesFrame.Paint = function( self, w, h )
		-- Draw frame
		surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
		surface.DrawRect( 0, 0, w, h )
		
		-- Draw top
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h * 0.059 )
		
		-- Draw the top title.
		draw.SimpleText( CH_Mayor.LangString( "City Management" ), "CH_Mayor_Font_Size10", w / 2, h * 0.03, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	GUI_UpgradesFrame:MakePopup()
	GUI_UpgradesFrame:SetDraggable( false )
	GUI_UpgradesFrame:ShowCloseButton( false )

	local GUI_CloseMenu = vgui.Create( "DButton", GUI_UpgradesFrame )
	GUI_CloseMenu:SetPos( CH_Mayor.ScrW * 0.582, CH_Mayor.ScrH * 0.01 )
	GUI_CloseMenu:SetSize( CH_Mayor.ScrW * 0.0125, CH_Mayor.ScrH * 0.02223 )
	GUI_CloseMenu:SetText( "" )
	GUI_CloseMenu.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.Red or color_white )
		surface.SetMaterial( CH_Mayor.Materials.CloseIcon )
		surface.DrawTexturedRect( 0, 0, CH_Mayor.ScrW * 0.0125, CH_Mayor.ScrH * 0.02223 )
	end
	GUI_CloseMenu.DoClick = function()
		GUI_UpgradesFrame:Remove()
	end
	
	local GUI_DashboardFrameBtn = vgui.Create( "DButton", GUI_UpgradesFrame )
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
		GUI_UpgradesFrame:Remove()
		
		CH_Mayor.DashboardMenu()
	end

	local GUI_UpgradesFrameBtn = vgui.Create( "DButton", GUI_UpgradesFrame )
	GUI_UpgradesFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_UpgradesFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.095 )
	GUI_UpgradesFrameBtn:SetText( "" )
	GUI_UpgradesFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
		surface.DrawRect( 0, 0, 2, h )
		
		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Upgrades )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Upgrades" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_UpgradesFrameBtn.DoClick = function()
		GUI_UpgradesFrame:Remove()
		
		CH_Mayor.UpgradesMenu()
	end
	
	local GUI_TaxesFrameBtn = vgui.Create( "DButton", GUI_UpgradesFrame )
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
		GUI_UpgradesFrame:Remove()
		
		CH_Mayor.TaxesMenu()
	end

	local GUI_UpgradesFrameBtn = vgui.Create( "DButton", GUI_UpgradesFrame )
	GUI_UpgradesFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_UpgradesFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.19 )
	GUI_UpgradesFrameBtn:SetText( "" )
	GUI_UpgradesFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Catalog )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Catalog" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, self:IsHovered() and color_white or CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_UpgradesFrameBtn.DoClick = function()
		GUI_UpgradesFrame:Remove()
		
		CH_Mayor.CatalogMenu()
	end
	
	local GUI_LawsFrameBtn = vgui.Create( "DButton", GUI_UpgradesFrame )
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
		GUI_UpgradesFrame:Remove()
		
		CH_Mayor.LawsMenu()
	end
	
	local GUI_CiviliansFrameBtn = vgui.Create( "DButton", GUI_UpgradesFrame )
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
		GUI_UpgradesFrame:Remove()
		
		CH_Mayor.LicensesMenu( )
	end
	
	local GUI_OfficialsManagementFrameBtn = vgui.Create( "DButton", GUI_UpgradesFrame )
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
		GUI_UpgradesFrame:Remove()
		
		CH_Mayor.OfficialsMenu()
	end
	
	local GUI_CiviliansManagementFrameBtn = vgui.Create( "DButton", GUI_UpgradesFrame )
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
		GUI_UpgradesFrame:Remove()
		
		CH_Mayor.CiviliansMenu()
	end
	
	local GUI_WantedFrameBtn = vgui.Create( "DButton", GUI_UpgradesFrame )
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
		GUI_UpgradesFrame:Remove()
		
		CH_Mayor.WantedMenu()
	end
	
	local GUI_WarrantFrameBtn = vgui.Create( "DButton", GUI_UpgradesFrame )
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
		GUI_UpgradesFrame:Remove()
		
		CH_Mayor.WarrantMenu()
	end
	
	local GUI_AnnouncementFrameBtn = vgui.Create( "DButton", GUI_UpgradesFrame )
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
		GUI_UpgradesFrame:Remove()
		
		CH_Mayor.AnnouncementMenu()
	end
	
	local GUI_LockdownFrameBtn = vgui.Create( "DButton", GUI_UpgradesFrame )
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
		GUI_UpgradesFrame:Remove()
		
		CH_Mayor.LockdownMenu()
	end
	
	local GUI_StatsFrameBtn = vgui.Create( "DButton", GUI_UpgradesFrame )
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
		GUI_UpgradesFrame:Remove()
		
		CH_Mayor.StatisticsMenu()
	end
	
	-- The list of upgrades
	local total_items = table.Count( CH_Mayor.Upgrades )
	local mayor_money = CH_Mayor.VaultMoney
	
	local GUI_UpgradesList = vgui.Create( "DPanelList", GUI_UpgradesFrame )
	GUI_UpgradesList:SetSize( CH_Mayor.ScrW * 0.491, CH_Mayor.ScrH * 0.61 )
	GUI_UpgradesList:SetPos( CH_Mayor.ScrW * 0.109, CH_Mayor.ScrH * 0.0475 )
	GUI_UpgradesList:EnableVerticalScrollbar( true )
	GUI_UpgradesList:EnableHorizontal( true )
	GUI_UpgradesList:SetSpacing( 9 )
	GUI_UpgradesList.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, color_transparent )
	end
	if ( GUI_UpgradesList.VBar ) then
		GUI_UpgradesList.VBar.Paint = function( self, w, h ) -- BG
			surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
			surface.DrawRect( 0, 0, 7, h )
		end
		
		GUI_UpgradesList.VBar.btnUp.Paint = function( self, w, h )
			surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
			surface.DrawRect( 0, 0, 7, h )
		end
		
		GUI_UpgradesList.VBar.btnGrip.Paint = function( self, w, h )
			surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
			surface.DrawRect( 0, 0, 7, h )
		end
		
		GUI_UpgradesList.VBar.btnDown.Paint = function( self, w, h )
			surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
			surface.DrawRect( 0, 0, 7, h )
		end
	end
	
	for name, upgrade in pairs( CH_Mayor.Upgrades ) do
		local cur_level = CH_Mayor.UpgradeLevels[ name ]
		local next_level = upgrade.Levels[ math.Clamp( cur_level + 1, 0, upgrade.MaxLevel ) ]

		local GUI_UpgradePanel = vgui.Create( "DPanelList" )
		GUI_UpgradePanel:SetSize( CH_Mayor.ScrW * 0.487, CH_Mayor.ScrH * 0.1351 )
		GUI_UpgradePanel.Paint = function( self, w, h )
			-- Background
			surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
			if total_items <= 4 then
				surface.DrawRect( 0, 0, w, h )
			else
				surface.DrawRect( 0, 0, w * 0.986, h )
			end
			
			-- Name and description
			surface.SetFont( "CH_Mayor_Font_Size14" )
			local upgrade_name = upgrade.Name
			local x, y = surface.GetTextSize( upgrade_name )
			draw.SimpleText( upgrade_name, "CH_Mayor_Font_Size14", w * 0.16, h * 0.185, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			draw.SimpleText( upgrade.Description, "CH_Mayor_Font_Size8", w * 0.16 + ( x + CH_Mayor.ScrW * 0.005 ), h * 0.22, CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			
			-- Upgrade icon
			surface.SetDrawColor( 230, 230, 230 )
			surface.SetMaterial( upgrade.Icon )
			surface.DrawTexturedRect( w * 0.013, h * 0.1, CH_Mayor.ScrW * 0.065, CH_Mayor.ScrH * 0.11 )

			-- Next level text
			surface.SetFont( "CH_Mayor_Font_Size8" )
			local next_level_txt = CH_Mayor.LangString( "Next level" ) ..": "
			local x, y = surface.GetTextSize( next_level_txt )
			draw.SimpleText( next_level_txt, "CH_Mayor_Font_Size8", w * 0.16, h * 0.44, CH_Mayor.Colors.GMSBlue, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			if cur_level < upgrade.MaxLevel then
				draw.SimpleText( next_level.Description, "CH_Mayor_Font_Size8", w * 0.16 + ( x + CH_Mayor.ScrW * 0.001 ), h * 0.44, CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			else
				draw.SimpleText( CH_Mayor.LangString( "This upgrade is maxed out!" ), "CH_Mayor_Font_Size8", w * 0.16 + ( x + CH_Mayor.ScrW * 0.001 ), h * 0.44, CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			end
			
			-- Price
			if cur_level < upgrade.MaxLevel then
				draw.SimpleText( DarkRP.formatMoney( next_level.Price ), "CH_Mayor_Font_Size12", w * 0.972, h * 0.185, mayor_money > next_level.Price and CH_Mayor.Colors.Green or CH_Mayor.Colors.Red, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
			end
			
			-- Upgrade progress bar
			local lenght_per_value = 0.55 / upgrade.MaxLevel
			local bar_lenght = lenght_per_value * cur_level
	
			draw.RoundedBox( 3, w * 0.16, h * 0.63, w * bar_lenght, h * 0.3, cur_level == upgrade.MaxLevel and CH_Mayor.Colors.Green or CH_Mayor.Colors.GMSBlue )
			
			surface.SetDrawColor( color_white )
			surface.SetMaterial( CH_Mayor.Materials.StripesBG )
			surface.DrawTexturedRect( w * 0.16, h * 0.63, w * 0.55, h * 0.3 )
			
			if cur_level == upgrade.MaxLevel then
				draw.SimpleText( CH_Mayor.LangString( "Maximum Level" ), "CH_Mayor_Font_Size10", w * 0.43, h * 0.76, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			else
				draw.SimpleText( CH_Mayor.LangString( "Level" ) .." ".. cur_level .." / ".. upgrade.MaxLevel, "CH_Mayor_Font_Size10", w * 0.43, h * 0.76, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			end
		end
		
		local GUI_PurchaseUpgradeBtn = vgui.Create( "DButton", GUI_UpgradePanel )
		GUI_PurchaseUpgradeBtn:SetSize( CH_Mayor.ScrW * 0.125, CH_Mayor.ScrH * 0.04 )
		GUI_PurchaseUpgradeBtn:SetPos( CH_Mayor.ScrW * 0.35, CH_Mayor.ScrH * 0.085 )
		GUI_PurchaseUpgradeBtn:SetText( "" )
		GUI_PurchaseUpgradeBtn.Paint = function( self, w, h )
			if self:IsHovered() then
				surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
				surface.DrawRect( 0, 0, w, h )
				
				if cur_level == upgrade.MaxLevel then
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
				else
					surface.SetDrawColor( mayor_money > next_level.Price and CH_Mayor.Colors.Green or CH_Mayor.Colors.Red )
				end
				surface.DrawRect( 0, 0, w, 1 )
				surface.DrawRect( 0, h-1, w, 1 )
				surface.DrawRect( w-1, 0, 1, h )
				surface.DrawRect( 0, 0, 1, h )
			else
				surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
				surface.DrawRect( 0, 0, w, h )
				
				if cur_level == upgrade.MaxLevel then
					surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
				else
					surface.SetDrawColor( mayor_money > next_level.Price and CH_Mayor.Colors.Green or CH_Mayor.Colors.Red )
				end
				surface.DrawRect( 0, 0, 1, 10 )
				surface.DrawRect( 0, 0, 10, 1 )
				surface.DrawRect( 0, h-10, 1, 10 )
				surface.DrawRect( 0, h-1, 10, 1 )
				surface.DrawRect( w-1, 0, 1, 10 )
				surface.DrawRect( w-10, 0, 10, 1 )
				surface.DrawRect( w-1, h-10, 1, 10 )
				surface.DrawRect( w-10, h-1, 10, 1 )
			end
			
			if cur_level == upgrade.MaxLevel then
				draw.SimpleText( CH_Mayor.LangString( "Maxed Out" ), "CH_Mayor_Font_Size9", w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			else
				draw.SimpleText( mayor_money > next_level.Price and CH_Mayor.LangString( "Purchase Upgrade" ) or CH_Mayor.LangString( "Cannot Afford" ), "CH_Mayor_Font_Size9", w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			end
		end
		GUI_PurchaseUpgradeBtn.DoClick = function()
			if mayor_money < next_level.Price then
				surface.PlaySound( "common/wpn_denyselect.wav" )
				return
			end
			
			net.Start( "CH_Mayor_Net_BuyUpgrade" )
				net.WriteString( name )
			net.SendToServer()
			
			GUI_UpgradesFrame:Remove()
		end
		
		GUI_UpgradesList:AddItem( GUI_UpgradePanel )
	end
end