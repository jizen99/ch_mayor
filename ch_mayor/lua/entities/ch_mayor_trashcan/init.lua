AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( "shared.lua" )

function ENT:SpawnFunction( ply, tr )
	if not tr.Hit then
		return
	end
	
	local SpawnPos = tr.HitPos + tr.HitNormal
	
	local ent = ents.Create( "ch_mayor_trashcan" )
	ent:SetPos( SpawnPos )
	ent:SetAngles( ply:GetAngles() + Angle( 0, 180, 0 ) )
	ent:Spawn()
	ent:Activate()
	
	return ent
end

function ENT:Initialize()
	self:SetModel( CH_Mayor.Config.TrashcanModel )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetCollisionGroup( COLLISION_GROUP_PLAYER  )
	
	-- Add entity to table
	CH_Mayor.Entities.Trashcan[ self ] = true
end

function ENT:StartTouch( ent )
	if not CH_Mayor.Config.TrashcanEntities[ ent:GetClass() ] then
		return
	end
	
	-- If dropped is valid then reward money and XP if configured
	local ply = ent.CH_Mayor_WasDroppedBy
	
	if IsValid( ply ) then
		if CH_Mayor.Config.EnableTrashReward then
			local random_reward = math.random( CH_Mayor.Config.TrashcanEntities[ ent:GetClass() ][1], CH_Mayor.Config.TrashcanEntities[ ent:GetClass() ][2] )
			
			DarkRP.notify( ply, 1, 5, "+".. DarkRP.formatMoney( random_reward ) .." ".. CH_Mayor.LangString( "for throwing this item in the trash." ) )

			ply:addMoney( random_reward )
			
			-- bLogs support
			hook.Run( "CH_Mayor_TrashedItem", ply, ent:GetClass(), random_reward )
		end
		
		if CH_Mayor.Config.EnableTrashXPReward then
			CH_Mayor.GiveXP( ply, CH_Mayor.Config.TrashXPReward, CH_Mayor.LangString( "for throwing this item in the trash." ) )
		end
	end
	
	SafeRemoveEntityDelayed( ent, 0 )
end

local function CH_Mayor_PickupEntity( ply, ent )
	if CH_Mayor.Config.TrashcanEntities[ ent:GetClass() ] then
		ent.CH_Mayor_WasDroppedBy = ply
	end
end
hook.Add( "OnPhysgunPickup", "CH_Mayor_PickupEntity", CH_Mayor_PickupEntity )
hook.Add( "GravGunOnPickedUp", "CH_Mayor_PickupEntity", CH_Mayor_PickupEntity )

function ENT:OnRemove()
	-- Remove entity from table
	CH_Mayor.Entities.Trashcan[ self ] = nil
end