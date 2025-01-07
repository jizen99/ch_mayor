--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000
--[[

Author: tochnonement
Email: tochnonement@gmail.com
Licensee: 

23/04/2023

--]]

netchunk.Register('onyx.creditstore:SyncInventory')

local creditstore = onyx.creditstore

function creditstore:GetPlayerInventory(ply)
    return ply:GetVar('onyx_CreditstoreInventory', {})
end

function creditstore:GetPlayerItemAmount(ply, itemID)
    local inventory = self:GetPlayerInventory(ply)
    local amount = 0
    for _, it in ipairs(inventory) do
        if (it.id == itemID) then
            amount = amount + 1
        end
    end
    return amount
end

function creditstore:GetCredits(ply)
    return ply:onyx_GetNetVar('credits', 0)
end

onyx.netvar:Register('credits', {
    type = TYPE_NUMBER,
    bits = 32,
    unsigned = true,
    public = false
})

onyx.netvar:Register('store_busy', {
    type = TYPE_BOOL,
    public = false
})

onyx.netvar:Register('store_loaded', {
    type = TYPE_BOOL,
    public = false
})

creditstore.GetBalance = creditstore.GetCredits
--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000