--[[
	Network leaderboards to the client
--]]
net.Receive( "CH_Mayor_Net_InitLeaderboards", function( len, ply )
	local cur_time = CurTime()
	
	if ( ply.CH_Mayor_NetDelay or 0 ) > cur_time then
		ply:ChatPrint( "You're running the command too fast. Slow down champ!" )
		return
	end
	ply.CH_Mayor_NetDelay = cur_time + 60
	
	-- Select query to get the stats table and send the top 10
	CH_Mayor.SQL.Query( "SELECT * FROM ch_mayor_stats ORDER BY WarrantsPlaced DESC LIMIT 10;", function( data )
		if data then
			local table_length = #data
			
			-- Network it to the client as efficient as possible
			net.Start( "CH_Mayor_Net_Leaderboards" )
				net.WriteString( "WarrantsPlaced" )
				net.WriteUInt( table_length, 4 )

				for key, lead in ipairs( data ) do
					net.WriteString( lead.Nick )
					net.WriteDouble( lead.WarrantsPlaced )
				end
			net.Send( ply )
		end
	end, false )

	-- Select query to get the stats table and send the top 10
	CH_Mayor.SQL.Query( "SELECT * FROM ch_mayor_stats ORDER BY PlayersWanted DESC LIMIT 10;", function( data )
		if data then
			local table_length = #data
			
			-- Network it to the client as efficient as possible
			net.Start( "CH_Mayor_Net_Leaderboards" )
				net.WriteString( "PlayersWanted" )
				net.WriteUInt( table_length, 4 )

				for key, lead in ipairs( data ) do
					net.WriteString( lead.Nick )
					net.WriteDouble( lead.PlayersWanted )
				end
			net.Send( ply )
		end
	end, false )

	-- Select query to get the stats table and send the top 10
	CH_Mayor.SQL.Query( "SELECT * FROM ch_mayor_stats ORDER BY TimesElected DESC LIMIT 10;", function( data )
		if data then
			local table_length = #data
			
			-- Network it to the client as efficient as possible
			net.Start( "CH_Mayor_Net_Leaderboards" )
				net.WriteString( "TimesElected" )
				net.WriteUInt( table_length, 4 )

				for key, lead in ipairs( data ) do
					net.WriteString( lead.Nick )
					net.WriteDouble( lead.TimesElected )
				end
			net.Send( ply )
		end
	end, false )
	
	-- Select query to get the stats table and send the top 10
	CH_Mayor.SQL.Query( "SELECT * FROM ch_mayor_stats ORDER BY VaultRobbed DESC LIMIT 10;", function( data )
		if data then
			local table_length = #data
			
			-- Network it to the client as efficient as possible
			net.Start( "CH_Mayor_Net_Leaderboards" )
				net.WriteString( "VaultRobbed" )
				net.WriteUInt( table_length, 4 )

				for key, lead in ipairs( data ) do
					net.WriteString( lead.Nick )
					net.WriteDouble( lead.VaultRobbed )
				end
			net.Send( ply )
		end
	end, false )

	-- Select query to get the stats table and send the top 10
	CH_Mayor.SQL.Query( "SELECT * FROM ch_mayor_stats ORDER BY TotalPlaytime DESC LIMIT 10;", function( data )
		if data then
			local table_length = #data
			
			-- Network it to the client as efficient as possible
			net.Start( "CH_Mayor_Net_Leaderboards" )
				net.WriteString( "TotalPlaytime" )
				net.WriteUInt( table_length, 4 )

				for key, lead in ipairs( data ) do
					net.WriteString( lead.Nick )
					net.WriteDouble( lead.TotalPlaytime )
				end
			net.Send( ply )
		end
	end, false )

	-- Select query to get the stats table and send the top 10
	CH_Mayor.SQL.Query( "SELECT * FROM ch_mayor_stats ORDER BY PlayersDemoted DESC LIMIT 10;", function( data )
		if data then
			local table_length = #data
			
			-- Network it to the client as efficient as possible
			net.Start( "CH_Mayor_Net_Leaderboards" )
				net.WriteString( "PlayersDemoted" )
				net.WriteUInt( table_length, 4 )

				for key, lead in ipairs( data ) do
					net.WriteString( lead.Nick )
					net.WriteDouble( lead.PlayersDemoted )
				end
			net.Send( ply )
		end
	end, false )
	
	-- Select query to get the stats table and send the top 10
	CH_Mayor.SQL.Query( "SELECT * FROM ch_mayor_stats ORDER BY PlayersPromoted DESC LIMIT 10;", function( data )
		if data then
			local table_length = #data
			
			-- Network it to the client as efficient as possible
			net.Start( "CH_Mayor_Net_Leaderboards" )
				net.WriteString( "PlayersPromoted" )
				net.WriteUInt( table_length, 4 )

				for key, lead in ipairs( data ) do
					net.WriteString( lead.Nick )
					net.WriteDouble( lead.PlayersPromoted )
				end
			net.Send( ply )
		end
	end, false )
	
	-- Select query to get the stats table and send the top 10
	CH_Mayor.SQL.Query( "SELECT * FROM ch_mayor_stats ORDER BY CapitalAdded DESC LIMIT 10;", function( data )
		if data then
			local table_length = #data
			
			-- Network it to the client as efficient as possible
			net.Start( "CH_Mayor_Net_Leaderboards" )
				net.WriteString( "CapitalAdded" )
				net.WriteUInt( table_length, 4 )

				for key, lead in ipairs( data ) do
					net.WriteString( lead.Nick )
					net.WriteDouble( lead.CapitalAdded )
				end
			net.Send( ply )
		end
	end, false )
	
	-- Select query to get the stats table and send the top 10
	CH_Mayor.SQL.Query( "SELECT * FROM ch_mayor_stats ORDER BY LockdownsInitiated DESC LIMIT 10;", function( data )
		if data then
			local table_length = #data
			
			-- Network it to the client as efficient as possible
			net.Start( "CH_Mayor_Net_Leaderboards" )
				net.WriteString( "LockdownsInitiated" )
				net.WriteUInt( table_length, 4 )

				for key, lead in ipairs( data ) do
					net.WriteString( lead.Nick )
					net.WriteDouble( lead.LockdownsInitiated )
				end
			net.Send( ply )
		end
	end, false )
	
	-- Select query to get the stats table and send the top 10
	CH_Mayor.SQL.Query( "SELECT * FROM ch_mayor_stats ORDER BY LotteriesStarted DESC LIMIT 10;", function( data )
		if data then
			local table_length = #data
			
			-- Network it to the client as efficient as possible
			net.Start( "CH_Mayor_Net_Leaderboards" )
				net.WriteString( "LotteriesStarted" )
				net.WriteUInt( table_length, 4 )

				for key, lead in ipairs( data ) do
					net.WriteString( lead.Nick )
					net.WriteDouble( lead.LotteriesStarted )
				end
			net.Send( ply )
		end
	end, false )
end )