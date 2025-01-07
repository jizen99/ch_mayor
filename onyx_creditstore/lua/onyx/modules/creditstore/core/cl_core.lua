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

local creditstore = onyx.creditstore

function creditstore:OpenStore()
    if (IsValid(self.frame)) then
        return
    end

    self.frame = vgui.Create('onyx.creditstore.Frame')
    self.frame:SetSize(ScrW() * .65, ScrH() * .65)
    self.frame:MakePopup()
    self.frame:Center()
end

net.Receive('onyx.creditstore:OpenStore', function(len, ply)
    creditstore:OpenStore()
end)

concommand.Add('onyx_store_open', function()
    creditstore:OpenStore()
end)

concommand.Add('onyx_store_close', function()
    if (IsValid(creditstore.frame)) then
        creditstore.frame:Remove()
    end
end)
--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000