ESX = nil
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if ESX ~= nil then
		else
			ESX = nil
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		end
	end
end)

local Keys = {
	["W"] = 87, ["A"] = 89, ["S"] = 88, ["D"] = 90, ["E"] = 86, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["E"] = 38, ["X"] = 73, ["F"] = 49
}

local fishing = false
local lastInput = 0
local pause = false
local pausetimer = 0
local correct = 0
local veh = nil
local bait = "none"
local SellWait = false
local baitleft = ""

for _, v in ipairs(Config.Sell) do
	local blip = AddBlipForCoord(v.pos)
	SetBlipSprite (blip, v.blip)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.8)
	SetBlipColour (blip, v.colour)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(v.sellText)
	EndTextCommandSetBlipName(blip)
end
			
for _, info in pairs(Config.MarkerZones) do
	info.blip = AddBlipForCoord(info.Marker)
	SetBlipSprite(info.blip, 455)
	SetBlipDisplay(info.blip, 4)
	SetBlipScale(info.blip, 0.8)
	SetBlipColour(info.blip, 74)
	SetBlipAsShortRange(info.blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Boat rental")
	EndTextCommandSetBlipName(info.blip)
end
	
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)

		-- Rental Markers
		for k, v in pairs(Config.MarkerZones) do
			if #(pedCoords - v.Marker) < 100.0 then
				DrawMarker(1, v.Marker, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 255, 255, 0, 100, 0, 0, 0, 0)	
			end
			if #(pedCoords - v.Return) < 100.0 and IsPedInAnyVehicle(ped) then
				DrawMarker(1, v.Return, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 0, 0, 100, false, true, 2, false, false, false, false)
				if #(pedCoords - v.Return) < 5.0 then
					if DoesEntityExist(veh) and GetVehiclePedIsIn(ped) == veh then
						DisplayHelpText('Press ~INPUT_CONTEXT~ to return the boat')
						if IsControlJustReleased(0, Keys['E']) then
							for _, q in pairs(Config.RentalBoats) do
								if GetEntityModel(veh) == GetHashKey(q.model) then
									local deposit = math.floor(q.price / 2)
									TriggerServerEvent('fishing:returnDeposit', GetHashKey(q.model))
									--ESX.ShowNotification("You have been returned your deposit of ~g~$" .. deposit)
									exports['mythic_notify']:SendAlert('success', 'You Have Been Returned Your Deposit: $'..deposit, 5500)
								end
							end
							SetEntityAsMissionEntity(veh)
							DeleteEntity(veh)
							TriggerServerEvent("deleteThisEntity", NetworkGetNetworkIdFromEntity(veh))
							SetEntityCoords(ped, v.Marker)
						end
					else
						DisplayHelpText('This is not a rented vehicle')
					end
				end
			end
		end

		-- Sell markers
		for k, v in ipairs(Config.Sell) do
			if #(pedCoords - v.pos) < 100.0 then
				DrawMarker(1, v.pos, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.0, 3.0, 1.0, 0, 255, 0, 100, false, true, 2, false, false, false, false)
			end
			if #(pedCoords - v.pos) < 3.0 and not SellWait then
				DrawMarker(1, v.pos, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.0, 3.0, 1.0, 0, 255, 0, 100, false, true, 2, false, false, false, false)
				TriggerServerEvent('fishing:startSelling', v.type)
				SellWait = true
			end
		end
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if SellWait then
			Citizen.Wait(4000)
			SellWait = false
		end
	end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

