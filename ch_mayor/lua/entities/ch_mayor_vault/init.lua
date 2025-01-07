AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( "shared.lua" )

function ENT:Initialize()
	self:SetModel( "models/craphead_scripts/advanced_mayor/props/safe_01.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )
	self:SetCollisionGroup( COLLISION_GROUP_PLAYER )
	
	local phys = self:GetPhysicsObject()
	if IsValid( phys ) then
		phys:EnableMotion( false )
	end
	
	CH_Mayor.Entities.Vault = self
end

function ENT:ControlBodygroup()
	if CH_Mayor.VaultMoney <= CH_Mayor.Config.VaultBodygroupLevels[1] then
		self:SetBodygroup( 1, 0 )
	elseif CH_Mayor.VaultMoney <= CH_Mayor.Config.VaultBodygroupLevels[2] then
		self:SetBodygroup( 1, 1 )
	elseif CH_Mayor.VaultMoney <= CH_Mayor.Config.VaultBodygroupLevels[3] then
		self:SetBodygroup( 1, 2 )
	elseif CH_Mayor.VaultMoney <= CH_Mayor.Config.VaultBodygroupLevels[4] then
		self:SetBodygroup( 1, 3 )
	elseif CH_Mayor.VaultMoney <= CH_Mayor.Config.VaultBodygroupLevels[5] then
		self:SetBodygroup( 1, 4 )
	elseif CH_Mayor.VaultMoney <= CH_Mayor.Config.VaultBodygroupLevels[6] then
		self:SetBodygroup( 1, 5 )
	elseif CH_Mayor.VaultMoney <= CH_Mayor.Config.VaultBodygroupLevels[7] then
		self:SetBodygroup( 1, 6 )
	elseif CH_Mayor.VaultMoney > CH_Mayor.Config.VaultBodygroupLevels[7] then
		self:SetBodygroup( 1, 7 )
	end
end

function ENT:Use( ply )
	local cur_time = CurTime()
	
	if not ply:IsPlayer() then
		return
	end
	
	if ( self.LastUsed or 0 ) <= cur_time then
		self.LastUsed = cur_time + 1.5

		CH_Mayor.StartVaultRobbery( ply, self )
	end
end