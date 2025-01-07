local MODULE = GAS.Logging:MODULE()

MODULE.Category = "CH Mayor"
MODULE.Name = "Catalog"
MODULE.Colour = Color( 150, 0, 0 )  

MODULE:Setup( function()
	MODULE:Hook( "CH_Mayor_CatalogBuy", "mayor_catalog_buy", function( ply, item, price )
		MODULE:Log( "{1} has bought {2} for {3} from the catalog.", GAS.Logging:FormatPlayer( ply ), GAS.Logging:Highlight( item ), GAS.Logging:FormatMoney( price ) )
	end )
	
	MODULE:Hook( "CH_Mayor_CatalogReset", "mayor_catalog_reset", function()
		MODULE:Log( "The mayor has left and the catalog items has been reset." )
	end )
end )

GAS.Logging:AddModule(MODULE)

-- 76561198422234222