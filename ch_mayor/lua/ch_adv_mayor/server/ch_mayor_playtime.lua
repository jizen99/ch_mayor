--[[
	Start timer to count mayor playtime when elected
--]]
function CH_Mayor.StartMayorPlaytime( ply )
	timer.Create( ply:EntIndex() .."_CH_Mayor_Playtime", 60, 0, function()
		if not IsValid( ply ) then
			return
		end
		
		CH_Mayor.AddStat( ply, "TotalPlaytime", 1 )
	end )
end

--[[
	Stop timer for mayor playtime
--]]
function CH_Mayor.StopMayorPlaytime( ply )
	if timer.Exists( ply:EntIndex() .."_CH_Mayor_Playtime" ) then
		timer.Remove( ply:EntIndex() .."_CH_Mayor_Playtime" )
	end
end