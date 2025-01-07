--[[
	Function to check if a player is close to the mayor vault
--]]
function CH_Mayor.IsPlayerCloseToVault( ply )
	local is_close = false
	
	local vault = CH_Mayor.Entities.Vault
	if IsValid( vault ) and ( ply:GetPos():DistToSqr( vault:GetPos() ) <= 35000 ) then
		is_close = true
	end

	return is_close
end