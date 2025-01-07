CH_Mayor.AnnouncementScreenText = CH_Mayor.LangString( "No announcement at the moment" )

--[[
	Function to reset the screen
--]]
function CH_Mayor.ResetMayorAnnouncement()
	-- Update text on all screens
	for ent, value in pairs( CH_Mayor.Entities.Announcement ) do
		ent:SetAnnouncement( CH_Mayor.LangString( "No announcement at the moment" ) )
	end
	
	-- Reset serverside variable
	CH_Mayor.AnnouncementScreenText = CH_Mayor.LangString( "No announcement at the moment" )
end

--[[
	When mayor updates the mayoral announcement
--]]
net.Receive( "CH_Mayor_Net_UpdateMayorAnnouncement", function( len, ply )
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
	local text = net.ReadString()
	
	-- Perform action
	for ent, value in pairs( CH_Mayor.Entities.Announcement ) do
		ent:SetAnnouncement( text )
	end
	
	-- Send net to make screen flash
	net.Start( "CH_Mayor_Net_NewAnnouncementFlash" )
	net.Broadcast()
	
	-- Serverside variable used when spawning new entities to set text accordingly
	CH_Mayor.AnnouncementScreenText = text
	
	-- Notify everyone
	DarkRP.notifyAll( 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "The mayor has sent out an announcement. Find an announcement screen to read it!" ) )
end )