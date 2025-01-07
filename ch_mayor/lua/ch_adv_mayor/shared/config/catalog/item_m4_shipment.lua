local shipment_id = 7 -- Find it by running lua_run PrintTable( CustomShipments ) in console and take the key/id of the desired shipment.

CH_Mayor.Catalog["item_m4_shipment"] = {
	Name = "M4-A1",
	Model = "models/weapons/w_rif_m4a1.mdl",
	Description = "Purchase a shipment of M4-A1's for your police force.",
	Price = 2750,
	CustomCheck = function( ply )
		return true
	end,
	CustomCheckFailMessage = "",
	BuyFunction = function( ply )
		-- spawn shipment entity
		local tr = ply:GetEyeTrace()
		
		local SpawnPos = tr.HitPos + tr.HitNormal * 20
		local SpawnAng = ply:EyeAngles()
		SpawnAng.p = 0
		SpawnAng.y = SpawnAng.y + 90
		
		local ent = ents.Create( "spawned_shipment" )
		ent.SID = ply.SID
		ent:Setowning_ent( ply )
		ent:SetContents( shipment_id, 10 )
		ent:SetPos( SpawnPos )
		ent:SetAngles( SpawnAng )
		ent.nodupe = true
		ent:Spawn()
		ent:SetPlayer( ply )
		ent:PhysicsInit( SOLID_VPHYSICS )
		ent:SetMoveType( MOVETYPE_VPHYSICS )
		ent:SetSolid( SOLID_VPHYSICS )

		ent:PhysWake()
		ent.SpawnedByMayor = true
	end,
	RemoveFunction = function()
	end,
}