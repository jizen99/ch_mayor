CH_Mayor.Catalog["item_announcement"] = {
	Name = "Announcements Screen",
	Model = "models/craphead_scripts/bitminers/utility/tv.mdl",
	Description = "Purchase an announcement board where your mayoral announcements are broadcasted to.",
	Price = 500,
	CustomCheck = function( ply )
		return true
	end,
	CustomCheckFailMessage = "",
	BuyFunction = function( ply )
		-- spawn announcement entity
		local tr = ply:GetEyeTrace()
		
		local SpawnPos = tr.HitPos + tr.HitNormal * 30
		local SpawnAng = ply:EyeAngles()
		SpawnAng.p = 0
		SpawnAng.y = SpawnAng.y + 90
		
		local ent = ents.Create( "ch_mayor_announcements" )
		ent:SetPos( SpawnPos )
		ent:SetAngles( SpawnAng )
		ent:Spawn()
		
		ent:CPPISetOwner( ply )
		ent.SpawnedByMayor = true
	end,
	RemoveFunction = function()
	end,
}