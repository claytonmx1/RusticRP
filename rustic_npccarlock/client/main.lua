Citizen.CreateThread(function()
    while true do
        Wait(0)
            local ped = GetPlayerPed(-1)
            if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(ped))) then
                local veh = GetVehiclePedIsTryingToEnter(PlayerPedId(ped))
                local lock = GetVehicleDoorLockStatus(veh)
                if lock == 7 then
                    SetVehicleDoorsLocked(veh, 2)
                end
                local pedd = GetPedInVehicleSeat(veh, -1)
                if pedd then
                    SetPedCanBeDraggedOut(pedd, false)
                end
            end
	        if IsControlJustPressed(0, 24) then
			local ply = GetPlayerPed(-1)
			local pos = GetEntityCoords(ply)
			local veh = ESX.Game.GetClosestVehicle(pos)
			local pedd = GetPedInVehicleSeat(veh, -1)
			if DoesEntityExist(pedd) and not IsPedAPlayer(pedd) then
				SetVehicleDoorsLocked(veh, 4)
			end
		end
        end
    end)