Citizen.CreateThread(function()
	while true do
		Wait(1200)
		if pause and fishing then
			pausetimer = pausetimer + 1
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if fishing then
				--if IsControlJustReleased(0, Keys[tostring(1)]) then
					--input = 1
			  	--end
				if IsControlJustReleased(0, Keys['W']) then
					input = 1
			   end
			   if IsControlJustReleased(0, Keys['A']) then
				   input = 2
			   end
			   if IsControlJustReleased(0, Keys['S']) then
				   input = 3
			   end
			   if IsControlJustReleased(0, Keys['D']) then
				   input = 4
			   end
			   if IsControlJustReleased(0, Keys['E']) then
				   input = 5
			   end

			-- Stops the player from cancelling the task by getting out a weapon
			if IsPedUsingScenario(PlayerPedId(), "WORLD_HUMAN_STAND_FISHING") then
				BlockWeaponWheelThisFrame()
			end
			
			if IsControlJustReleased(0, Keys['X']) or IsPedSwimming(playerPed) then
				fishing = false
				--ESX.ShowNotification("~r~Stopped fishing")
				exports['mythic_notify']:SendAlert('inform', 'You Have Stopped Fishing!', 4500)
				TriggerEvent("fishing:break")
			end

			if fishing then
				playerPed = PlayerPedId()
				local pos = GetEntityCoords(playerPed)
				if GetWaterHeight(pos.x, pos.y, pos.z-2, pos.z-3.0) then
					-- Nothing
				else
					fishing = false
					--ESX.ShowNotification("~r~Stopped fishing")
					exports['mythic_notify']:SendAlert('inform', 'You Have Stopped Fishing!', 4500)
				end
				if IsEntityDead(playerPed) or IsPedSwimming(playerPed) then
					--ESX.ShowNotification("~r~Stopped fishing")
					exports['mythic_notify']:SendAlert('inform', 'You Have Stopped Fishing!', 4500)
					
				end
			end
			
			if pausetimer > 3 then
				input = 99
				print("you took too long")
				pausetimer = 0
				pause = false
			end
			
			if pause and input ~= 0 then
				pause = false
				if input == correct then
					if bait ~= "none" then
					TriggerServerEvent('fishing:catch', bait)
					TriggerServerEvent('fishing:checkbaitcount', bait)
					else
					TriggerServerEvent('fishing:catch', bait)
					end
				else
					--ESX.ShowNotification("~r~Fish got free")
					exports['mythic_notify']:SendAlert('error', 'The Fish Got Free!', 4500)
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local wait = math.random(Config.FishTime.a , Config.FishTime.b)
		local nobaitwait = math.random(Config.nobaitFishTime.a , Config.nobaitFishTime.b)
		if bait == "none" then
		Citizen.Wait(nobaitwait)
		else
		Citizen.Wait(wait)
		end
		if fishing then
			pause = true
			correct = math.random(1,5)
			if(correct == 1) then
				exports['mythic_notify']:SendAlert('inform', 'FISH ON! PRESS W TO CATCH FISH!', 4500)
			end
			if(correct == 2) then
				exports['mythic_notify']:SendAlert('inform', 'FISH ON! PRESS A TO CATCH FISH!', 4500)
			end
			if(correct == 3) then
				exports['mythic_notify']:SendAlert('inform', 'FISH ON! PRESS S TO CATCH FISH!', 4500)
			end
			if(correct == 4) then
				exports['mythic_notify']:SendAlert('inform', 'FISH ON! PRESS D TO CATCH FISH!', 4500)
			end
			if(correct == 5) then
				exports['mythic_notify']:SendAlert('inform', 'FISH ON! PRESS E TO CATCH FISH!', 4500)
			end
			--ESX.ShowNotification("Fish is taking the bait\nPress ~y~F~s~ to catch it")
			--exports['mythic_notify']:SendAlert('inform', 'FISH ON! PRESS '.. correct .. " TO CATCH FISH!", 4500)
			input = 0
			pausetimer = 0
		end	
	end
end)

RegisterNetEvent('fishing:message')
AddEventHandler('fishing:message', function(message)
	ESX.ShowNotification(message)
end)

