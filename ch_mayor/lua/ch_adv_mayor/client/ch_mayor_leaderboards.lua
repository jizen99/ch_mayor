CH_Mayor.Leaderboards = CH_Mayor.Leaderboards or {}

--[[
	Receive the leaderboard and update the CL table
--]]
net.Receive( "CH_Mayor_Net_Leaderboards", function( len, ply )
	local ply = LocalPlayer()
	local temp_table = {}
	
	local leaderboard = net.ReadString()
	local amount_of_entries = net.ReadUInt( 4 )
	
	for i = 1, amount_of_entries do
		temp_table[ i ] = {
			Name = net.ReadString(),
			Amount = net.ReadDouble(),
		}
	end
	
	CH_Mayor.Leaderboards[ leaderboard ] = temp_table
end )