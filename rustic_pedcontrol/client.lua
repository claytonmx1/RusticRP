Citizen.CreateThread(function()
	local areas = Config.Areas
    for k, v in pairs(areas) do
        if v.Corner1 ~= nil and v.Corner2 ~= nil then
            local bbmin, bbmax = v.Corner1, v.Corner2
            if not DoesScenarioBlockingAreaExist(bbmin, bbmax) then
                AddScenarioBlockingArea(bbmin, bbmax, 0, 1, 1, 1)
                if v.DisableVehicleGen then
                    SetAllVehicleGeneratorsActiveInArea(v.Corner1, v.Corner2, false, false)
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
	local areas = Config.Areas
    while true do
        Citizen.Wait(1000)
        local myCoords = GetEntityCoords(PlayerPedId())
        local nearArea = false
        for k, v in pairs(areas) do
            if v.ClearPeds ~= nil and v.OuterCoords ~= nil and v.CenterCoords ~= nil then
                local distance = #(v.OuterCoords - v.CenterCoords)
                if #(myCoords - v.CenterCoords) < distance then
                    nearArea = true
                    if v.ClearPeds == true then
                        ClearAreaOfPeds(v.CenterCoords.x, v.CenterCoords.y, v.CenterCoords.z, distance, 0)
                    end
                    if v.ClearVehs == true then
                        ClearAreaOfVehicles(v.CenterCoords.x, v.CenterCoords.y, v.CenterCoords.z, distance, false, false, false, false, false) 	
                    end
                    if v.DisableVehicleGen then
                        RemoveVehiclesFromGeneratorsInArea(v.Corner1.x, v.Corner1.y, v.Corner1.z, v.Corner1.x, v.Corner1.y, v.Corner1.z)
                    end
                end
            end
        end
        if not nearArea then
            Wait(500)
        end
    end
end)