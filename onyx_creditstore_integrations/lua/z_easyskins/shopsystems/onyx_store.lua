--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000
local customShopSystem = {}
customShopSystem.name = 'Onyx Store'

function customShopSystem.GetPoints(ply)
  local credits = onyx.creditstore:GetCredits(ply)
  local isBusy = ply:onyx_GetNetVar('store_busy')

  if (isBusy) then
    return 0
  end

  return credits
end

if SERVER then
  function customShopSystem.TakePoints(ply, amount)
    onyx.creditstore:TakeCredits(ply, amount)
  end

  function customShopSystem.GivePoints(ply, amount)
    onyx.creditstore:AddCredits(ply, amount)
  end
end

return customShopSystem
--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000