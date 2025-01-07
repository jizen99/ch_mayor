--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000
--[[

Author: tochnonement
Email: tochnonement@gmail.com

01/05/2023

--]]

local creditstore = onyx.creditstore

creditstore.integrations = creditstore.integrations or {}

function creditstore:RegisterIntegration(uniqueID, tblIntegration)
    self.integrations[uniqueID] = tblIntegration

    creditstore:Print('Registered a new integration: #', uniqueID)

    if (creditstore.gamemodeLoaded) then
        if (tblIntegration:Check()) then
            tblIntegration:Load()
        end
    end
end

onyx.WaitForGamemode('onyx.creditstore.Integrations', function()
    for uniqueID, tblIntegration in pairs(creditstore.integrations) do
        if (tblIntegration:Check()) then
            tblIntegration:Load()
        end
    end

    creditstore.gamemodeLoaded = true
end)
--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000