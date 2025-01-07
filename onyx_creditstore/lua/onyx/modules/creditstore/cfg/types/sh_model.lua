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

onyx.creditstore:RegisterType('permmodel', {
    name = 'Permanent Model',
    color = Color(228, 69, 233),
    noDuplicates = true,
    equip = true,
    uniqueEquip = true,
    onEquip = function(ply, itemTableData)
        if (not ply.onyx_OldPlayerModel) then
            ply.onyx_OldPlayerModel = ply:GetModel()
        end

        ply:SetModel(itemTableData.model)
        ply:SetupHands()
    end,
    onUnequip = function(ply, itemTableData)
        if (ply.onyx_OldPlayerModel) then
            ply:SetModel(ply.onyx_OldPlayerModel)
            ply:SetupHands()
            ply.onyx_OldPlayerModel = nil
        end
    end,
    onLoadout = function(ply, itemTableData)
        ply.onyx_OldPlayerModel = ply:GetModel()

        timer.Simple(engine.TickInterval() * 10, function()
            if (IsValid(ply)) then
                ply:SetModel(itemTableData.model)
                ply:SetupHands()
            end
        end)
    end,
    settings = {
        {
            key = 'model',
            name = 'MODEL',
            desc = 'The model path.',
            icon = 'https://i.imgur.com/zgt3zea.png',
            type = 'string',
            validateOption = function(value)
                if (value == '') then
                    return false, 'You must enter the model!'
                end
        
                if (IsUselessModel(value)) then
                    return false, 'You must enter the valid model!'
                end
        
                return true
            end
        }
    }
})
--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000