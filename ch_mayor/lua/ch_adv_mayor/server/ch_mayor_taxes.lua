--[[
	Called when the server is initialized
--]]
function CH_Mayor.SetupTeamTaxes()
	CH_Mayor.TeamTaxes = {}
	local darkrp_teams = {}
	
	-- Grab some values from the darkrp teams
	for k, v in ipairs( RPExtraTeams ) do
		if istable( v.model ) then
			v.model = v.model[ math.random( #v.model ) ]
		end
		
		darkrp_teams[ v.name ] = {
			pay = v.salary,
			mdl = v.model,
		}
	end
	
	-- Loop through the teams we want taxes for and insert salaries and taxes into TeamTaxes table
	for name, tax in pairs( CH_Mayor.Config.TeamsTaxes ) do
		if not darkrp_teams[ name ] then
			continue
		end
		
		CH_Mayor.TeamTaxes[ name ] = {
			team_salary = darkrp_teams[ name ].pay,
			team_tax = tax,
			team_model = darkrp_teams[ name ].mdl,
		}
	end
end

--[[
	When mayor updates the taxes from his menu
--]]
net.Receive( "CH_Mayor_Net_UpdateTeamTax", function( len, ply )
	local cur_time = CurTime()
	
	if ( ply.CH_Mayor_NetDelay or 0 ) > cur_time then
		ply:ChatPrint( "You're running the command too fast. Slow down champ!" )
		return
	end
	ply.CH_Mayor_NetDelay = cur_time + 0.5
	
	-- Check if player is mayor
	if not ply:CH_Mayor_IsMayor() then
		return
	end
	
	-- Read net
	local team = net.ReadString()
	local tax = net.ReadUInt( 7 )
	
	-- Check that team exists
	if not CH_Mayor.TeamTaxes[ team ] then
		return
	end
	
	-- Check tax is positive
	if tax <= 0 then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You must set a positive number." ) )
		return
	end
	
	-- Perform action
	CH_Mayor.TeamTaxes[ team ].team_tax = math.Clamp( tax, 0, CH_Mayor.Config.MaximumTeamTax )
	
	DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You have updated the team tax for" ) .." ".. team )
	
	-- Network it to mayor
	local mayor = CH_Mayor.GetMayor()
	if IsValid( mayor ) then
		CH_Mayor.NetworkTeamTaxes( ply )
	end
end )

--[[
	Network all team taxes to the mayor
--]]
function CH_Mayor.NetworkTeamTaxes( ply )
	local table_length = table.Count( CH_Mayor.TeamTaxes )

	net.Start( "CH_Mayor_Net_NetworkTeamTaxes" )
		net.WriteUInt( table_length, 6 )
	
		for k, v in pairs( CH_Mayor.TeamTaxes ) do
			net.WriteString( k )
			net.WriteUInt( v.team_salary, 32 )
			net.WriteUInt( v.team_tax, 32 )
			net.WriteString( v.team_model )
		end
	net.Send( ply )
end

--[[
	Lazy admin command to set some random 
--]]
local function CH_Mayor_GenerateRandomTaxes( ply )
	if not ply:IsSuperAdmin() then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "Only administrators can perform this action." ) )
		return
	end
	
	local random_taxes = {}
	
	-- Loop into RPExtraTeams (darkrp teams) and write into our random table.
	for k, v in ipairs( RPExtraTeams ) do
		if istable( v.model ) then
			v.model = v.model[ math.random( #v.model ) ]
		end
		
		local random_tax = math.random( 10, 30 )
		
		random_taxes[ v.name ] = random_tax
	end
	
	-- Once done print the table to the console
	print( "CH_Mayor.Config.TeamsTaxes = {" )
	for k, v in pairs( random_taxes ) do
		print( "[\"".. k .."\"] = ".. v .."," )
	end
	print( "}" )
end
concommand.Add( "ch_mayor_randomtaxes", CH_Mayor_GenerateRandomTaxes )