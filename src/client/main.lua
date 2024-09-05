lib.locale()

isBlindfolded = false

RegisterCommand('blindfold', function()
    local closestPlayer, closestDistance = GetClosestPlayer()

    if closestPlayer ~= -1 and closestDistance <= 3.0 then
        lib.callback.await('enhanced-blindfold:blindFoldPlayer', false, GetPlayerServerId(closestPlayer))
    else
        Config.Notify('Blindfold', locale('no_players_nearby'), 'error')
    end
end)

RegisterNetEvent('enhanced-blindfold:toggleBlindfold', function(bool)
    toggleBlindfold(bool)
end)

CreateThread(function()
	while true do
		Wait(100)

		local ped = PlayerPedId()
		if 
            IsPedOnFoot(ped) 
            and not IsPedSwimming(ped) 
            and (IsPedRunning(ped) or IsPedSprinting(ped)) 
            and not IsPedClimbing(ped) 
            and IsPedJumping(ped) 
            and not IsPedRagdoll(ped)
            and isBlindfolded
        then
			if math.random() < Config.chance_of_falling then 
				Wait(600)
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.06)
				SetPedToRagdoll(ped, 5000, 1, 2)
			else
				Wait(2000)
			end
		end
	end
end)

function toggleBlindfold(bool)
    isBlindfolded = bool

    if bool then
        SendNUIMessage({ action = 'showBlindfold' })
    else
        SendNUIMessage({ action = 'hideBlindfold' })
    end
end

function GetClosestPlayer() -- credit here: https://forum.cfx.re/t/get-nearest-player-to-ped/157309/4
    local players = GetActivePlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)

    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)

        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = GetDistanceBetweenCoords(targetCoords['x'], targetCoords['y'], targetCoords['z'], plyCoords['x'], plyCoords['y'], plyCoords['z'], true)
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end

    return closestPlayer, closestDistance
end