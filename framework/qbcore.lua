QBCore = exports['qb-core']:GetCoreObject()

hasItem = function(src, item)
    return QBCore.Functions.GetPlayer(src).PlayerData.items[item] ~= nil
end

useItem = function(src, item)
    QBCore.Functions.GetPlayer(src).Functions.RemoveItem(src, item, 1)
end