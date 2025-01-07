--[[
	Modify the players salary.
	It's based on if the players team is taxes.
	Additionally, it supports the economy DLC to deduct money if we have bad economy.
--]]
hook.Add( "playerGetSalary", "CH_Mayor_ModifyPaycheck", function( ply, salary )
	-- Check if the player should be taxes per their team
	local taxed = CH_Mayor.TeamTaxes[ team.GetName( ply:Team() ) ]
	
	if taxed then
		local tax_pay = math.Round( ( salary / 100 ) * taxed.team_tax )
		
		if tax_pay > 0 then
			salary = salary - tax_pay
			
			DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You've paid" ) .." ".. DarkRP.formatMoney( tax_pay ) .." ".. CH_Mayor.LangString( "in taxes to the city." ) )
			
			-- Check if the tax money goes into the city vault
			if CH_Mayor.Config.TaxMoneyGoesToCityVault then
				CH_Mayor.AddVaultMoney( tax_pay, CH_Mayor.Config.TaxMoneyCityVaultNotify )
			end
		end
	end
	
	-- First we check if the DLC is installed and control if there's economy differences
	if CH_Mayor and CH_Mayor.Economy then
		local economy_pay = math.Round( math.abs( CH_Mayor.Economy.EcoPoints / 2 ) )
		
		-- Check if there's any economy pay to give/take
		if economy_pay > 0 then
			-- If we have a positive eco, then ADD to paycheck
			if CH_Mayor.Economy.EcoPoints > 0 then
				salary = salary + economy_pay
			
				DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You've received" ) .." ".. DarkRP.formatMoney( economy_pay ) .." ".. CH_Mayor.LangString( "more in paycheck due to the good economy." ) )
			elseif CH_Mayor.Economy.EcoPoints < 0 then
				salary = salary - economy_pay
				
				DarkRP.notify( ply, 1, CH_Mayor.Config.NotificationTime, CH_Mayor.LangString( "You've received" ) .." ".. DarkRP.formatMoney( economy_pay ) .." ".. CH_Mayor.LangString( "less in paycheck due to the bad economy." ) )
			end
		end
	end
	
	if CH_Mayor.Upgrades_PaycheckBonus > 0 then
		local bonus_to_add = math.Round( ( salary / 100 ) * CH_Mayor.Upgrades_PaycheckBonus )
		salary = salary + bonus_to_add
	end
	
	return false, "[Paycheck] You've received ".. DarkRP.formatMoney( salary ) ..".", salary
end )