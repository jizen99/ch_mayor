local MODULE = GAS.Logging:MODULE()

MODULE.Category = "CH Mayor"
MODULE.Name = "Robbery"
MODULE.Colour = Color( 150, 0, 0 )  

MODULE:Setup( function()
	MODULE:Hook( "CH_Mayor_RobberyInitiated", "mayor_vault_robbery_initiated", function( ply )
		MODULE:Log( "{1} has started a robbery on the mayor vault.", GAS.Logging:FormatPlayer( ply ) )
	end )
	
	MODULE:Hook( "CH_Mayor_RobberySuccessful", "mayor_vault_robbery_successful", function( ply, money )
		MODULE:Log( "{1} has successfully robbed the mayor vault and got away with {2}.", GAS.Logging:FormatPlayer( ply ), GAS.Logging:FormatMoney( money )	)
	end )
	
	MODULE:Hook( "CH_Mayor_RobberyFailed", "mayor_vault_robbery_failed", function( ply )
		MODULE:Log( "{1} has failed robbing the mayor vault.", GAS.Logging:FormatPlayer( ply ) )
	end )
end )

GAS.Logging:AddModule(MODULE)

-- 76561198422234222