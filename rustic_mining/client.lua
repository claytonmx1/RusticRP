ESX = nil
local mining = false

Citizen.CreateThread(function()
    while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Wait(0) end
    while ESX.GetPlayerData().job == nil do Wait(0) end
    for k, v in pairs(Config.MiningPositions) do
        addBlip(v.coords, 728, 5, Strings['mining'])
    end
    for k, v in pairs(Config.StoneWashPositions) do
        addBlip(v.coords, 728, 5, Strings['stonewash'])
    end
    addBlip(Config.Sell, 207, 2, Strings['sell_mine'])
    Citizen.CreateThread(function()
        while true do
            local sleep = 250
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.Sell, true) <= 3.0 then
                sleep = 0
                helpText(Strings['e_sell'])
                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent('esx_mining:sell')
                end
            end
            Wait(sleep)
        end
    end)


    while true do
        --stone mining shit
        local closeTo = 0
        for k, v in pairs(Config.MiningPositions) do
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.coords, true) <= 1.5 then
                closeTo = v
                break
            end
        end
        if type(closeTo) == 'table' then
            while GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), closeTo.coords, true) <= 1.5 do
                for k, v in pairs(Config.MiningPositions) do
                DrawMarker(1, v.coords.x, v.coords.y, v.coords.z - 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 125, 255, 125, 100, false, true, 0, false)
                end
                Wait(0)
                helpText(Strings['press_mine'])
                if IsControlJustReleased(0, 38) then
                    local player, distance = ESX.Game.GetClosestPlayer()
                    
                    exports['mythic_progbar']:Progress({
                        name = "mining",
                        duration = 10000,
                        label = 'mining stone',
                        useWhileDead = false,
                        canCancel = true,
                        controlDisables = {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        },
                        animation = {
                            animDict = "melee@hatchet@streamed_core",
                            anim = "plyr_front_takedown_b",
                            flags = 49,
                        },
                        prop = {
                            model = "prop_tool_pickaxe",
                            bone = 57005,
                            coords = { x = 0.10, y = 0.02, z = 0.08 },
                            rotation = { x = -80.0, y = 0.0, z = 0.0 },
                        },
                    }, function(cancelled)
                        if not cancelled then
                            -- Do Something If Action Wasn't Cancelled
                            TriggerServerEvent('esx_mining:getItem')
                            mining = false
                            ClearAllPedProps(-1)
                        else
                            -- Do Something If Action Was Cancelled
                            mining = false
                            ClearAllPedProps(-1)
                        end
                    end)
                    --end of stone mining shit
                    
                end
            end
        end



        --stone wash shit
        local closeToWashing = 0
        for k, v in pairs(Config.StoneWashPositions) do
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.coords, true) <= 20.5 then
                closeToWashing = v
                break
            end
        end


        if type(closeToWashing) == 'table' then
            while GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), closeToWashing.coords, true) <= 20.5 do
                for k, v in pairs(Config.StoneWashPositions) do
               DrawMarker(1, v.coords.x, v.coords.y, v.coords.z - 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 125, 255, 125, 100, false, true, 0, false)
                end
                Wait(0)
                if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), closeToWashing.coords, true) <= 1.5 then
                    helpText(Strings['press_wash'])
                end
                if IsControlJustReleased(0, 38) and GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), closeToWashing.coords, true) <= 1.5 then
                    local player, distance = ESX.Game.GetClosestPlayer()
                    
                    exports['mythic_progbar']:Progress({
                        name = "washing",
                        duration = 10000,
                        label = 'wasing stone',
                        useWhileDead = false,
                        canCancel = true,
                        controlDisables = {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        },
                        animation = {
                            animDict = "switch@trevor@dumpster",
                            anim = "002002_01_trvs_14_dumpster_exit",
                            flags = 49,
                        },
                        prop = {
                            model = "prop_buckets_02",
                            bone = 57005,
                            coords = { x = 0.10, y = 0.02, z = 0.08 },
                            rotation = { x = -80.0, y = 0.0, z = 0.0 },
                        },
                    }, function(cancelled)
                        if not cancelled then
                            -- Do Something If Action Wasn't Cancelled
                            TriggerServerEvent('esx_mining:washItem')
                            mining = false
                            ClearAllPedProps(-1)
                        else
                            -- Do Something If Action Was Cancelled
                            mining = false
                            ClearAllPedProps(-1)
                        end
                    end)
                end
            end
        end
        --end of stone wash shit

        Wait(250)
    end
end)

loadModel = function(model)
    while not HasModelLoaded(model) do Wait(0) RequestModel(model) end
    return model
end

loadDict = function(dict, anim)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
    return dict
end

helpText = function(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

addBlip = function(coords, sprite, colour, text)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
end