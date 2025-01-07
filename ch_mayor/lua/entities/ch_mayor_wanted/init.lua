AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( "shared.lua" )

function ENT:SpawnFunction( ply, tr )
	if not tr.Hit then
		return
	end
	
	local SpawnPos = tr.HitPos + tr.HitNormal
	
	local ent = ents.Create( "ch_mayor_wanted" )
	ent:SetPos( SpawnPos )
	ent:SetAngles( ply:GetAngles() + Angle( 0, 90, 0 ) )
	ent:Spawn()
	
	return ent
end

function ENT:Initialize()
	self:SetModel( "models/craphead_scripts/bitminers/utility/tv.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetCollisionGroup( COLLISION_GROUP_WORLD  )
	
	self:SetModelScale( self:GetModelScale() * 1.6 )
	
	-- Activate it to update collission and freeze it
	self:Activate()
	
	local phys = self:GetPhysicsObject()
	if IsValid( phys ) then
		phys:EnableMotion( false )
	end
	
	-- Add entity to table
	CH_Mayor.Entities.Wanted[ self ] = true
end

local function CH_Mayor_UpdateWantedScreen( ply, actor, reason )
	net.Start( "CH_Mayor_Net_ReloadWantedScreen" )
	net.Broadcast()
end
hook.Add( "playerWanted", "CH_Mayor_UpdateWantedScreen", CH_Mayor_UpdateWantedScreen )
hook.Add( "playerUnWanted", "CH_Mayor_UpdateWantedScreen", CH_Mayor_UpdateWantedScreen )

function ENT:OnRemove()
	-- Remove entity from table
	CH_Mayor.Entities.Wanted[ self ] = nil
end