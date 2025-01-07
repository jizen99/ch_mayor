--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000
--[[

Author: tochnonement
Email: tochnonement@gmail.com

08/05/2023

--]]

util.AddNetworkString('onyx.creditstore:OpenStore')
hook.Add('PlayerSay', 'onyx.creditstore.OpenStore', function(ply, text)
    local command = onyx.creditstore:GetOptionValue('command'):match('%w+')
    if (text == ('!' .. command) or text == ('/' .. command)) then
        net.Start('onyx.creditstore:OpenStore')
        net.Send(ply)
        return ''
    end
end)
--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000