CH_Mayor.UpgradeLevels = {}

net.Receive( "CH_Mayor_Net_NetworkUpgradeLevels", function( len, ply )
	local amount_of_entries = net.ReadUInt( 6 )
	
	for i = 1, amount_of_entries do
		local name = net.ReadString()
		local level = net.ReadUInt( 6 )
		
		CH_Mayor.UpgradeLevels[ name ] = level
	end
end )