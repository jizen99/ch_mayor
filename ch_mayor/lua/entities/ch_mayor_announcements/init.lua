AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( "shared.lua" )

function ENT:SpawnFunction( ply, tr )
	if not tr.Hit then
		return
	end
	
	local SpawnPos = tr.HitPos + tr.HitNormal
	
	local ent = ents.Create( "ch_mayor_announcements" )
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
	
	self:SetAnnouncement( CH_Mayor.AnnouncementScreenText )
	self:SetModelScale( self:GetModelScale() * 1.6 )
	
	-- Activate it to update collission and freeze it
	self:Activate()
	
	local phys = self:GetPhysicsObject()
	if IsValid( phys ) then
		phys:EnableMotion( false )
	end
	
	-- Add entity to table
	CH_Mayor.Entities.Announcement[ self ] = true
end

function ENT:OnRemove()
	-- Remove entity from table
	CH_Mayor.Entities.Announcement[ self ] = nil
end