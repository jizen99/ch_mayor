CH_Mayor.SQL = CH_Mayor.SQL or {}

--[[
	Configure your SQL details
--]]
CH_Mayor.SQL.UseMySQLOO = false

CH_Mayor.SQL.Host = ""
CH_Mayor.SQL.Username = ""
CH_Mayor.SQL.Password = ""
CH_Mayor.SQL.Database = ""
CH_Mayor.SQL.Port = 3306

--[[
	Require mysqloo if enabled, connect to database and add the sqlquery and create table functions.
	
	Or else just create query and create table functions for sqlite 
--]]
local function CH_Mayor_CreateSQLTables()
	CH_Mayor.SQL.CreateTables( "ch_mayor_vault", [[
		Money INT DEFAULT 0
	]] )
	
	CH_Mayor.SQL.CreateTables( "ch_mayor_stats", [[
		WarrantsPlaced INT DEFAULT 0,
		PlayersWanted INT DEFAULT 0,
		TimesElected INT DEFAULT 0,
		VaultRobbed INT DEFAULT 0,
		TotalPlaytime INT DEFAULT 0,
		PlayersDemoted INT DEFAULT 0,
		PlayersPromoted INT DEFAULT 0,
		CapitalAdded INT DEFAULT 0,
		LockdownsInitiated INT DEFAULT 0,
		LotteriesStarted INT DEFAULT 0,
		Nick VARCHAR(20) NOT NULL UNIQUE,
		SteamID VARCHAR(20) NOT NULL UNIQUE
	]] )
end

if CH_Mayor.SQL.UseMySQLOO then
    require( "mysqloo" )
	
	-- Setup the sql connection
    CH_Mayor.SQL.DB = mysqloo.connect( CH_Mayor.SQL.Host, CH_Mayor.SQL.Username, CH_Mayor.SQL.Password, CH_Mayor.SQL.Database, CH_Mayor.SQL.Port )
	
	-- What to do if successfully connected
    CH_Mayor.SQL.DB.onConnected = function() 
        print( "[CH Mayor MySQL] Database has connected!" ) 
        CH_Mayor_CreateSQLTables()
    end
	
	-- Print error to console if we fail
    CH_Mayor.SQL.DB.onConnectionFailed = function( db, err )
		print( "[CH Mayor MySQL] Connection to database failed! Error: " .. err )
	end
	
	-- Connect
    CH_Mayor.SQL.DB:connect()
    
	-- Here's our MySQL query function
    function CH_Mayor.SQL.Query( query, func, singleRow )
        local query = CH_Mayor.SQL.DB:query( query )
		
        if func then
            function query:onSuccess( data ) 
                if singleRow then
                    data = data[1]
                end
    
                func( data ) 
            end
        end
		
        function query:onError( err )
			print( "[CH Mayor MySQL] An error occured while executing the query: " .. err )
		end
		
        query:start()
    end

    function CH_Mayor.SQL.CreateTables( tableName, sqlLiteQuery, mySqlQuery )
        CH_Mayor.SQL.Query( "CREATE TABLE IF NOT EXISTS " .. tableName .. " ( " .. ( mySqlQuery or sqlLiteQuery ) .. " );" )
        print( "[CH Mayor MySQL] " .. tableName .. " table validated!" )
    end    
else
    function CH_Mayor.SQL.Query( querystr, func, singleRow )
        local query
        if not singleRow then
            query = sql.Query( querystr )
        else
            query = sql.QueryRow( querystr, 1 )
        end
        
        if query == false then
            print( "[CH Mayor SQLite] ERROR", sql.LastError() )
        elseif func then
            func( query )
        end
    end

    function CH_Mayor.SQL.CreateTables( tableName, sqlLiteQuery, mySqlQuery )
        if not sql.TableExists( tableName ) then
            CH_Mayor.SQL.Query( "CREATE TABLE " .. tableName .. " ( " .. ( sqlLiteQuery or mySqlQuery ) .. " );" )
        end

        print( "[CH Mayor SQLite] " .. tableName .. " table validated!" )
    end
	
	CH_Mayor_CreateSQLTables()
end