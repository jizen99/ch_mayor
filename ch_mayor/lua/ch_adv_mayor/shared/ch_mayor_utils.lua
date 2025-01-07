local PMETA = FindMetaTable( "Player" )

--[[
	Language functions
--]]
function CH_Mayor.LangString( text )
	local translation = text --.." (Translation missing)"
	local lang = CH_Mayor.Config.Language or "en"
	
	if CH_Mayor.Config.Lang[ text ] then
		translation = CH_Mayor.Config.Lang[ text ][ lang ]
	end
	
	return translation
end

--[[
	Check if player is mayor
--]]
function PMETA:CH_Mayor_IsMayor()
	return team.GetName( self:Team() ) == CH_Mayor.Config.MayorTeam
end

function PMETA:CH_Mayor_IsGovTeam()
	return CH_Mayor.Config.GovernmentTeams[ team.GetName( self:Team() ) ]
end

function PMETA:CH_Mayor_IsPoliceTeam()
	return CH_Mayor.Config.PoliceTeams[ team.GetName( self:Team() ) ]
end

function PMETA:CH_Mayor_IsCriminalTeam()
	return CH_Mayor.Config.CriminalTeams[ team.GetName( self:Team() ) ]
end

--[[
	Get the mayor
--]]
function CH_Mayor.GetMayor()
	local mayor = nil
	
	for k, ply in ipairs( player.GetAll() ) do
		if CH_Mayor.Config.MayorTeam == team.GetName( ply:Team() ) then
			mayor = ply
			
			break
		end
	end
	
	return mayor
end

--[[
	Get amount of government teams
--]]
function CH_Mayor.GetGovCount()
	local amount = 0
	
	for k, ply in ipairs( player.GetAll() ) do
		if ply:CH_Mayor_IsGovTeam() then
			amount = amount + 1
		end
	end
	
	return amount
end

--[[
	Get amount of police teams
--]]
function CH_Mayor.GetPoliceCount()
	local amount = 0
	
	for k, ply in ipairs( player.GetAll() ) do
		if ply:CH_Mayor_IsPoliceTeam() then
			amount = amount + 1
		end
	end
	
	return amount
end