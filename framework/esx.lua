ESX = exports['es_extended']:getSharedObject()

hasItem = function(src, item)
    local xPlayer = ESX.GetPlayerFromId(src)

    return xPlayer.getInventoryItem(item).count > 0
end

useItem = function(src, item)
    local xPlayer = ESX.GetPlayerFromId(src)

    xPlayer.removeInventoryItem(item, 1)
end