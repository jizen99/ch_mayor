local MODULE = GAS.Logging:MODULE()

MODULE.Category = "CH Mayor"
MODULE.Name = "Upgrades"
MODULE.Colour = Color( 150, 0, 0 )  

MODULE:Setup( function()
	MODULE:Hook( "CH_Mayor_UpgradeBuy", "mayor_upgrade_buy", function( ply, upgrade, level, price )
		MODULE:Log( "{1} has upgraded {2} to level {3} for {4}.", GAS.Logging:FormatPlayer( ply ), GAS.Logging:Highlight( upgrade ), GAS.Logging:Highlight( level ), GAS.Logging:FormatMoney( price ) )
	end )
	
	MODULE:Hook( "CH_Mayor_UpgradeReset", "mayor_upgrade_reset", function()
		MODULE:Log( "The mayor has left and all upgrades has been reset." )
	end )
end )

GAS.Logging:AddModule(MODULE)

-- 76561198422234222