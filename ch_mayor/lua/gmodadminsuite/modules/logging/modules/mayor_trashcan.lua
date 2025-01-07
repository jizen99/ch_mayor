local MODULE = GAS.Logging:MODULE()

MODULE.Category = "CH Mayor"
MODULE.Name = "Trashcan"
MODULE.Colour = Color( 150, 0, 0 )  

MODULE:Setup( function()
	MODULE:Hook( "CH_Mayor_TrashedItem", "mayor_trashed_item_in_trashcan", function( ply, ent, money )
		MODULE:Log( "{1} has trashed {2} and received {3}.", GAS.Logging:FormatPlayer( ply ), GAS.Logging:Highlight( ent ), GAS.Logging:FormatMoney( money )	)
	end )
end )

GAS.Logging:AddModule(MODULE)

-- 76561198422234222