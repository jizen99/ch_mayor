--[[
	MAYOR DASHBOARD MENU
--]]
function CH_Mayor.DashboardMenu()
	local ply = LocalPlayer()

	local GUI_DashboardFrame = vgui.Create( "DFrame" )
	GUI_DashboardFrame:SetTitle( "" )
	GUI_DashboardFrame:SetSize( CH_Mayor.ScrW * 0.6, CH_Mayor.ScrH * 0.665 )
	GUI_DashboardFrame:Center()
	GUI_DashboardFrame.Paint = function( self, w, h )
		-- Draw frame
		surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
		surface.DrawRect( 0, 0, w, h )
		
		-- Draw top
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h * 0.059 )
		
		-- Draw the top title.
		draw.SimpleText( CH_Mayor.LangString( "City Management" ), "CH_Mayor_Font_Size10", w / 2, h * 0.03, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	GUI_DashboardFrame:MakePopup()
	GUI_DashboardFrame:SetDraggable( false )
	GUI_DashboardFrame:ShowCloseButton( false )
	
	local GUI_CloseMenu = vgui.Create( "DButton", GUI_DashboardFrame )
	GUI_CloseMenu:SetPos( CH_Mayor.ScrW * 0.582, CH_Mayor.ScrH * 0.01 )
	GUI_CloseMenu:SetSize( CH_Mayor.ScrW * 0.0125, CH_Mayor.ScrH * 0.02223 )
	GUI_CloseMenu:SetText( "" )
	GUI_CloseMenu.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.Red or color_white )
		surface.SetMaterial( CH_Mayor.Materials.CloseIcon )
		surface.DrawTexturedRect( 0, 0, CH_Mayor.ScrW * 0.0125, CH_Mayor.ScrH * 0.02223 )
	end
	GUI_CloseMenu.DoClick = function()
		GUI_DashboardFrame:Remove()
	end

	local GUI_DashboardFrameBtn = vgui.Create( "DButton", GUI_DashboardFrame )
	GUI_DashboardFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_DashboardFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.0475 )
	GUI_DashboardFrameBtn:SetText( "" )
	GUI_DashboardFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
		surface.DrawRect( 0, 0, 2, h )
		
		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Dashboard )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Dashboard" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_DashboardFrameBtn.DoClick = function()
		GUI_DashboardFrame:Remove()
		
		CH_Mayor.DashboardMenu()
	end

	local GUI_UpgradesFrameBtn = vgui.Create( "DButton", GUI_DashboardFrame )
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
		GUI_DashboardFrame:Remove()
		
		CH_Mayor.UpgradesMenu()
	end
	
	local GUI_TaxesFrameBtn = vgui.Create( "DButton", GUI_DashboardFrame )
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
		GUI_DashboardFrame:Remove()
		
		CH_Mayor.TaxesMenu()
	end

	local GUI_CatalogFrameBtn = vgui.Create( "DButton", GUI_DashboardFrame )
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
		GUI_DashboardFrame:Remove()
		
		CH_Mayor.CatalogMenu()
	end
	
	local GUI_LawsFrameBtn = vgui.Create( "DButton", GUI_DashboardFrame )
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
		GUI_DashboardFrame:Remove()
		
		CH_Mayor.LawsMenu()
	end
	
	local GUI_LicensesFrameBtn = vgui.Create( "DButton", GUI_DashboardFrame )
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
		GUI_DashboardFrame:Remove()
		
		CH_Mayor.LicensesMenu( )
	end
	
	local GUI_OfficialsManagementFrameBtn = vgui.Create( "DButton", GUI_DashboardFrame )
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
		GUI_DashboardFrame:Remove()
		
		CH_Mayor.OfficialsMenu()
	end
	
	local GUI_CiviliansManagementFrameBtn = vgui.Create( "DButton", GUI_DashboardFrame )
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
		GUI_DashboardFrame:Remove()
		
		CH_Mayor.CiviliansMenu()
	end
	
	local GUI_WantedFrameBtn = vgui.Create( "DButton", GUI_DashboardFrame )
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
		GUI_DashboardFrame:Remove()
		
		CH_Mayor.WantedMenu()
	end
	
	local GUI_WarrantFrameBtn = vgui.Create( "DButton", GUI_DashboardFrame )
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
		GUI_DashboardFrame:Remove()
		
		CH_Mayor.WarrantMenu()
	end
	
	local GUI_AnnouncementFrameBtn = vgui.Create( "DButton", GUI_DashboardFrame )
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
		GUI_DashboardFrame:Remove()
		
		CH_Mayor.AnnouncementMenu()
	end
	
	local GUI_LockdownFrameBtn = vgui.Create( "DButton", GUI_DashboardFrame )
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
		GUI_DashboardFrame:Remove()
		
		CH_Mayor.LockdownMenu()
	end
	
	local GUI_StatsFrameBtn = vgui.Create( "DButton", GUI_DashboardFrame )
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
		GUI_DashboardFrame:Remove()
		
		CH_Mayor.StatisticsMenu()
	end
	
	-- The dashboard panel
	local total_players = player.GetCount()
	local total_gov = CH_Mayor.GetGovCount()
	
	local GUI_DashboardPanel = vgui.Create( "DPanel", GUI_DashboardFrame )
	GUI_DashboardPanel:SetSize( CH_Mayor.ScrW * 0.487, CH_Mayor.ScrH * 0.6 )
	GUI_DashboardPanel:SetPos( CH_Mayor.ScrW * 0.109, CH_Mayor.ScrH * 0.0475 )
	GUI_DashboardPanel.Paint = function( self, w, h )
		-- Background
		surface.SetDrawColor( color_transparent )
		surface.DrawRect( 0, 0, w, h )
		
		-- Top box with info
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h * 0.146 )
		
		surface.SetFont( "CH_Mayor_Font_Size14" )
		local welcome_back = CH_Mayor.LangString( "Welcome back" ) ..", ".. ply:Nick()
		local x, y = surface.GetTextSize( welcome_back )

		draw.SimpleText( welcome_back, "CH_Mayor_Font_Size14", w * 0.01, h * 0.04, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		
		draw.SimpleText( CH_Mayor.LangString( "This is your mayoral dashboard. You manage your city from here." ), "CH_Mayor_Font_Size9", w * 0.01, h * 0.1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.WavingHand )
		surface.DrawTexturedRect( w * 0.01 + ( x + CH_Mayor.ScrW * 0.005 ), h * 0.0225, 28, 28 )
		
		-- City vault
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, h * 0.1575, w * 0.3275, h * 0.227 )
		
		draw.SimpleText( CH_Mayor.LangString( "City Funds" ), "CH_Mayor_Font_Size12", w * 0.165, h * 0.2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		draw.SimpleText( DarkRP.formatMoney( CH_Mayor.VaultMoney ), "CH_Mayor_Font_Size12", w * 0.165, h * 0.27, CH_Mayor.Colors.Green, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		draw.SimpleText( CH_Mayor.LangString( "Maximum" ) ..": ".. DarkRP.formatMoney( CH_Mayor.MaxVaultMoney ), "CH_Mayor_Font_Size10", w * 0.165, h * 0.335, CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
		-- Total govs
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( w * 0.336, h * 0.1575, w * 0.3275, h * 0.227 )
		
		draw.SimpleText( CH_Mayor.LangString( "Government Officials" ), "CH_Mayor_Font_Size12", w * 0.5, h * 0.2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		draw.SimpleText( total_gov .." ".. CH_Mayor.LangString( "On-Duty" ), "CH_Mayor_Font_Size12", w * 0.5, h * 0.27, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( w * 0.6725, h * 0.1575, w * 0.3275, h * 0.227 )
		
		draw.SimpleText( CH_Mayor.LangString( "City Residents" ), "CH_Mayor_Font_Size12", w * 0.835, h * 0.2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		draw.SimpleText( total_players .." ".. CH_Mayor.LangString( "Online" ), "CH_Mayor_Font_Size12", w * 0.835, h * 0.27, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	
	if CH_Mayor.Config.EnableDeposit then
		local GUI_DepositPanel = vgui.Create( "DPanel", GUI_DashboardPanel )
		GUI_DepositPanel:SetSize( CH_Mayor.ScrW * 0.24125, CH_Mayor.ScrH * 0.182 )
		GUI_DepositPanel:SetPos( 0, CH_Mayor.ScrH * 0.238 )
		GUI_DepositPanel.Paint = function( self, w, h )
			-- Background
			surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
			surface.DrawRect( 0, 0, w, h )
			
			draw.SimpleText( CH_Mayor.LangString( "You have deposited" ) .." ".. DarkRP.formatMoney( CH_Mayor.DepositAmount ) .." ".. CH_Mayor.LangString( "out of" ) .." ".. DarkRP.formatMoney( CH_Mayor.DepositLimit ), "CH_Mayor_Font_Size10", w * 0.5, h * 0.15, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			
			draw.SimpleText( "$", "CH_Mayor_Font_Size18", w * 0.295, h * 0.43, CH_Mayor.Colors.Green, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		
			surface.SetDrawColor( CH_Mayor.Colors.WhiteAlpha2 )
			surface.DrawRect( w * 0.3, h * 0.57, w * 0.4, h * 0.02 )
		end
		
		local GUI_DepositTextField = vgui.Create( "DTextEntry", GUI_DepositPanel )
		GUI_DepositTextField:SetPos( CH_Mayor.ScrW * 0.083, CH_Mayor.ScrH * 0.06 )
		GUI_DepositTextField:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
		GUI_DepositTextField:SetFont( "CH_Mayor_Font_Size18" )
		GUI_DepositTextField:SetTextColor( CH_Mayor.Colors.Green )
		GUI_DepositTextField:SetValue( 0 )
		GUI_DepositTextField:SetAllowNonAsciiCharacters( false ) -- When allowing non-ASCII characters, a small box appears inside the text entry, indicating your keyboard's current language.  That makes the user unable to input some letters from German, French, Swedish, etc. alphabet. 
		GUI_DepositTextField:SetMultiline( false )
		GUI_DepositTextField:SetNumeric( true )
		GUI_DepositTextField:SetDrawBackground( false )
		
		local GUI_DepositMoneyBtn = vgui.Create( "DButton", GUI_DepositPanel )
		GUI_DepositMoneyBtn:SetSize( CH_Mayor.ScrW * 0.125, CH_Mayor.ScrH * 0.04 )
		GUI_DepositMoneyBtn:SetPos( CH_Mayor.ScrW * 0.0575, CH_Mayor.ScrH * 0.1275 )
		GUI_DepositMoneyBtn:SetText( "" )
		GUI_DepositMoneyBtn.Paint = function( self, w, h )
			if self:IsHovered() then
				surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
				surface.DrawRect( 0, 0, w, h )
			
				surface.SetDrawColor( CH_Mayor.DepositAmount < CH_Mayor.DepositLimit and CH_Mayor.Colors.Green or CH_Mayor.Colors.Red )
				surface.DrawRect( 0, 0, w, 1 )
				surface.DrawRect( 0, h-1, w, 1 )
				surface.DrawRect( w-1, 0, 1, h )
				surface.DrawRect( 0, 0, 1, h )
			else
				surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
				surface.DrawRect( 0, 0, w, h )
				
				surface.SetDrawColor( CH_Mayor.DepositAmount < CH_Mayor.DepositLimit and CH_Mayor.Colors.Green or CH_Mayor.Colors.Red )
				surface.DrawRect( 0, 0, 1, 10 )
				surface.DrawRect( 0, 0, 10, 1 )
				surface.DrawRect( 0, h-10, 1, 10 )
				surface.DrawRect( 0, h-1, 10, 1 )
				surface.DrawRect( w-1, 0, 1, 10 )
				surface.DrawRect( w-10, 0, 10, 1 )
				surface.DrawRect( w-1, h-10, 1, 10 )
				surface.DrawRect( w-10, h-1, 10, 1 )
			end
			
			draw.SimpleText( CH_Mayor.LangString( "Deposit" ) .." ".. DarkRP.formatMoney( tonumber( GUI_DepositTextField:GetValue() ) ), "CH_Mayor_Font_Size9", w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
		GUI_DepositMoneyBtn.DoClick = function()
			local amount = tonumber( GUI_DepositTextField:GetValue() )
		
			if not amount or amount <= 0 then
				ply:ChatPrint( "You must supply a number higher than 0" )
				
				surface.PlaySound( "common/wpn_denyselect.wav" )
				return
			end
			
			net.Start( "CH_Mayor_Net_DepositMoneyVault" )
				net.WriteUInt( amount, 32 )
			net.SendToServer()
			
			GUI_DashboardFrame:Remove()
		end
	end
	
	if CH_Mayor.Config.EnableWithdraw then
		local GUI_WithdrawPanel = vgui.Create( "DPanel", GUI_DashboardPanel )
		GUI_WithdrawPanel:SetSize( CH_Mayor.ScrW * 0.24125, CH_Mayor.ScrH * 0.182 )
		GUI_WithdrawPanel:SetPos( CH_Mayor.ScrW * 0.24575, CH_Mayor.ScrH * 0.238 )
		GUI_WithdrawPanel.Paint = function( self, w, h )
			-- Background
			surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
			surface.DrawRect( 0, 0, w, h )
			
			draw.SimpleText( CH_Mayor.LangString( "You have withdrawn" ) .." ".. DarkRP.formatMoney( CH_Mayor.WithdrawAmount ) .." ".. CH_Mayor.LangString( "out of" ) .." ".. DarkRP.formatMoney( CH_Mayor.WithdrawLimit ), "CH_Mayor_Font_Size10", w * 0.5, h * 0.15, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			
			draw.SimpleText( "$", "CH_Mayor_Font_Size18", w * 0.295, h * 0.43, CH_Mayor.Colors.Green, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		
			surface.SetDrawColor( CH_Mayor.Colors.WhiteAlpha2 )
			surface.DrawRect( w * 0.3, h * 0.57, w * 0.4, h * 0.02 )
		end
		
		local GUI_WithdrawTextField = vgui.Create( "DTextEntry", GUI_WithdrawPanel )
		GUI_WithdrawTextField:SetPos( CH_Mayor.ScrW * 0.083, CH_Mayor.ScrH * 0.06 )
		GUI_WithdrawTextField:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
		GUI_WithdrawTextField:SetFont( "CH_Mayor_Font_Size18" )
		GUI_WithdrawTextField:SetTextColor( CH_Mayor.Colors.Green )
		GUI_WithdrawTextField:SetValue( 0 )
		GUI_WithdrawTextField:SetAllowNonAsciiCharacters( false ) -- When allowing non-ASCII characters, a small box appears inside the text entry, indicating your keyboard's current language.  That makes the user unable to input some letters from German, French, Swedish, etc. alphabet. 
		GUI_WithdrawTextField:SetMultiline( false )
		GUI_WithdrawTextField:SetNumeric( true )
		GUI_WithdrawTextField:SetDrawBackground( false )
		
		local GUI_WithdrawMoneyBtn = vgui.Create( "DButton", GUI_WithdrawPanel )
		GUI_WithdrawMoneyBtn:SetSize( CH_Mayor.ScrW * 0.125, CH_Mayor.ScrH * 0.04 )
		GUI_WithdrawMoneyBtn:SetPos( CH_Mayor.ScrW * 0.0575, CH_Mayor.ScrH * 0.1275 )
		GUI_WithdrawMoneyBtn:SetText( "" )
		GUI_WithdrawMoneyBtn.Paint = function( self, w, h )
			if self:IsHovered() then
				surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
				surface.DrawRect( 0, 0, w, h )
			
				surface.SetDrawColor( CH_Mayor.WithdrawAmount < CH_Mayor.WithdrawLimit and CH_Mayor.Colors.Green or CH_Mayor.Colors.Red )
				surface.DrawRect( 0, 0, w, 1 )
				surface.DrawRect( 0, h-1, w, 1 )
				surface.DrawRect( w-1, 0, 1, h )
				surface.DrawRect( 0, 0, 1, h )
			else
				surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
				surface.DrawRect( 0, 0, w, h )
				
				surface.SetDrawColor( CH_Mayor.WithdrawAmount < CH_Mayor.WithdrawLimit and CH_Mayor.Colors.Green or CH_Mayor.Colors.Red )
				surface.DrawRect( 0, 0, 1, 10 )
				surface.DrawRect( 0, 0, 10, 1 )
				surface.DrawRect( 0, h-10, 1, 10 )
				surface.DrawRect( 0, h-1, 10, 1 )
				surface.DrawRect( w-1, 0, 1, 10 )
				surface.DrawRect( w-10, 0, 10, 1 )
				surface.DrawRect( w-1, h-10, 1, 10 )
				surface.DrawRect( w-10, h-1, 10, 1 )
			end
			
			draw.SimpleText( CH_Mayor.LangString( "Withdraw" ) .." ".. DarkRP.formatMoney( tonumber( GUI_WithdrawTextField:GetValue() ) ), "CH_Mayor_Font_Size9", w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
		GUI_WithdrawMoneyBtn.DoClick = function()
			local amount = tonumber( GUI_WithdrawTextField:GetValue() )
		
			if amount <= 0 then
				ply:ChatPrint( "You must supply a number higher than 0" )
				
				surface.PlaySound( "common/wpn_denyselect.wav" )
				return
			end
			
			net.Start( "CH_Mayor_Net_WithdrawMoneyVault" )
				net.WriteUInt( amount, 32 )
			net.SendToServer()
			
			GUI_DashboardFrame:Remove()
		end
	end
	
	if CH_Mayor and CH_Mayor.Economy then
		local GUI_EconomyDLCBtn = vgui.Create( "DButton", GUI_DashboardFrame )
		GUI_EconomyDLCBtn:SetSize( CH_Mayor.ScrW * 0.487, CH_Mayor.ScrH * 0.0875 )
		GUI_EconomyDLCBtn:SetPos( CH_Mayor.ScrW * 0.109, CH_Mayor.ScrH * 0.57 )
		GUI_EconomyDLCBtn:SetText( "" )
		GUI_EconomyDLCBtn.Paint = function( self, w, h )
			if self:IsHovered() then
				surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
				surface.DrawRect( 0, 0, w, h )
			
				surface.SetDrawColor( CH_Mayor.Colors.Green )
				surface.DrawRect( 0, 0, w, 1 )
				surface.DrawRect( 0, h-1, w, 1 )
				surface.DrawRect( w-1, 0, 1, h )
				surface.DrawRect( 0, 0, 1, h )
			else
				surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
				surface.DrawRect( 0, 0, w, h )
				
				surface.SetDrawColor( CH_Mayor.Colors.Green )
				surface.DrawRect( 0, 0, 1, 10 )
				surface.DrawRect( 0, 0, 10, 1 )
				surface.DrawRect( 0, h-10, 1, 10 )
				surface.DrawRect( 0, h-1, 10, 1 )
				surface.DrawRect( w-1, 0, 1, 10 )
				surface.DrawRect( w-10, 0, 10, 1 )
				surface.DrawRect( w-1, h-10, 1, 10 )
				surface.DrawRect( w-10, h-1, 10, 1 )
			end

			draw.SimpleText( CH_Mayor.LangString( "Economy Centre" ), "CH_Mayor_Font_Size18", w / 2, h * 0.45, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
		GUI_EconomyDLCBtn.DoClick = function()
			CH_Mayor.Economy.DashboardMenu()
			
			GUI_DashboardFrame:Remove()
		end
	end
end