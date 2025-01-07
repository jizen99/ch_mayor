CH_Mayor.Catalog["item_concrete"] = {
	Name = "Concrete Barrier",
	Model = "models/props_c17/concrete_barrier001a.mdl",
	Description = "Purchase a concrete barrier prop that you can use to block roads or at events.",
	Price = 20,
	CustomCheck = function( ply )
		return true
	end,
	CustomCheckFailMessage = "",
	BuyFunction = function( ply )
		-- spawn cityboard entity
		local tr = ply:GetEyeTrace()
		
		local SpawnPos = tr.HitPos + tr.HitNormal * 20
		local SpawnAng = ply:EyeAngles()
		SpawnAng.p = 0
		SpawnAng.y = SpawnAng.y + 90
		
		local ent = ents.Create( "prop_physics" )
		ent:SetModel( "models/props_c17/concrete_barrier001a.mdl" )
		ent:SetPos( SpawnPos )
		ent:SetAngles( SpawnAng )
		ent:Spawn()
		
		ent:CPPISetOwner( ply )
		ent.SpawnedByMayor = true
	end,
	RemoveFunction = function()
	end,
}