CH_Mayor.DepositAmount = 0
CH_Mayor.DepositLimit = CH_Mayor.Config.DepositMaximumPerMayor

CH_Mayor.WithdrawAmount = 0
CH_Mayor.WithdrawLimit = CH_Mayor.Config.WithdrawMaximumPerMayor

net.Receive( "CH_Mayor_Net_NetworkWithdrawDepositLimit", function( length, ply )
	local deposit = net.ReadUInt( 32 )
	local deposit_max = net.ReadUInt( 32 )
	
	local withdraw = net.ReadUInt( 32 )
	local withdraw_max = net.ReadUInt( 32 )
	
	CH_Mayor.DepositAmount = deposit
	CH_Mayor.DepositLimit = deposit_max

	CH_Mayor.WithdrawAmount = withdraw
	CH_Mayor.WithdrawLimit = withdraw_max
end )