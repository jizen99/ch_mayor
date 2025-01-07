--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000
--[[

Author: tochnonement
Email: tochnonement@gmail.com
Licensee: 

02/05/2023

--]]

local creditstore = onyx.creditstore

function creditstore:GetRefundEndTime(purchaseTime)
    local hours = onyx.creditstore:GetOptionValue('refunds_hours')
    local time = 3600 * hours
    local refundEndTime = purchaseTime + time
    return refundEndTime
end

function creditstore:GetRefundPrice(price)
    local percents = onyx.creditstore:GetOptionValue('refunds_percent')
    local fraction = percents / 100
    local newPrice = math.ceil(price * fraction)
    return newPrice
end

creditstore:RegisterOption('refunds_enabled', {
    title = 'Enabled',
    desc = 'Enable refunds module',
    category = 'Refunds',
    cami = 'onyx_creditstore_edit',
    type = 'bool',
    default = false
})

creditstore:RegisterOption('refunds_percent', {
    title = 'Percentage',
    desc = 'Percentage of the original cost',
    category = 'Refunds',
    cami = 'onyx_creditstore_edit',
    type = 'int',
    min = 1,
    max = 100,
    default = 65
})

creditstore:RegisterOption('refunds_hours', {
    title = 'Time',
    desc = 'How many hours is it possible to refund an item',
    category = 'Refunds',
    cami = 'onyx_creditstore_edit',
    type = 'int',
    min = 1,
    max = 24 * 30,
    default = 12
})
--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000