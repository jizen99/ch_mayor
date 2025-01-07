ENT.Base 					= "base_gmodentity"
ENT.Type 					= "anim"

ENT.PrintName				= "Mayor Announcements"
ENT.Author					= "Crap-Head"
ENT.Category 				= "Mayor by Crap-Head"

ENT.Spawnable				= true
ENT.AdminSpawnable			= true

ENT.RenderGroup 			= RENDERGROUP_TRANSLUCENT
ENT.AutomaticFrameAdvance 	= true

function ENT:SetupDataTables()
	self:NetworkVar( "String", 0, "Announcement" )
end