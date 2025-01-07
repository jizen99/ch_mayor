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

timer.Create('onyx.creditstore.SalaryThink', 15, 0, function()
    local enabled = creditstore:GetOptionValue('salary_enabled')

    if (enabled) then
        local rate = creditstore:GetOptionValue('salary_rate') * 60
        local amount = creditstore:GetOptionValue('salary_amount')

        for _, ply in ipairs(player.GetAll()) do
            if (IsValid(ply) and hook.Run('onyx.creditstore.CanPlayerReceiveSalary', ply) ~= false) then
                if (ply.onyx_SalaryTime) then
                    if (ply.onyx_SalaryTime <= CurTime()) then
                        creditstore:AddCredits(ply, amount)
                        ply:ChatPrint('You received ' .. creditstore.FormatMoney(amount) .. ' credits for playing!')
                        ply.onyx_SalaryTime = CurTime() + rate
                    end
                else
                    ply.onyx_SalaryTime = CurTime() + rate
                end
            end
        end
    end
end)
--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000