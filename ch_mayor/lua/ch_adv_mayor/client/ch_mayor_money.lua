CH_Mayor.VaultMoney = CH_Mayor.VaultMoney or 0
CH_Mayor.MaxVaultMoney = CH_Mayor.Config.VaultDefaultMax

net.Receive( "CH_Mayor_Net_MayorVault", function( length, ply )
	local amount = net.ReadUInt( 32 )
	local max = net.ReadUInt( 32 )
	
	CH_Mayor.VaultMoney = amount
	CH_Mayor.MaxVaultMoney = max
end )