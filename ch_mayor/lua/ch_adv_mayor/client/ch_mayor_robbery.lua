CH_Mayor.Vault = CH_Mayor.Vault or {}

net.Receive( "CH_Mayor_RestartCooldown", function( length, ply )
	local cooldowntime = CH_Mayor.Config.RobberyCooldownTime * 60
	
	CH_Mayor.Vault.Cooldown = CurTime() + cooldowntime
end )

net.Receive( "CH_Mayor_StopCooldown", function( length, ply )
	CH_Mayor.Vault.Cooldown = 0
end )

net.Receive( "CH_Mayor_RestartTimer", function( length, ply )
	local countdowntime = CH_Mayor.Config.RobberyAliveTime * 60
	local cur_time = CurTime()
	
	CH_Mayor.Vault.Countdown = cur_time + countdowntime
end )

net.Receive( "CH_Mayor_StopTimer", function( length, ply )
	CH_Mayor.Vault.Countdown = 0
end )