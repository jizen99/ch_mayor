--[[
	Purchase an item from the mayors catalog
--]]
net.Receive( "CH_Mayor_Net_BuyCatalogItem", function( len, ply )
	local cur_time = CurTime()
	
	if ( ply.CH_Mayor_NetDelay or 0 ) > cur_time then
		ply:ChatPrint( "You're running the command too fast. Slow down champ!" )
		return
	end
	ply.CH_Mayor_NetDelay = cur_time + 0.5
	
	-- Check if player is mayor
	if not ply:CH_Mayor_IsMayor() then
		return
	end
	
	-- Read net
	local item_key = net.ReadString()
	local item = CH_Mayor.Catalog[ item_key ]
	
	-- Check that item exists in catalog table.
	if not item then
		return
	end
	
	-- Check that mayor can afford items price
	local price = item.Price
	
	if price > CH_Mayor.VaultMoney then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You cannot afford this!" ) )
		return
	end
	
	-- Run customCheck
	if not item.CustomCheck( ply ) then
		DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, item.CustomCheckFailMessage )
		return
	end
	
	-- Can afford so go run lua code pls
	item.BuyFunction( ply )
	
	-- Take money
	CH_Mayor.TakeVaultMoney( price )
	
	-- Notify
	DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You have purchased" ) .." ".. item.Name )
	
	-- bLogs support
	hook.Run( "CH_Mayor_CatalogBuy", ply, item.Name, price )
end )

--[[
	Function to reset catalog items
--]]
function CH_Mayor.ResetCatalogItems()
	-- Remove entities bought through catalog (if enabled)
	if CH_Mayor.Config.RemoveCatalogEntsOnDemote then
		for k, ent in ipairs( ents.GetAll() ) do
			if ent.SpawnedByMayor then
				ent:Remove()
			end
		end
	end
	
	-- Run remove function for all catalog items
	for k, item in pairs( CH_Mayor.Catalog ) do
		if item.RemoveFunction != nil then
			item.RemoveFunction()
		end
	end
	
	-- bLogs support
	hook.Run( "CH_Mayor_CatalogReset" )
end