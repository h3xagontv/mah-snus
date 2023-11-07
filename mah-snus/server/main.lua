local QBCore = exports['qb-core']:GetCoreObject()


for i=1, #Config.SnusItems, 1 do

    QBCore.Functions.CreateUseableItem(Config.SnusItems[i].PackItem, function(source)
        src = source
        local xPlayer = QBCore.Functions.GetPlayer(src)
        local pack     = Config.SnusItems[i].PackItem
        local item     = Config.SnusItems[i].openitem
        local amount    = Config.SnusItems[i].Amount

        TriggerClientEvent('mah-snus:client:usesnuspack', src)
        xPlayer.Functions.RemoveItem(pack, 1)
        xPlayer.Functions.AddItem(item, amount)
    end)
end


for i=1, #Config.SnusItems, 1 do

    QBCore.Functions.CreateUseableItem(Config.SnusItems[i].openitem, function(source)
        src = source
        local xPlayer = QBCore.Functions.GetPlayer(src)
        local item     = Config.SnusItems[i].openitem
        TriggerClientEvent('mah-snus:client:UsingSnus', src)
        xPlayer.Functions.RemoveItem(item, 1)
    end)
end




