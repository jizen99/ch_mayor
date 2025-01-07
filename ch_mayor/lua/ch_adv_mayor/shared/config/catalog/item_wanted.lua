CH_Mayor.Catalog["item_wanted"] = {
	Name = "Wanted Board",
	Model = "models/craphead_scripts/bitminers/utility/tv.mdl",
	Description = "Purchase an interactive wanted board and place it in your city. Players can view wanted reasons and see players face.",
	Price = 750,
	CustomCheck = function( ply )
		return true
	end,
	CustomCheckFailMessage = "",
	BuyFunction = function( ply )
		-- spawn wanted entity
		local tr = ply:GetEyeTrace()
		
		local SpawnPos = tr.HitPos + tr.HitNormal * 30
		local SpawnAng = ply:EyeAngles()
		SpawnAng.p = 0
		SpawnAng.y = SpawnAng.y + 90
		
		local ent = ents.Create( "ch_mayor_wanted" )
		ent:SetPos( SpawnPos )
		ent:SetAngles( SpawnAng )
		ent:Spawn()
		
		ent:CPPISetOwner( ply )
		ent.SpawnedByMayor = true
	end,
	RemoveFunction = function()
	end,
}