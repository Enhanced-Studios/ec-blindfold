Proxy = module('vrp', 'lib/Proxy')
vRP = Proxy.getInterface('vRP')

hasItem = function(src, item)
    return (vRP.getInventoryItemAmount({vRP.getUserId({src}), item}) > 0)
end

useItem = function(src, item)
    vRP.tryGetInventoryItem({vRP.getUserId({src}), item, 1})
end
