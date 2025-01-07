--[[
	Called when the mayor is elected.
	Load their stats if it exists or else create new row
--]]
function CH_Mayor.InitMayorStats( ply )
	-- Select query to get their stats
	CH_Mayor.SQL.Query( "SELECT * FROM ch_mayor_stats WHERE SteamID = '" .. ply:SteamID64() .. "';", function( data )
		if data then
			-- Make table
			ply.CH_Mayor_Stats = {}
			
			-- Loop through the data and write into stats table
			for stat, amount in pairs( data ) do
				-- Skip the steamid and nick row
				if stat == "SteamID" or stat == "Nick" then
					continue
				end
				
				-- Write value to stats table
				ply.CH_Mayor_Stats[ stat ] = tonumber( amount )
			end
			
			-- Network it
			CH_Mayor.NetworkMayorStats( ply )
			
			-- Update their nick in the database
			CH_Mayor.SQL.Query( "UPDATE ch_mayor_stats SET Nick = '" .. ply:Nick() .. "' WHERE SteamID = '" .. ply:SteamID64() .. "';" )
		else
			CH_Mayor.CreateMayorStats( ply )
		end
		
		-- Add stats
		CH_Mayor.AddStat( ply, "TimesElected", 1 )
	end, true )
end

--[[
	Called if we need to create new stats for the mayor (first time)
--]]
function CH_Mayor.CreateMayorStats( ply )
	-- Write the player into the stats table
	CH_Mayor.SQL.Query( "INSERT INTO ch_mayor_stats ( WarrantsPlaced, PlayersWanted, TimesElected, VaultRobbed, TotalPlaytime, PlayersDemoted, PlayersPromoted, CapitalAdded, LockdownsInitiated, LotteriesStarted, Nick, SteamID ) VALUES( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '" .. ply:Nick() .. "', '" .. ply:SteamID64() .. "' );" )
	
	-- Create their mining stat table
	ply.CH_Mayor_Stats = {
		["WarrantsPlaced"] = 0,
		["PlayersWanted"] = 0,
		["TimesElected"] = 0,
		["VaultRobbed"] = 0,
		["TotalPlaytime"] = 0,
		["PlayersDemoted"] = 0,
		["PlayersPromoted"] = 0,
		["CapitalAdded"] = 0,
		["LockdownsInitiated"] = 0,
		["LotteriesStarted"] = 0,
	}
	
	-- Network
	CH_Mayor.NetworkMayorStats( ply )
end

--[[
	Add mayoral stat function
--]]
function CH_Mayor.AddStat( ply, stat, amount )
	-- Check if stat exists in table
	if not ply.CH_Mayor_Stats[ stat ] then
		print( "ERROR: Stat does not exist!" )
		print( stat )
		return
	end
	
	-- Update value in their stats table
	ply.CH_Mayor_Stats[ stat ] = tonumber( ply.CH_Mayor_Stats[ stat ] + amount )

	-- Network it
	CH_Mayor.NetworkMayorStats( ply )
	
	-- Saving
	CH_Mayor.SaveMayorStats( ply, stat, ply.CH_Mayor_Stats[ stat ] )
end

--[[
	Save the mayor stat to their table.
--]]
function CH_Mayor.SaveMayorStats( ply, stat, amount )
	CH_Mayor.SQL.Query( "UPDATE ch_mayor_stats SET " .. stat .. " = '" .. amount .. "' WHERE SteamID = '" .. ply:SteamID64() .. "';" )
end

--[[
	Network the mayor stats to the player
--]]
function CH_Mayor.NetworkMayorStats( ply )
	-- Send the data to the client
	net.Start( "CH_Mayor_Net_MayorStats" )
		net.WriteUInt( ply.CH_Mayor_Stats["WarrantsPlaced"], 32 )
		net.WriteUInt( ply.CH_Mayor_Stats["PlayersWanted"], 32 )
		net.WriteUInt( ply.CH_Mayor_Stats["TimesElected"], 32 )
		net.WriteUInt( ply.CH_Mayor_Stats["VaultRobbed"], 32 )
		net.WriteUInt( ply.CH_Mayor_Stats["TotalPlaytime"], 32 )
		net.WriteUInt( ply.CH_Mayor_Stats["PlayersDemoted"], 32 )
		net.WriteUInt( ply.CH_Mayor_Stats["PlayersPromoted"], 32 )
		net.WriteUInt( ply.CH_Mayor_Stats["CapitalAdded"], 32 )
		net.WriteUInt( ply.CH_Mayor_Stats["LockdownsInitiated"], 32 )
		net.WriteUInt( ply.CH_Mayor_Stats["LotteriesStarted"], 32 )
	net.Send( ply )
end

--[[
	Hooks to add stats respectively
--]]
local function CH_Mayor_Stats_PlayerWarranted( ply, warranter, reason )
	CH_Mayor.AddStat( warranter, "WarrantsPlaced", 1 )
end
hook.Add( "playerWarranted", "CH_Mayor_Stats_PlayerWarranted", CH_Mayor_Stats_PlayerWarranted )

local function CH_Mayor_Stats_PlayerWanted( ply, actor, reason )
	CH_Mayor.AddStat( actor, "PlayersWanted", 1 )
end
hook.Add( "playerWanted", "CH_Mayor_Stats_PlayerWanted", CH_Mayor_Stats_PlayerWanted )

-- TimesElected is found in ch_mayor_hooks.lua OnPlayerChangedTeam

-- VaultRobbed is found in ch_mayor_robbery when a robbery is successful

-- TotalPlaytime just takes the playtime from the players stat table

-- PlayersDemoted is found in ch_mayor_civilians when a player is demoted

-- PlayersPromoted is found in ch_mayor_civilians when a player is promoted

-- CapitalAdded is found in ch_mayor_vault when depositing money

local function CH_Mayor_Stats_LockdownStarted( ply )
	CH_Mayor.AddStat( ply, "LockdownsInitiated", 1 )
end
hook.Add( "lockdownStarted", "CH_Mayor_Stats_LockdownStarted", CH_Mayor_Stats_LockdownStarted )

local function CH_Mayor_Stats_LotteryStarted( ply, amount )
	CH_Mayor.AddStat( ply, "LotteriesStarted", 1 )
end
hook.Add( "lotteryStarted", "CH_Mayor_Stats_LotteryStarted", CH_Mayor_Stats_LotteryStarted )