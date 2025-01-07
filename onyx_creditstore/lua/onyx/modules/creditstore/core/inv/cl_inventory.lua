--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000
--[[

Author: tochnonement
Email: tochnonement@gmail.com

23/04/2023

--]]

local creditstore = onyx.creditstore

netchunk.Callback('onyx.creditstore:SyncInventory', function(data, length, chunkAmount)
    LocalPlayer():SetVar('onyx_CreditstoreInventory', data)

    hook.Run('onyx.credistore.InventoryUpdated')

    creditstore:Print('Synchronized inventory (length: #, chunks: #)', length, chunkAmount)
end)

net.Receive('onyx.creditstore:SyncInventoryItemData', function(len)
    local inventory = creditstore:GetPlayerInventory(LocalPlayer())
    local index = net.ReadUInt(16)
    local data = onyx.net.ReadTable()

    if (inventory[index]) then
        inventory[index].data = data
        hook.Run('onyx.credistore.InventoryUpdated')
        creditstore:Print('Synchronized item data (index: #, length: #)', index, len)
    end
end)
--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000