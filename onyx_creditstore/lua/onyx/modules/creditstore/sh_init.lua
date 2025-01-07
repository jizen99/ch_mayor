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

onyx:Addon('creditstore', {
    color = Color(0, 89, 255),
    author = 'tochnonement',
    version = '1.1.1',
    licensee = ''
})

----------------------------------------------------------------

if (CLIENT) then
    onyx.wimg.Register('creditstore_currency', 'https://i.imgur.com/MrgKOkL.png')
end

onyx.Include('sv_sql.lua')
onyx.IncludeFolder('onyx/modules/creditstore/languages/')
onyx.IncludeFolder('onyx/modules/creditstore/core/', true)
onyx.IncludeFolder('onyx/modules/creditstore/cfg/', true)
onyx.IncludeFolder('onyx/modules/creditstore/ui/')

onyx.creditstore:Print('Finished loading.')
--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000