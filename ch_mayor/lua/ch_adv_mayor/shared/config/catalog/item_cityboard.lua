CH_Mayor.Catalog["item_cityboard"] = {
	Name = "City Board",
	Model = "models/craphead_scripts/bitminers/utility/tv.mdl",
	Description = "Purchase a city board and place it in your city. The board will display players, criminals, vault holding and show your city laws.",
	Price = 1500,
	CustomCheck = function( ply )
		return true
	end,
	CustomCheckFailMessage = "",
	BuyFunction = function( ply )
		-- spawn cityboard entity
		local tr = ply:GetEyeTrace()
		
		local SpawnPos = tr.HitPos + tr.HitNormal * 70
		local SpawnAng = ply:EyeAngles()
		SpawnAng.p = 0
		SpawnAng.y = SpawnAng.y + 90
		
		local ent = ents.Create( "ch_mayor_cityboard" )
		ent:SetPos( SpawnPos )
		ent:SetAngles( SpawnAng )
		ent:Spawn()
		
		ent:CPPISetOwner( ply )
		ent.SpawnedByMayor = true
	end,
	RemoveFunction = function()
	end,
}