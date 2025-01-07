local MODULE = GAS.Logging:MODULE()

MODULE.Category = "CH Mayor"
MODULE.Name = "Vault Actions"
MODULE.Colour = Color( 150, 0, 0 )  

MODULE:Setup( function()
	MODULE:Hook( "CH_Mayor_Vault_WithdrawMoney", "mayor_vault_withdraw", function( ply, money )
		MODULE:Log( "{1} has withdrawn {2} from the mayor vault.", GAS.Logging:FormatPlayer( ply ), GAS.Logging:FormatMoney( money ) )
	end )
	
	MODULE:Hook( "CH_Mayor_Vault_DepositMoney", "mayor_vault_deposit", function( ply, money )
		MODULE:Log( "{1} has deposited {2} into the mayor vault.", GAS.Logging:FormatPlayer( ply ), GAS.Logging:FormatMoney( money ) )
	end )
end )

GAS.Logging:AddModule(MODULE)

-- 76561198422234222