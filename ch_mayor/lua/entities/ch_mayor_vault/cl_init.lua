include( "shared.lua" )

function ENT:DrawTranslucent()
	self:DrawModel()
	
	local ply = LocalPlayer()
	
	if ply:GetPos():DistToSqr( self:GetPos() ) >= CH_Mayor.Config.DistanceTo3D2D then
		return
	end
	
	local ang = self:GetAttachment( 1 ).Ang
	local pos = self:GetAttachment( 1 ).Pos
	ang:RotateAroundAxis( ang:Forward(), 90 )

	local funds = CH_Mayor.VaultMoney
	
	cam.Start3D2D( pos, ang, 0.02 )
		draw.SimpleTextOutlined( CH_Mayor.LangString( "Mayor Safe" ), "CH_Mayor_Font_3D2D_300", 560, 120, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 4, color_black )

		draw.SimpleTextOutlined( CH_Mayor.LangString( "Funds Available" ), "CH_Mayor_Font_3D2D_175", 560, 300, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 4, color_black )
		draw.SimpleTextOutlined( DarkRP.formatMoney( funds ), "CH_Mayor_Font_3D2D_175", 560, 450, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 4, color_black )
    cam.End3D2D()
	
    local pos_top = self:GetPos() + Vector( 0, 0, 60 )
	local ply_ang = ply:GetAngles()
	local ang_top = Angle( 0, ply_ang.y - 180, 0 )
	local cur_time = CurTime()
	
	ang_top:RotateAroundAxis( ang_top:Right(), -90 )
	ang_top:RotateAroundAxis( ang_top:Up(), 90 )
	
	cam.Start3D2D( pos_top, ang_top, 0.05 )
		if CH_Mayor.Vault.Cooldown and CH_Mayor.Vault.Cooldown > cur_time then
			draw.SimpleTextOutlined( CH_Mayor.LangString( "Robbery Cooldown" ), "CH_Mayor_Font_3D2D_175", 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 4, color_black )
			draw.SimpleTextOutlined( string.ToMinutesSeconds( math.Round( CH_Mayor.Vault.Cooldown - cur_time ) ), "CH_Mayor_Font_3D2D_175", 0, 150, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 4, color_black )
		end
		
		if CH_Mayor.Vault.Countdown and CH_Mayor.Vault.Countdown > cur_time then
			draw.SimpleTextOutlined( CH_Mayor.LangString( "Robbery Countdown" ), "CH_Mayor_Font_3D2D_175", 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 4, color_black )
			draw.SimpleTextOutlined( string.ToMinutesSeconds( math.Round( CH_Mayor.Vault.Countdown - cur_time ) ), "CH_Mayor_Font_3D2D_175", 0, 150, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 4, color_black )
		end
    cam.End3D2D()
end