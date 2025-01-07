--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000
--[[------------------------------
EXPLANATION
You would need to add "Onyx Store" into configuration, search by phrase: cfg:SetCurrency
Example for multiple currencies: cfg:SetCurrency({"DarkRP", "Onyx Store"})
--------------------------------]]

local CURRENCY = {}
CURRENCY.Name = 'Credits'

function CURRENCY:Add(ply, amt)
    if (amt == 0) then return end
    if (amt < 0) then
        onyx.creditstore:TakeCredits(ply, math.abs(amt))
    else
        onyx.creditstore:AddCredits(ply, amt)
    end
end

function CURRENCY:CanAfford(ply, amount)
    local credits = onyx.creditstore:GetCredits(ply)
    local isBusy = ply:onyx_GetNetVar('store_busy')

    if (isBusy) then
        return false
    end
    
    return (credits >= amount)
end

function CURRENCY:Format(amt)
	return onyx.creditstore.FormatMoney(amt) .. ' credits'
end

Coinflip:CreateCurrency('Onyx Store', CURRENCY)
--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000