CH_Mayor.TeamTaxes = CH_Mayor.TeamTaxes or {}

net.Receive( "CH_Mayor_Net_NetworkTeamTaxes", function( len, ply )
	local amount_of_entries = net.ReadUInt( 6 )
	
	for i = 1, amount_of_entries do
		local team = net.ReadString()
		local salary = net.ReadUInt( 32 )
		local tax = net.ReadUInt( 32 )
		local model = net.ReadString()
		
		CH_Mayor.TeamTaxes[ team ] = {
			team_salary = salary,
			team_tax = tax,
			team_model = model,
		}
	end
end )

--[[
	MAYOR TAXES MENU
--]]
function CH_Mayor.TaxesMenu()
	local ply = LocalPlayer()

	local GUI_TaxesFrame = vgui.Create( "DFrame" )
	GUI_TaxesFrame:SetTitle( "" )
	GUI_TaxesFrame:SetSize( CH_Mayor.ScrW * 0.6, CH_Mayor.ScrH * 0.665 )
	GUI_TaxesFrame:Center()
	GUI_TaxesFrame.Paint = function( self, w, h )
		-- Draw frame
		surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
		surface.DrawRect( 0, 0, w, h )
		
		-- Draw top
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h * 0.059 )
		
		-- Draw the top title.
		draw.SimpleText( CH_Mayor.LangString( "City Management" ), "CH_Mayor_Font_Size10", w / 2, h * 0.03, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	GUI_TaxesFrame:MakePopup()
	GUI_TaxesFrame:SetDraggable( false )
	GUI_TaxesFrame:ShowCloseButton( false )
	
	local GUI_CloseMenu = vgui.Create( "DButton", GUI_TaxesFrame )
	GUI_CloseMenu:SetPos( CH_Mayor.ScrW * 0.582, CH_Mayor.ScrH * 0.01 )
	GUI_CloseMenu:SetSize( CH_Mayor.ScrW * 0.0125, CH_Mayor.ScrH * 0.02223 )
	GUI_CloseMenu:SetText( "" )
	GUI_CloseMenu.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.Red or color_white )
		surface.SetMaterial( CH_Mayor.Materials.CloseIcon )
		surface.DrawTexturedRect( 0, 0, CH_Mayor.ScrW * 0.0125, CH_Mayor.ScrH * 0.02223 )
	end
	GUI_CloseMenu.DoClick = function()
		GUI_TaxesFrame:Remove()
	end
	
	local GUI_DashboardFrameBtn = vgui.Create( "DButton", GUI_TaxesFrame )
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
		GUI_TaxesFrame:Remove()
		
		CH_Mayor.DashboardMenu()
	end

	local GUI_UpgradesFrameBtn = vgui.Create( "DButton", GUI_TaxesFrame )
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
		GUI_TaxesFrame:Remove()
		
		CH_Mayor.UpgradesMenu()
	end
	
	local GUI_TaxesFrameBtn = vgui.Create( "DButton", GUI_TaxesFrame )
	GUI_TaxesFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_TaxesFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.1425 )
	GUI_TaxesFrameBtn:SetText( "" )
	GUI_TaxesFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
		surface.DrawRect( 0, 0, 2, h )
		
		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Taxes )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Taxes" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_TaxesFrameBtn.DoClick = function()
		GUI_TaxesFrame:Remove()
		
		CH_Mayor.TaxesMenu()
	end

	local GUI_CatalogFrameBtn = vgui.Create( "DButton", GUI_TaxesFrame )
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
		GUI_TaxesFrame:Remove()
		
		CH_Mayor.CatalogMenu()
	end
	
	local GUI_LawsFrameBtn = vgui.Create( "DButton", GUI_TaxesFrame )
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
		GUI_TaxesFrame:Remove()
		
		CH_Mayor.LawsMenu()
	end
	
	local GUI_TaxesFrameBtn = vgui.Create( "DButton", GUI_TaxesFrame )
	GUI_TaxesFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_TaxesFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.285 )
	GUI_TaxesFrameBtn:SetText( "" )
	GUI_TaxesFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Licenses )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Licenses" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, self:IsHovered() and color_white or CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_TaxesFrameBtn.DoClick = function()
		GUI_TaxesFrame:Remove()
		
		CH_Mayor.LicensesMenu( )
	end
	
	local GUI_OfficialsManagementFrameBtn = vgui.Create( "DButton", GUI_TaxesFrame )
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
		GUI_TaxesFrame:Remove()
		
		CH_Mayor.OfficialsMenu()
	end
	
	local GUI_CiviliansManagementFrameBtn = vgui.Create( "DButton", GUI_TaxesFrame )
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
		GUI_TaxesFrame:Remove()
		
		CH_Mayor.CiviliansMenu()
	end
	
	local GUI_TaxesFrameBtn = vgui.Create( "DButton", GUI_TaxesFrame )
	GUI_TaxesFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_TaxesFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.4275 )
	GUI_TaxesFrameBtn:SetText( "" )
	GUI_TaxesFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Wanted )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Wanted" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, self:IsHovered() and color_white or CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_TaxesFrameBtn.DoClick = function()
		GUI_TaxesFrame:Remove()
		
		CH_Mayor.WantedMenu()
	end
	
	local GUI_WarrantFrameBtn = vgui.Create( "DButton", GUI_TaxesFrame )
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
		GUI_TaxesFrame:Remove()
		
		CH_Mayor.WarrantMenu()
	end
	
	local GUI_AnnouncementFrameBtn = vgui.Create( "DButton", GUI_TaxesFrame )
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
		GUI_TaxesFrame:Remove()
		
		CH_Mayor.AnnouncementMenu()
	end
	
	local GUI_LockdownFrameBtn = vgui.Create( "DButton", GUI_TaxesFrame )
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
		GUI_TaxesFrame:Remove()
		
		CH_Mayor.LockdownMenu()
	end
	
	local GUI_StatsFrameBtn = vgui.Create( "DButton", GUI_TaxesFrame )
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
		GUI_TaxesFrame:Remove()
		
		CH_Mayor.StatisticsMenu()
	end
	
	-- The list of taxed teams
	local GUI_PlayerList = vgui.Create( "DPanelList", GUI_TaxesFrame )
	GUI_PlayerList:SetSize( CH_Mayor.ScrW * 0.491, CH_Mayor.ScrH * 0.61 )
	GUI_PlayerList:SetPos( CH_Mayor.ScrW * 0.109, CH_Mayor.ScrH * 0.0475 )
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
	
	for k, v in pairs( CH_Mayor.TeamTaxes ) do
		local GUI_PlayerPanel = vgui.Create( "DPanelList" )
		GUI_PlayerPanel:SetSize( CH_Mayor.ScrW * 0.2415, CH_Mayor.ScrH * 0.0879 )
		GUI_PlayerPanel.Paint = function( self, w, h )
			-- Background
			surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
			surface.DrawRect( 0, 0, w, h )
			
			-- Name
			draw.SimpleText( k, "CH_Mayor_Font_Size10", w * 0.2, h * 0.35, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			
			-- Salary
			draw.SimpleText( CH_Mayor.LangString( "Salary" ) ..": ".. DarkRP.formatMoney( v.team_salary ), "CH_Mayor_Font_Size9", w * 0.2, h * 0.65, CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			
			-- Draw tax percentage
			draw.SimpleText( "%", "CH_Mayor_Font_Size18", w * 0.91, h * 0.5, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			
			surface.SetDrawColor( CH_Mayor.Colors.WhiteAlpha2 )
			surface.DrawRect( w * 0.75, h * 0.775, w * 0.15, h * 0.03 )
		end

		local GUI_TeamModelSpawnI = vgui.Create( "SpawnIcon", GUI_PlayerPanel )
		GUI_TeamModelSpawnI:SetSize( CH_Mayor.ScrW * 0.0425, CH_Mayor.ScrH * 0.07 )
		GUI_TeamModelSpawnI:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.0115 )
		GUI_TeamModelSpawnI:SetModel( v.team_model )
		GUI_TeamModelSpawnI:SetVisible( true )
		GUI_TeamModelSpawnI.PaintOver = function( self )
			EndTooltip( self )
		end
		GUI_TeamModelSpawnI.OnMousePressed = function()
			return
		end
	
		local GUI_TeamTaxField = vgui.Create( "DTextEntry", GUI_PlayerPanel )
		GUI_TeamTaxField:RequestFocus()
		GUI_TeamTaxField:SetPos( CH_Mayor.ScrW * 0.18, CH_Mayor.ScrH * 0.024 )
		GUI_TeamTaxField:SetSize( CH_Mayor.ScrW * 0.04, CH_Mayor.ScrH * 0.04 )
		GUI_TeamTaxField:SetFont( "CH_Mayor_Font_Size18" )
		GUI_TeamTaxField:SetTextColor( color_white )
		GUI_TeamTaxField:SetValue( v.team_tax )
		GUI_TeamTaxField:SetAllowNonAsciiCharacters( false ) -- When allowing non-ASCII characters, a small box appears inside the text entry, indicating your keyboard's current language.  That makes the user unable to input some letters from German, French, Swedish, etc. alphabet. 
		GUI_TeamTaxField:SetMultiline( false )
		GUI_TeamTaxField:SetNumeric( true )
		GUI_TeamTaxField:SetDrawBackground( false )
		GUI_TeamTaxField.OnEnter = function( self )
			local tax = tonumber( self:GetValue() )
			
			if not isnumber( tax ) then
				ply:ChatPrint( "You must insert a number to update the taxes." )
				return
			end
			
			if tax <= 0 then
				ply:ChatPrint( "The tax must be a positive number." )
				return
			end
			
			-- Update the taxes for this team
			net.Start( "CH_Mayor_Net_UpdateTeamTax" )
				net.WriteString( k )
				net.WriteUInt( tax, 7 )
			net.SendToServer()
		end
		
		GUI_PlayerList:AddItem( GUI_PlayerPanel )
	end
end