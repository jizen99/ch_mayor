--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000
--[[

Author: tochnonement
Email: tochnonement@gmail.com

02/03/2023

--]]

local creditstore = onyx.creditstore

creditstore.items = creditstore.items or {}
creditstore.categories = creditstore.categories or {}

netchunk.Callback('onyx.creditstore:SyncItems', function(data, length, chunkAmount)
    creditstore.items = data

    hook.Run('onyx.credistore.ItemsSynced')

    creditstore:Print('Synchronized items (length: #, chunks: #)', length, chunkAmount)
end)

netchunk.Callback('onyx.creditstore:SyncCategories', function(data, length, chunkAmount)
    creditstore.categories = data

    hook.Run('onyx.credistore.CategoriesSynced')

    creditstore:Print('Synchronized categories (length: #, chunks: #)', length, chunkAmount)
end)
--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000