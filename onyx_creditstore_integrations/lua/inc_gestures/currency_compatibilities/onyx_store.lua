--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000
--[[------------------------------
EXPLANATION
You would need to set `CurrencyCompatibility` variable in Gestures configuration file to "onyx_store"
lua\inc_gestures\config.lua
--------------------------------]]

function INC_GESTURES:CanAfford(ply, amount)
    local credits = onyx.creditstore:GetCredits(ply)
    local isBusy = ply:onyx_GetNetVar('store_busy')

    if (isBusy) then
        return false
    end
    
    return (credits >= amount)
end

function INC_GESTURES:FormatMoney(num)
    return onyx.creditstore.FormatMoney(num) .. ' Credits'
end

function INC_GESTURES:TakeMoney(ply, num)
    onyx.creditstore:TakeCredits(ply, num)
end

function INC_GESTURES:AddMoney(ply, num)
    onyx.creditstore:AddCredits(ply, num)
end
--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000