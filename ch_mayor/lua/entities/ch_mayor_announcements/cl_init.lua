include( "shared.lua" )

--[[
	Net message to make flashy screens
	Called when announcement is updated
--]]
net.Receive( "CH_Mayor_Net_NewAnnouncementFlash", function( len, ply )
	for k, ent in ipairs( ents.FindByClass( "ch_mayor_announcements" ) ) do
		ent.SCREEN_NewAnnouncement = CurTime() + CH_Mayor.Config.NewAnnouncementScreenFlashTime
	end
end )

function ENT:Initialize()
	self.SCREEN_NewAnnouncement = 0
end

function ENT:DrawTranslucent()
	self:DrawModel()
	
	if LocalPlayer():GetPos():DistToSqr( self:GetPos() ) >= CH_Mayor.Config.DistanceTo3D2D then
		return
	end
	
	local pos = self:GetPos()
	local ang = self:GetAngles()
	
	ang:RotateAroundAxis( ang:Forward(), 90 )
	ang:RotateAroundAxis( ang:Right(), 180 )

	cam.Start3D2D( pos + ang:Up() * 0.2, ang, 0.1 )		
		-- Draw frame
		surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
		surface.DrawRect( -450, -290, 900, 500 )
		
		-- Draw top
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( -450, -290, 900, 75 )
		
		-- Draw the top title.
		draw.SimpleText( CH_Mayor.LangString( "Mayor Announcement" ), "CH_Mayor_Font_3D2D_50", 0, -250, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
		-- Draw icons left and right
		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Ent_AnnouncementLeft )
		surface.DrawTexturedRect( -420, -270, 45, 45 )
		
		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Ent_AnnouncementRight )
		surface.DrawTexturedRect( 380, -270, 45, 45 )
		
		if ( self.SCREEN_NewAnnouncement or 0 ) > CurTime() then
			-- Flashy screen
			local cur_time = CurTime()
			
			surface.SetDrawColor( 235 * math.abs( math.sin( cur_time * 1.1 ) ), 0, 0 )
			surface.DrawRect( -450, -215, 900, 420 )
			
			draw.SimpleText( CH_Mayor.LangString( "Announcement Incoming" ), "CH_Mayor_Font_3D2D_70", 0, -70, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			draw.SimpleText( string.ToMinutesSeconds( math.Round( self.SCREEN_NewAnnouncement - cur_time ) ), "CH_Mayor_Font_3D2D_60", 0, 10, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		else
			-- Announcement
			local wrapped_text = DarkRP.textWrap( self:GetAnnouncement(), "CH_Mayor_Font_3D2D_50", 850 )
			draw.DrawText( wrapped_text, "CH_Mayor_Font_3D2D_50", 0, -100, CH_Mayor.Colors.WhiteAlpha2, TEXT_ALIGN_CENTER )
		end
	cam.End3D2D()
end