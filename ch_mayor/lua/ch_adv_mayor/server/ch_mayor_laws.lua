CH_Mayor.Laws = CH_Mayor.Laws or {}

--[[
	Multiple elements of this is from DarkRPs code:
	Credits: https://github.com/FPtje/DarkRP/search?q=addLaw
--]]

--[[
	When a law is added via darkrps usual chat commands we write it to our table.
--]]
function CH_Mayor.LawAdded( num, law )
	table.insert( CH_Mayor.Laws, law )
	
	-- If notify all is enabled
	timer.Simple( 0.1, function()
		if CH_Mayor.Config.NotifyAllOnNewLaw then
			local mayor = CH_Mayor.GetMayor()
			
			-- Only throw notification if mayor is valid (because if not that means it will throw the new law on demoted 3 times)
			if IsValid( mayor ) then
				DarkRP.notifyAll( 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "The mayor has added a new law. Please find a city board to stay up to date!" ) )
			end
		end
	end )
end
hook.Add( "addLaw", "CH_Mayor.LawAdded", CH_Mayor.LawAdded )

--[[
	When a law is removed via darkrps usual chat commands we remove it from our table.
--]]
function CH_Mayor.LawRemoved( num, law )
	table.remove( CH_Mayor.Laws, num )
end
hook.Add( "removeLaw", "CH_Mayor.LawRemoved", CH_Mayor.LawRemoved )

--[[
	When laws are reset we also empty our table.
--]]
function CH_Mayor.LawsReset()
	CH_Mayor.Laws = {}
	
	fn.Foldl(function(val,v) CH_Mayor.LawAdded( 0, v ) end, nil, GAMEMODE.Config.DefaultLaws)
end
hook.Add( "resetLaws", "CH_Mayor.LawsReset", CH_Mayor.LawsReset )

--[[
	Initialize laws to player since this is first join
--]]
function CH_Mayor.LawInitialize( ply )
	for k, v in ipairs( CH_Mayor.Laws ) do
		net.Start( "CH_Mayor_Net_AddLaw" )
			net.WriteString( v )
		net.Send( ply )
	end
end
hook.Add( "addLaw", "CH_Mayor.LawAdded", CH_Mayor.LawAdded )