--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000
--[[

Author: tochnonement
Email: tochnonement@gmail.com
Licensee: 

02/03/2023

--]]

netchunk.Register('onyx.creditstore:SyncItems')
netchunk.Register('onyx.creditstore:SyncCategories')

local creditstore = onyx.creditstore

creditstore.types = creditstore.types or {}

function creditstore:RegisterType(id, data)
    data.id = id
    self.types[id] = data
end

--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000