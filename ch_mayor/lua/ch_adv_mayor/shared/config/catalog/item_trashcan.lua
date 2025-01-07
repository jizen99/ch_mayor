CH_Mayor.Catalog["item_trashcan"] = {
	Name = "Trash Dumpster",
	Model = "models/props_junk/TrashDumpster01a.mdl",
	Description = "Purchase a trash dumpster for your city where citizens can dump various entities/items to earn themselves a reward.",
	Price = 250,
	CustomCheck = function( ply )
		return true
	end,
	CustomCheckFailMessage = "",
	BuyFunction = function( ply )
		-- spawn dumpster entity
		local tr = ply:GetEyeTrace()
		
		local SpawnPos = tr.HitPos + tr.HitNormal * 30
		local SpawnAng = ply:EyeAngles()
		SpawnAng.p = 0
		SpawnAng.y = SpawnAng.y + 180
		
		local ent = ents.Create( "ch_mayor_trashcan" )
		ent:SetPos( SpawnPos )
		ent:SetAngles( SpawnAng )
		ent:Spawn()
		
		ent:CPPISetOwner( ply )
		ent.SpawnedByMayor = true
	end,
	RemoveFunction = function()
	end,
}