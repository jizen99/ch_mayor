--[[
	MAYOR LAWS MENU
--]]
function CH_Mayor.LawsMenu()
	local ply = LocalPlayer()

	local GUI_LawsFrame = vgui.Create( "DFrame" )
	GUI_LawsFrame:SetTitle( "" )
	GUI_LawsFrame:SetSize( CH_Mayor.ScrW * 0.6, CH_Mayor.ScrH * 0.665 )
	GUI_LawsFrame:Center()
	GUI_LawsFrame.Paint = function( self, w, h )
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
		
		draw.SimpleText( CH_Mayor.LangString( "Laws" ), "CH_Mayor_Font_Size10", w * 0.195, h * 0.1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

		draw.SimpleText( CH_Mayor.LangString( "Action" ), "CH_Mayor_Font_Size10", w * 0.9, h * 0.1, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	GUI_LawsFrame:MakePopup()
	GUI_LawsFrame:SetDraggable( false )
	GUI_LawsFrame:ShowCloseButton( false )
	
	local GUI_CloseMenu = vgui.Create( "DButton", GUI_LawsFrame )
	GUI_CloseMenu:SetPos( CH_Mayor.ScrW * 0.582, CH_Mayor.ScrH * 0.01 )
	GUI_CloseMenu:SetSize( CH_Mayor.ScrW * 0.0125, CH_Mayor.ScrH * 0.02223 )
	GUI_CloseMenu:SetText( "" )
	GUI_CloseMenu.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.Red or color_white )
		surface.SetMaterial( CH_Mayor.Materials.CloseIcon )
		surface.DrawTexturedRect( 0, 0, CH_Mayor.ScrW * 0.0125, CH_Mayor.ScrH * 0.02223 )
	end
	GUI_CloseMenu.DoClick = function()
		GUI_LawsFrame:Remove()
	end
	
	local GUI_DashboardFrameBtn = vgui.Create( "DButton", GUI_LawsFrame )
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
		GUI_LawsFrame:Remove()
		
		CH_Mayor.DashboardMenu()
	end

	local GUI_UpgradesFrameBtn = vgui.Create( "DButton", GUI_LawsFrame )
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
		GUI_LawsFrame:Remove()
		
		CH_Mayor.UpgradesMenu()
	end
	
	local GUI_TaxesFrameBtn = vgui.Create( "DButton", GUI_LawsFrame )
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
		GUI_LawsFrame:Remove()
		
		CH_Mayor.TaxesMenu()
	end

	local GUI_CatalogFrameBtn = vgui.Create( "DButton", GUI_LawsFrame )
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
		GUI_LawsFrame:Remove()
		
		CH_Mayor.CatalogMenu()
	end
	
	local GUI_LawsFrameBtn = vgui.Create( "DButton", GUI_LawsFrame )
	GUI_LawsFrameBtn:SetSize( CH_Mayor.ScrW * 0.1, CH_Mayor.ScrH * 0.04 )
	GUI_LawsFrameBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.2375 )
	GUI_LawsFrameBtn:SetText( "" )
	GUI_LawsFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
		surface.DrawRect( 0, 0, 2, h )
		
		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Laws )
		surface.DrawTexturedRect( w * 0.065, h * 0.18, CH_Mayor.ScrW * 0.014065, CH_Mayor.ScrH * 0.025 )
		
		draw.SimpleText( CH_Mayor.LangString( "Laws" ), "CH_Mayor_Font_Size9", w * 0.25, h / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_LawsFrameBtn.DoClick = function()
		GUI_LawsFrame:Remove()
		
		CH_Mayor.LawsMenu()
	end
	
	local GUI_CiviliansFrameBtn = vgui.Create( "DButton", GUI_LawsFrame )
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
		GUI_LawsFrame:Remove()
		
		CH_Mayor.LicensesMenu( )
	end
	
	local GUI_OfficialsManagementFrameBtn = vgui.Create( "DButton", GUI_LawsFrame )
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
		GUI_LawsFrame:Remove()
		
		CH_Mayor.OfficialsMenu()
	end
	
	local GUI_CiviliansManagementFrameBtn = vgui.Create( "DButton", GUI_LawsFrame )
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
		GUI_LawsFrame:Remove()
		
		CH_Mayor.CiviliansMenu()
	end
	
	local GUI_WantedFrameBtn = vgui.Create( "DButton", GUI_LawsFrame )
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
		GUI_LawsFrame:Remove()
		
		CH_Mayor.WantedMenu()
	end
	
	local GUI_WarrantFrameBtn = vgui.Create( "DButton", GUI_LawsFrame )
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
		GUI_LawsFrame:Remove()
		
		CH_Mayor.WarrantMenu()
	end
	
	local GUI_AnnouncementFrameBtn = vgui.Create( "DButton", GUI_LawsFrame )
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
		GUI_LawsFrame:Remove()
		
		CH_Mayor.AnnouncementMenu()
	end
	
	local GUI_LockdownFrameBtn = vgui.Create( "DButton", GUI_LawsFrame )
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
		GUI_LawsFrame:Remove()
		
		CH_Mayor.LockdownMenu()
	end
	
	local GUI_StatsFrameBtn = vgui.Create( "DButton", GUI_LawsFrame )
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
		GUI_LawsFrame:Remove()
		
		CH_Mayor.StatisticsMenu()
	end

	local GUI_LawsList = vgui.Create( "DPanelList", GUI_LawsFrame )
	GUI_LawsList:SetSize( CH_Mayor.ScrW * 0.491, CH_Mayor.ScrH * 0.467 )
	GUI_LawsList:SetPos( CH_Mayor.ScrW * 0.109, CH_Mayor.ScrH * 0.095 )
	GUI_LawsList:EnableVerticalScrollbar( true )
	GUI_LawsList:EnableHorizontal( true )
	GUI_LawsList:SetSpacing( 8.4 )
	GUI_LawsList.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, color_transparent )
	end
	if ( GUI_LawsList.VBar ) then
		GUI_LawsList.VBar.Paint = function( self, w, h ) -- BG
			surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
			surface.DrawRect( 0, 0, 7, h )
		end
		
		GUI_LawsList.VBar.btnUp.Paint = function( self, w, h )
			surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
			surface.DrawRect( 0, 0, 7, h )
		end
		
		GUI_LawsList.VBar.btnGrip.Paint = function( self, w, h )
			surface.SetDrawColor( CH_Mayor.Colors.GMSBlue )
			surface.DrawRect( 0, 0, 7, h )
		end
		
		GUI_LawsList.VBar.btnDown.Paint = function( self, w, h )
			surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
			surface.DrawRect( 0, 0, 7, h )
		end
	end
	
	for k, v in ipairs( CH_Mayor.Laws ) do
		local law = v
		
		local GUI_PlayerPanel = vgui.Create( "DPanelList" )
		GUI_PlayerPanel:SetSize( CH_Mayor.ScrW * 0.487, CH_Mayor.ScrH * 0.04 )
		GUI_PlayerPanel.Paint = function( self, w, h )
			-- Background
			surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
			surface.DrawRect( 0, 0, w, h )
			
			-- Number
			draw.SimpleText( k, "CH_Mayor_Font_Size8", w * 0.0225, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			
			-- Law
			if string.len( law ) > 75 then
				law = string.Left( law, 75 ) ..".."
			end
			draw.SimpleText( law, "CH_Mayor_Font_Size8", w * 0.0425, h / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		end

		local GUI_RemoveLawBtn = vgui.Create( "DButton", GUI_PlayerPanel )
		GUI_RemoveLawBtn:SetSize( CH_Mayor.ScrW * 0.05, CH_Mayor.ScrH * 0.03 )
		GUI_RemoveLawBtn:SetPos( CH_Mayor.ScrW * 0.408, CH_Mayor.ScrH * 0.005 )
		GUI_RemoveLawBtn:SetText( "" )
		GUI_RemoveLawBtn.Paint = function( self, w, h )
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
			draw.SimpleText( CH_Mayor.LangString( "Remove" ), "CH_Mayor_Font_Size8", w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
		GUI_RemoveLawBtn.DoClick = function()
			ply:ConCommand( "say /removelaw ".. k )
			
			GUI_LawsFrame:Remove()
		end
		
		GUI_LawsList:AddItem( GUI_PlayerPanel )
	end
	
	local GUI_AddLawBtn = vgui.Create( "DButton", GUI_LawsFrame )
	GUI_AddLawBtn:SetSize( CH_Mayor.ScrW * 0.487, CH_Mayor.ScrH * 0.0875 )
	GUI_AddLawBtn:SetPos( CH_Mayor.ScrW * 0.109, CH_Mayor.ScrH * 0.57 )
	GUI_AddLawBtn:SetText( "" )
	GUI_AddLawBtn.Paint = function( self, w, h )
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

		draw.SimpleText( CH_Mayor.LangString( "Add Law" ), "CH_Mayor_Font_Size18", w / 2, h * 0.45, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	GUI_AddLawBtn.DoClick = function()
		CH_Mayor.AddLawMenu()
		
		GUI_LawsFrame:Remove()
	end
end

--[[
	ADD LAW MENU
--]]
function CH_Mayor.AddLawMenu()
	local ply = LocalPlayer()

	local GUI_AddLawFrame = vgui.Create( "DFrame" )
	GUI_AddLawFrame:SetTitle( "" )
	GUI_AddLawFrame:SetSize( CH_Mayor.ScrW * 0.23, CH_Mayor.ScrH * 0.2 )
	GUI_AddLawFrame:Center()
	GUI_AddLawFrame.Paint = function( self, w, h )
		-- Draw frame
		surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
		surface.DrawRect( 0, 0, w, h )
		
		-- Draw top
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, CH_Mayor.ScrH * 0.032 )

		-- Draw the top title.
		draw.SimpleText( CH_Mayor.LangString( "Add Law" ), "CH_Mayor_Font_Size9", w / 2, CH_Mayor.ScrH * 0.015, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
		-- Criminal name
		draw.SimpleText( ply:Nick(), "CH_Mayor_Font_Size12", CH_Mayor.ScrW * 0.04, CH_Mayor.ScrH * 0.055, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		
		draw.SimpleText( team.GetName( ply:Team() ), "CH_Mayor_Font_Size8", CH_Mayor.ScrW * 0.04, CH_Mayor.ScrH * 0.078, team.GetColor( ply:Team() ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

		-- Warrant reason entry BG
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.1, CH_Mayor.ScrW * 0.221, CH_Mayor.ScrH * 0.04 )
	end
	GUI_AddLawFrame:MakePopup()
	GUI_AddLawFrame:SetDraggable( false )
	GUI_AddLawFrame:ShowCloseButton( false )
	
	local GUI_CloseMenu = vgui.Create( "DButton", GUI_AddLawFrame )
	GUI_CloseMenu:SetPos( CH_Mayor.ScrW * 0.2175, CH_Mayor.ScrH * 0.0085 )
	GUI_CloseMenu:SetSize( 16, 16 )
	GUI_CloseMenu:SetText( "" )
	GUI_CloseMenu.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.Red or color_white )
		surface.SetMaterial( CH_Mayor.Materials.CloseIcon )
		surface.DrawTexturedRect( 0, 0, 16, 16 )
	end
	GUI_CloseMenu.DoClick = function()
		GUI_AddLawFrame:Remove()
	end
	
	local GUI_GoBack = vgui.Create( "DButton", GUI_AddLawFrame )
	GUI_GoBack:SetPos( CH_Mayor.ScrW * 0.205, CH_Mayor.ScrH * 0.0085 )
	GUI_GoBack:SetSize( 16, 16 )
	GUI_GoBack:SetText( "" )
	GUI_GoBack.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Mayor.Colors.GMSBlue or color_white )
		surface.SetMaterial( CH_Mayor.Materials.BackIcon )
		surface.DrawTexturedRect( 0, 0, 16, 16 )
	end
	GUI_GoBack.DoClick = function()
		CH_Mayor.LawsMenu()
		
		GUI_AddLawFrame:Remove()
	end

	local GUI_TeamModelSpawnI = vgui.Create( "SpawnIcon", GUI_AddLawFrame )
	GUI_TeamModelSpawnI:SetSize( CH_Mayor.ScrW * 0.03, CH_Mayor.ScrH * 0.051 )
	GUI_TeamModelSpawnI:SetPos( CH_Mayor.ScrW * 0.0055, CH_Mayor.ScrH * 0.04 )
	GUI_TeamModelSpawnI:SetModel( ply:GetModel() )
	GUI_TeamModelSpawnI:SetVisible( true )
	GUI_TeamModelSpawnI.PaintOver = function( self )
		EndTooltip( self )
	end
	GUI_TeamModelSpawnI.OnMousePressed = function()
		return
	end
	
	local GUI_NewLawField = vgui.Create( "DTextEntry", GUI_AddLawFrame )
	GUI_NewLawField:RequestFocus()
	GUI_NewLawField:SetPos( CH_Mayor.ScrW * 0.008, CH_Mayor.ScrH * 0.104 )
	GUI_NewLawField:SetSize( CH_Mayor.ScrW * 0.216, CH_Mayor.ScrH * 0.03 )
	GUI_NewLawField:SetFont( "CH_Mayor_Font_Size9" )
	GUI_NewLawField:SetTextColor( color_white )
	GUI_NewLawField:SetPlaceholderText( CH_Mayor.LangString( "Enter law" ) )
	GUI_NewLawField:SetAllowNonAsciiCharacters( false ) -- When allowing non-ASCII characters, a small box appears inside the text entry, indicating your keyboard's current language.  That makes the user unable to input some letters from German, French, Swedish, etc. alphabet. 
	GUI_NewLawField:SetMultiline( false )
	GUI_NewLawField:SetNumeric( false )
	GUI_NewLawField:SetDrawBackground( false )
	
	local GUI_AddLawBtn = vgui.Create( "DButton", GUI_AddLawFrame )
	GUI_AddLawBtn:SetSize( CH_Mayor.ScrW * 0.221, CH_Mayor.ScrH * 0.04 )
	GUI_AddLawBtn:SetPos( CH_Mayor.ScrW * 0.005, CH_Mayor.ScrH * 0.15 )
	GUI_AddLawBtn:SetText( "" )
	GUI_AddLawBtn.Paint = function( self, w, h )
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
		
		draw.SimpleText( CH_Mayor.LangString( "Add Law" ), "CH_Mayor_Font_Size9", w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	GUI_AddLawBtn.DoClick = function()
		local law = tostring( GUI_NewLawField:GetValue() )

		if not law or string.len( law ) < 1 then
			ply:ChatPrint( "You must supply a new law" )
			
			surface.PlaySound( "common/wpn_denyselect.wav" )
			return
		end
		
		ply:ConCommand( "say /addlaw ".. law )
		
		GUI_AddLawFrame:Remove()
	end
end