RegisterNetEvent('fishing:break')
AddEventHandler('fishing:break', function()
	fishing = false
	Wait(50)
	ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('shark:spawnPed')
AddEventHandler('shark:spawnPed', function()
	RequestTheModel("a_c_sharktiger")
	local pos = GetEntityCoords(PlayerPedId())
	local ped = CreatePed(29, `a_c_sharktiger`, pos.x, pos.y, pos.z, 90.0, true, false)
	SetEntityHealth(ped, 0)
	DecorSetInt(ped, "propHack", 74)
	SetModelAsNoLongerNeeded(`a_c_sharktiger`)
	Wait(10000)
        DeletePed(ped)	
end)

RegisterNetEvent('killerwhale:spawnPed')
AddEventHandler('killerwhale:spawnPed', function()
	RequestTheModel("A_C_KillerWhale")
	local pos = GetEntityCoords(PlayerPedId())
	local ped = CreatePed(29, `A_C_KillerWhale`, pos.x, pos.y, pos.z, 90.0, true, false)
	SetEntityHealth(ped, 0)
	DecorSetInt(ped, "propHack", 74)
	SetModelAsNoLongerNeeded(`A_C_KillerWhale`)
	Wait(10000)
        DeletePed(ped)
end)

RegisterNetEvent('stingray:spawnPed')
AddEventHandler('stingray:spawnPed', function()
	RequestTheModel("A_C_stingray")
	local pos = GetEntityCoords(PlayerPedId())
	local ped = CreatePed(29, `A_C_stingray`, pos.x, pos.y, pos.z, 90.0, true, false)
	SetEntityHealth(ped, 0)
	DecorSetInt(ped, "propHack", 74)
	SetModelAsNoLongerNeeded(`A_C_stingray`)
	Wait(10000)
        DeletePed(ped)
end)

RegisterNetEvent('sharkhammer:spawnPed')
AddEventHandler('sharkhammer:spawnPed', function()
	RequestTheModel("A_C_sharkhammer")
	local pos = GetEntityCoords(PlayerPedId())
	local ped = CreatePed(29, `A_C_sharkhammer`, pos.x, pos.y, pos.z, 90.0, true, false)
	SetEntityHealth(ped, 0)
	DecorSetInt(ped, "propHack", 74)
	SetModelAsNoLongerNeeded(`A_C_sharkhammer`)
	Wait(10000)
        DeletePed(ped)
end)

RegisterNetEvent('dolphin:spawnPed')
AddEventHandler('dolphin:spawnPed', function()
	RequestTheModel("A_C_dolphin")
	local pos = GetEntityCoords(PlayerPedId())
	local ped = CreatePed(29, `A_C_dolphin`, pos.x, pos.y, pos.z, 90.0, true, false)
	SetEntityHealth(ped, 0)
	DecorSetInt(ped, "propHack", 74)
	SetModelAsNoLongerNeeded(`A_C_dolphin`)
	Wait(10000)
        DeletePed(ped)
end)

RegisterNetEvent('fish:spawnPed')
AddEventHandler('fish:spawnPed', function()
	RequestTheModel("a_c_fish")
	local pos = GetEntityCoords(PlayerPedId())
	local ped = CreatePed(29, `a_c_fish`, pos.x, pos.y, pos.z, 90.0, true, false)
	SetEntityHealth(ped, 0)
	DecorSetInt(ped, "propHack", 74)
	SetModelAsNoLongerNeeded(`a_c_fish`)
	Wait(10000)
    DeletePed(ped)
end)

RegisterNetEvent('fishing:setbait')
AddEventHandler('fishing:setbait', function(setbait)
	bait = setbait
end)

RegisterNetEvent('fishing:fishstart')
AddEventHandler('fishing:fishstart', function()
	playerPed = PlayerPedId()
	local pos = GetEntityCoords(PlayerPedId())
	if IsPedInAnyVehicle(playerPed) then
		--ESX.ShowNotification("~r~You can not fish from a vehicle")
		exports['mythic_notify']:SendAlert('error', 'You Cant Fish From A Vehicle!', 4500)
	else
		if GetWaterHeight(pos.x, pos.y, pos.z-2, pos.z-3.0) then
			if(bait == "none")then
				exports['mythic_notify']:SendAlert('error', 'You Are Fishing With No Bait!', 6500)
			end
			--ESX.ShowNotification("Fishing started\nPress ~y~X~s~ to stop fishing")
			exports['mythic_notify']:SendAlert('inform', 'Press X To Stop Fishing', 6500)
			TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_FISHING", 0, true)
			fishing = true
			print("fishing has started")
		else
			--ESX.ShowNotification("You need to go further away from the shore")
			exports['mythic_notify']:SendAlert('error', 'You Need To Be Closer To Water!', 6500)
		end
	end
end, false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k, v in pairs(Config.MarkerZones) do
        	local ped = PlayerPedId()
			local pedc = GetEntityCoords(ped, false)
            local distance = #(pedc - v.Marker)
            if distance <= 1.40 then
				DisplayHelpText('Press ~INPUT_CONTEXT~ to rent a boat')
				
				if IsControlJustPressed(0, Keys['E']) and IsPedOnFoot(ped) then
					OpenBoatsMenu(v.Spawn, v.SpawnHeading)
				end 
			elseif distance < 1.45 then
				ESX.UI.Menu.CloseAll()
            end
        end
    end
end)

function OpenBoatsMenu(xyz, h)
	local ped = PlayerPedId()
	PlayerData = ESX.GetPlayerData()
	local elements = {}

	for k, v in ipairs(Config.RentalBoats) do
		table.insert(elements, {
			label = ('%s - $%s'):format(GetLabelText(GetDisplayNameFromVehicleModel(v.model)), ESX.Math.GroupDigits(v.price)),
			value = v.model
		})
	end
	
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'client',
    {
		title    = 'Rent a boat',
		align    = 'bottom-right',
		elements = elements,
    },
	
	function(data, menu)

	for k, v in ipairs(Config.RentalBoats) do
		if data.current.value == v.model then
			ESX.UI.Menu.CloseAll()
			TriggerServerEvent("fishing:lowmoney", GetHashKey(v.model))
			RequestTheModel(v.model)
			veh = CreateVehicle(v.model, xyz, h, true, false)
			SetPedIntoVehicle(ped, veh, -1)
			TriggerEvent("ls:newVehicle", GetVehicleNumberPlateText(veh), veh, 0)
			DecorSetInt(veh, "ControlCar", 1)
			local deposit = math.floor(v.price / 2)
			--ESX.ShowNotification("You have paid a ~r~$" .. deposit .. "~s~ rental fee and a ~r~$" .. deposit .. "~s~ deposit.")
			exports['mythic_notify']:SendAlert('inform', 'You Have Paid A '.. deposit .. "And Rental Fee", 6500)
			--ESX.ShowNotification("Return the ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(v.model)) .. "~s~ to get your ~r~deposit~s~ back")
            SetModelAsNoLongerNeeded(v.model)
		end
	end
	
	ESX.UI.Menu.CloseAll()

    end,
	function(data, menu)
		menu.close()
		end
	)
end

function RequestTheModel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(0)
	end
end

RegisterCommand("fish", function(source)
    TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_FISHING", 0, true)
    fishing = true
end)
