include( "shared.lua" )

function ENT:DrawTranslucent()
	self:DrawModel()
	
	local ply = LocalPlayer()
	
	if ply:GetPos():DistToSqr( self:GetPos() ) >= CH_Mayor.Config.DistanceTo3D2D then
		return
	end

    local pos_top = self:GetPos() + Vector( 0, 0, 45 )
	local ply_ang = ply:GetAngles()
	local ang_top = Angle( 0, ply_ang.y - 180, 0 )
	local cur_time = CurTime()
	
	ang_top:RotateAroundAxis( ang_top:Right(), -90 )
	ang_top:RotateAroundAxis( ang_top:Up(), 90 )
	
	cam.Start3D2D( pos_top, ang_top, 0.08 )
		draw.SimpleTextOutlined( CH_Mayor.LangString( "Trash Dumpster" ), "CH_Mayor_Font_3D2D_110", 0, 0, CH_Mayor.Colors.GMSBlue, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 2, color_black )
		draw.SimpleTextOutlined( CH_Mayor.LangString( "Drop props & entities to delete them" ), "CH_Mayor_Font_3D2D_70", 0, 80, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 2, color_black )
    cam.End3D2D()
end