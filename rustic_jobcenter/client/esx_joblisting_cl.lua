local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}

local menuIsShowed				  = false
local hasAlreadyEnteredMarker     = false
local lastZone                    = nil
local isInJoblistingMarker 		  = false

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


function ShowJobListingMenu(data)
	ESX.TriggerServerCallback('sp_jobcenter:getJobsList', function(data)
		local elements = {}
		for i = 1, #data, 1 do
			table.insert(
				elements,
				{label = data[i].label, value = data[i].value}
			)
		end

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'joblisting',
			{
				title    = _U('job_center'),
				elements = elements
			},
			function(data, menu)
				TriggerServerEvent('sp_jobcenter:setJob', data.current.value)
				--ESX.ShowNotification(_U('new_job'))
				exports['mythic_notify']:SendAlert('inform', 'You Have Set A New Job!', 3500)
				menu.close()
			end,
			function(data, menu)
				menu.close()
			end
		)

	end)
end

RegisterNetEvent('sp_jobcenter:ShowJobListingMenu')
AddEventHandler('sp_jobcenter:ShowJobListingMenu', function()
ShowJobListingMenu()
end)
RegisterNetEvent('sp_jobcenter:openGui')
AddEventHandler('sp_jobcenter:openGui', function()
openGui()
end)
RegisterNetEvent('sp_jobcenter:closeGui')
AddEventHandler('sp_jobcenter:closeGui', function()
closeGui()
end)
-- MENU
function openGui()
	SendNUIMessage({openMenu = true})
	Citizen.CreateThread(function()
	  Citizen.Wait(500)
	  SetNuiFocus(true, true)
	end)
end
  
function closeGui()
	SetNuiFocus(false)
	SendNUIMessage({openMenu = false})
end
  
RegisterNUICallback('closeMenu', function(data, cb)
	closeGui()
	cb('ok')
end)
  
--RegisterNUICallback('postApplication', function(data, cb)
	
--	TriggerServerEvent('sp_jobcenter:postApplication', data)
	
--	cb('ok')
--end)
-- Menu


AddEventHandler('sp_jobcenter:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	menuIsShowed = false
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for i=1, #Config.Zones, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z, true) < Config.DrawDistance) then
				DrawMarker(Config.MarkerType, Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			end
		end
	end
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		isInJoblistingMarker  = false
		local currentZone = nil
		for i=1, #Config.Zones, 1 do
			if GetDistanceBetweenCoords(coords, Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z, true) < 2 then
				isInJoblistingMarker  = true
				SetTextComponentFormat('STRING')
            	AddTextComponentString(_U('access_job_center'))
            	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			end
		end
		if isInJoblistingMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
		end
		if not isInJoblistingMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('sp_jobcenter:hasExitedMarker')
		end
		if not isInJoblistingMarker and menuIsShowed then
			TriggerEvent('sp_jobcenter:hasExitedMarker')
		end
	end
end)

-- Menu Controls
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustReleased(0, Keys['E']) and GetLastInputMethod(2) and isInJoblistingMarker and not menuIsShowed then
			TriggerEvent('sp_jobcenter:sp_jobcenter')
			menuIsShowed = true
		end
	end
end)

--Creating Map Blip
Citizen.CreateThread(function()
	for i=1, #Config.Zones, 1 do
		local blip = AddBlipForCoord(Config.Zones[i])

		SetBlipSprite (blip, 408)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 1.0)
		SetBlipColour (blip, 0)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentSubstringPlayerName(_U('job_center'))
		EndTextCommandSetBlipName(blip)
	end
end)
