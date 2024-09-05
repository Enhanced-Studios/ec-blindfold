lib.locale()

hasItem = nil
useItem = nil

require(('framework.%s'):format(Config.Framework))

blindfoldedPlayers = {}

lib.callback.register('enhanced-blindfold:blindFoldPlayer', function(src, player)
    if blindfoldedPlayers[player] then
        blindfoldedPlayers[player] = nil
        TriggerClientEvent('enhanced-blindfold:toggleBlindfold', player, false)
    else
        if hasItem(src, 'blindfold') then
            useItem(src, 'blindfold')
            blindfoldedPlayers[player] = true
            TriggerClientEvent('enhanced-blindfold:toggleBlindfold', player, true)
        else
            Config.Notify('Blindfold', locale('no_item'), 'error', src)
        end
    end
end)