include( "shared.lua" )

function ENT:DrawTranslucent()
	self:DrawModel()
	
	if LocalPlayer():GetPos():DistToSqr( self:GetPos() ) >= CH_Mayor.Config.DistanceTo3D2D then
		return
	end
	
	local pos = self:GetPos()
	local ang = self:GetAngles()
	
	ang:RotateAroundAxis( ang:Forward(), 90 )
	ang:RotateAroundAxis( ang:Right(), 180 )

	cam.Start3D2D( pos + ang:Up() * 0.2, ang, 0.15 )		
		-- Draw frame
		surface.SetDrawColor( CH_Mayor.Colors.GrayFront )
		surface.DrawRect( -745, -475, 1490, 820 )
		
		-- Draw top
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( -745, -475, 1490, 75 )
		
		-- Draw the top title.
		local mayor = CH_Mayor.GetMayor()
		if IsValid( mayor ) then
			draw.SimpleText( CH_Mayor.LangString( "City Board" ) .." - ".. mayor:Nick(), "CH_Mayor_Font_3D2D_60", 0, -440, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		else
			draw.SimpleText( CH_Mayor.LangString( "City Board" ), "CH_Mayor_Font_3D2D_60", 0, -440, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
		
		-- Draw icons left and right
		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Ent_Cityboard )
		surface.DrawTexturedRect( -720, -460, 45, 45 )
		
		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Mayor.Materials.Icon_Ent_Cityboard )
		surface.DrawTexturedRect( 680, -460, 45, 45 )
		
		-- Box 1 (city funds)
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( -700, -360, 440, 150 )
		
		draw.SimpleText( CH_Mayor.LangString( "City Funds" ), "CH_Mayor_Font_3D2D_60", -485, -325, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		draw.SimpleText( DarkRP.formatMoney( CH_Mayor.VaultMoney ), "CH_Mayor_Font_3D2D_50", -485, -265, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
		-- Box 2 (civilians)
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( -220, -360, 440, 150 )
		
		draw.SimpleText( CH_Mayor.LangString( "City Residents" ), "CH_Mayor_Font_3D2D_60", 0, -325, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		draw.SimpleText( player.GetCount() .." ".. CH_Mayor.LangString( "Online" ), "CH_Mayor_Font_3D2D_50", 0, -265, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
		-- Box 3 (wanted criminals)
		surface.SetDrawColor( CH_Mayor.Colors.GrayBG )
		surface.DrawRect( 265, -360, 440, 150 )
		
		local wanted_count = 0
		for k, v in ipairs( player.GetAll() ) do
			if v:isWanted() then
				wanted_count = wanted_count + 1
			end
		end
		
		draw.SimpleText( CH_Mayor.LangString( "Wanted Criminals" ), "CH_Mayor_Font_3D2D_60", 485, -325, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		draw.SimpleText( wanted_count .." ".. CH_Mayor.LangString( "Criminals" ), "CH_Mayor_Font_3D2D_50", 485, -265, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
		-- LAWS
		local lastHeight = 0
        for k, v in ipairs( CH_Mayor.Laws ) do
            draw.DrawNonParsedText( string.format("%u. %s", k, v), "CH_Mayor_Font_3D2D_50", -700, -190 + lastHeight, color_white )
            lastHeight = lastHeight + (fn.ReverseArgs(string.gsub(v, "\n", "")) + 1) * 50
        end
	cam.End3D2D()
end