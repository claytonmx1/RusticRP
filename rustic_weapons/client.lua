-- Leaked By: Leaking Hub | J. Snow | leakinghub.com

ESX = nil

Citizen.CreateThread(function() 
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)


function _L(str)
    if not Locale then return "Locale error" end
    if not Locale[Config.locale] then return "Invalid locale" end
    if not Locale[Config.locale][str] then return "Invalid string" end
    return Locale[Config.locale][str]
end


RegisterCommand(Config.SaveWeaponCmd, function() 
	local ped = PlayerPedId(-1)
	local currentWeaponHash = GetSelectedPedWeapon(ped)
	local saveWeapon = true
	local ammo = 0
	local count = 1
	local weaponName = "nil"
	local weaponAmmoType = "nil"
	local weaponLenght = #Config.weaponsList

	if currentWeaponHash == -1569615261 then
		--ESX.ShowNotification(_L("weapon_not_equiped"))
		exports['mythic_notify']:SendAlert('error', "Weapon Not Equiped!", 5500)
	else
		while(saveWeapon and count < weaponLenght + 1)
		do
			weaponName = Config.weaponsList[count].name
			if currentWeaponHash == GetHashKey(weaponName) then
				ammo = GetAmmoInPedWeapon(ped, weaponName)
				weaponAmmoType = Config.weaponsList[count].ammo
				TriggerEvent('rico_weapons:verifycomponents', currentWeaponHash, count)
				TriggerServerEvent('weapons:saveWeapon', weaponName, ammo, weaponAmmoType)
				saveWeapon = false
				--ESX.ShowNotification(_L("weapon_saved"))
				exports['mythic_notify']:SendAlert('inform', "Weapon Saved", 5500)
			else
				count = count + 1
			end
		end
	end
end)

-- Leaked By: Leaking Hub | J. Snow | leakinghub.com

RegisterCommand(Config.SaveComponentsCmd, function() 
	local ped = PlayerPedId(-1)
	local currentWeaponHash = GetSelectedPedWeapon(ped)
	local saveComp = true
	local count = 1
	local weaponLenght = #Config.weaponsList

	if currentWeaponHash == -1569615261 then
		--ESX.ShowNotification(_L("weapon_not_equiped"))
		exports['mythic_notify']:SendAlert('error', "Weapon Not Equiped!", 5500)
	else
		while(saveComp and count < weaponLenght + 1)
		do
			weaponName = Config.weaponsList[count].name
			if currentWeaponHash == GetHashKey(weaponName) then
				TriggerEvent('rico_weapons:verifycomponents', currentWeaponHash, count)
				saveComp = false
				--ESX.ShowNotification(_L("components_saved"))
				exports['mythic_notify']:SendAlert('inform', "Components Saved", 5500)
			else
				count = count + 1
			end
		end
	end
end)

RegisterNetEvent('rico_weapons:verifyWeapon')
AddEventHandler('rico_weapons:verifyWeapon', function(weapon)
	local hash = GetHashKey(weapon)
	local playerPed = GetPlayerPed(-1)
	local hasWeapon = HasPedGotWeapon(playerPed, hash, false)

	if hasWeapon == 1 then
		ESX.ShowNotification(_L("equip_2_times"))
	else
		--ESX.ShowNotification(_L("weapon_equiped"))
		exports['mythic_notify']:SendAlert('inform', "Weapon Equiped", 5500)
		TriggerServerEvent('weapons:equipWeapon', weapon)
	end
end)



------------------------------- Ammo



RegisterNetEvent('rico_weapons:verifyAmmo')
AddEventHandler('rico_weapons:verifyAmmo', function(ammo)
	local ped = PlayerPedId(-1)
	local currentWeaponHash = GetSelectedPedWeapon(ped)
	local checkAmmo = true
	local count = 1
	local weaponLenght = #Config.weaponsList

	if currentWeaponHash == -1569615261 then
		--ESX.ShowNotification(_L("weapon_not_equiped"))
		exports['mythic_notify']:SendAlert('error', "Weapon Not Equiped!", 5500)
	else
		while(checkAmmo and count < weaponLenght + 1)
		do
			local weaponName = Config.weaponsList[count].name
			local weaponAmmoType = Config.weaponsList[count].ammo
			
			if currentWeaponHash == GetHashKey(weaponName) then
				if ammo == weaponAmmoType then
					checkAmmo = false
					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
	                    title = 'Ammo amount'
	                }, function(data, menu)
	                	local ammoAmount = tonumber(data.value)
			            ESX.TriggerServerCallback('weapons:getItemCount', function(count) 
			                if ammoAmount <= count and ammoAmount > 0 then
			                	if GetAmmoInPedWeapon(ped, currentWeaponHash) + ammoAmount <= 250 then
				                	AddAmmoToPed(ped, currentWeaponHash, ammoAmount)
									TriggerServerEvent('weapons:carregar', ammo, ammoAmount)
									--ESX.ShowNotification(_L("weapon_loaded"))
									exports['mythic_notify']:SendAlert('inform', "Weapon Loaded!", 5500)
									menu.close()
								else
									--ESX.ShowNotification(_L("weapon_full"))
									exports['mythic_notify']:SendAlert('error', "Weapon Full!", 5500)
									menu.close()
								end
			                else
			                	--ESX.ShowNotification(_L("value_not_accepted"))
								exports['mythic_notify']:SendAlert('error', "Value Not Accepted!", 5500)
			                	menu.close()
			                end
			            end, ammo)
	            	end, function(data, menu)
	                    menu.close()
	                end)
				else
					checkAmmo = false
					--ESX.ShowNotification(_L("wrong_weapon"))
					exports['mythic_notify']:SendAlert('error', "Wrong Weapon!", 5500)
				end
			else
				count = count + 1
			end
		end
	end
end)

RegisterNetEvent('rico_weapons:usarbox')
AddEventHandler('rico_weapons:usarbox', function(box)
	local ped = PlayerPedId(-1)
	local currentWeaponHash = GetSelectedPedWeapon(ped)
	local checkBox = true
	local count = 1
	local weaponLenght = #Config.weaponsList
	local clipSize = 0

	if currentWeaponHash == -1569615261 then
		--ESX.ShowNotification(_L("weapon_not_equiped"))
		exports['mythic_notify']:SendAlert('error', "Weapon Not Equiped!", 5500)
	else
		while(checkBox and count < weaponLenght + 1)
		do
			local weaponName = Config.weaponsList[count].name
			local weaponAmmoType = Config.weaponsList[count].ammo
			local weaponBoxType = Config.weaponsList[count].box
			local weaponType = Config.weaponsList[count].type
			
			if currentWeaponHash == GetHashKey(weaponName) then
				if box == weaponBoxType then
					checkBox = false

					if Config.BoxGiveClipSize then
						clipSize = GetWeaponClipSize(currentWeaponHash)
					else
						if weaponType == "sniper" then
							clipSize = Config.BoxSniperAmmoAmount
						elseif weaponType == "pistol" then
							clipSize = Config.BoxPistolAmmoAmount
						elseif weaponType == "shotgun" then
							clipSize = Config.BoxShotgunAmmoAmount
						elseif weaponType == "smg" then
							clipSize = Config.BoxSMGAmmoAmount
						elseif weaponBoxType == "box_762" or weaponBoxType == "box_556" then
							clipSize = Config.BoxRifleAmmoAmount
						end
					end

					if GetAmmoInPedWeapon(ped, currentWeaponHash) < 250 then
						TriggerServerEvent("weapons:removeItem", weaponBoxType, 1)
						AddAmmoToPed(ped, currentWeaponHash, clipSize)
						--ESX.ShowNotification(_L("box_used"))
						exports['mythic_notify']:SendAlert('inform', "Ammo Used", 5500)
					else
						--ESX.ShowNotification(_L("cant_use_box"))
						exports['mythic_notify']:SendAlert('error', "Cant Use Ammo!", 5500)
					end

				else
					checkBox = false
					--ESX.ShowNotification(_L("wrong_weapon"))
					exports['mythic_notify']:SendAlert('error', "Wrong Weapon!", 5500)
				end
			else
				count = count + 1
			end
		end
	end
end)


--------------------------- Components


RegisterNetEvent('rico_weapons:component')
AddEventHandler('rico_weapons:component', function(component)
	local ped = PlayerPedId(-1)
	local currentWeaponHash = GetSelectedPedWeapon(ped)
	local checkBox = true
	local count = 1
	local weaponLenght = #Config.weaponsList

	if currentWeaponHash == -1569615261 then
		--ESX.ShowNotification(_L("weapon_not_equiped"))
		exports['mythic_notify']:SendAlert('error', "Weapon Not Equiped!", 5500)
	else
		while(checkBox and count < weaponLenght + 1)
		do
			local weaponName = Config.weaponsList[count].name
			
			if currentWeaponHash == GetHashKey(weaponName) then

				local weaponSuppressor = Config.weaponsList[count].suppressor
				local weaponFlashlight = Config.weaponsList[count].flashlight
				local weaponGrip = Config.weaponsList[count].grip
				local weaponScope = Config.weaponsList[count].scope
				local weaponYusuf = Config.weaponsList[count].yusuf
				local weaponExtendedclip = Config.weaponsList[count].extendedclip

				checkBox = false

				if component == 'suppressor' then
					if weaponSuppressor == '' then
						--ESX.ShowNotification(_L("component_not_supported"))
						exports['mythic_notify']:SendAlert('error', "Component Not Supported!", 5500)
					elseif HasPedGotWeaponComponent(ped, currentWeaponHash, weaponSuppressor) then
						--ESX.ShowNotification(_L("weapon_got_component"))
						exports['mythic_notify']:SendAlert('inform', "Got Component", 5500)
					else
						GiveWeaponComponentToPed(GetPlayerPed(-1), currentWeaponHash, weaponSuppressor)
						TriggerServerEvent('weapons:removeItem', component, 1)
						--ESX.ShowNotification(_L("component_equiped"))
						exports['mythic_notify']:SendAlert('inform', "Component Equiped", 5500)
					end
				elseif component == 'flashlight' then
					if weaponFlashlight == '' then
						--ESX.ShowNotification(_L("component_not_supported"))
						exports['mythic_notify']:SendAlert('error', "Component Not Supported!", 5500)
					elseif HasPedGotWeaponComponent(ped, currentWeaponHash, weaponFlashlight) then
						--ESX.ShowNotification(_L("weapon_got_component"))
						exports['mythic_notify']:SendAlert('inform', "Got Component", 5500)
					else
						GiveWeaponComponentToPed(GetPlayerPed(-1), currentWeaponHash, weaponFlashlight)
						TriggerServerEvent('weapons:removeItem', component, 1)
						--ESX.ShowNotification(_L("component_equiped"))
						exports['mythic_notify']:SendAlert('inform', "Component Equiped", 5500)
					end
				elseif component == 'grip' then
					if weaponGrip == '' then
						--ESX.ShowNotification(_L("component_not_supported"))
						exports['mythic_notify']:SendAlert('error', "Component Not Supported!", 5500)
					elseif HasPedGotWeaponComponent(ped, currentWeaponHash, weaponGrip) then
						--ESX.ShowNotification(_L("weapon_got_component"))
						exports['mythic_notify']:SendAlert('inform', "Got Component", 5500)
					else
						GiveWeaponComponentToPed(GetPlayerPed(-1), currentWeaponHash, weaponGrip)
						TriggerServerEvent('weapons:removeItem', component, 1)
						--ESX.ShowNotification(_L("component_equiped"))
						exports['mythic_notify']:SendAlert('inform', "Component Equiped", 5500)
					end
				elseif component == 'scope' then
					if weaponScope == '' then
						--ESX.ShowNotification(_L("component_not_supported"))
						exports['mythic_notify']:SendAlert('error', "Component Not Supported!", 5500)
					elseif HasPedGotWeaponComponent(ped, currentWeaponHash, weaponScope) then
						--ESX.ShowNotification(_L("weapon_got_component"))
						exports['mythic_notify']:SendAlert('inform', "Got Component", 5500)
					else
						GiveWeaponComponentToPed(GetPlayerPed(-1), currentWeaponHash, weaponScope)
						TriggerServerEvent('weapons:removeItem', component, 1)
						--ESX.ShowNotification(_L("component_equiped"))
						exports['mythic_notify']:SendAlert('inform', "Component Equiped", 5500)
					end
				elseif component == 'yusuf' then
					if weaponYusuf == '' then
						--ESX.ShowNotification(_L("component_not_supported"))
						exports['mythic_notify']:SendAlert('error', "Component Not Supported!", 5500)
					elseif HasPedGotWeaponComponent(ped, currentWeaponHash, weaponYusuf) then
						--ESX.ShowNotification(_L("weapon_got_component"))
						exports['mythic_notify']:SendAlert('inform', "Got Component", 5500)
					else
						GiveWeaponComponentToPed(GetPlayerPed(-1), currentWeaponHash, weaponYusuf)
						TriggerServerEvent('weapons:removeItem', component, 1)
						--ESX.ShowNotification(_L("component_equiped"))
						exports['mythic_notify']:SendAlert('inform', "Component Equiped", 5500)
					end
				elseif component == 'extendedclip' then
					if weaponExtendedclip == '' then
						--ESX.ShowNotification(_L("component_not_supported"))
						exports['mythic_notify']:SendAlert('error', "Component Not Supported!", 5500)
					elseif HasPedGotWeaponComponent(ped, currentWeaponHash, weaponExtendedclip) then
						--ESX.ShowNotification(_L("weapon_got_component"))
						exports['mythic_notify']:SendAlert('inform', "Got Component", 5500)
					else
						GiveWeaponComponentToPed(GetPlayerPed(-1), currentWeaponHash, weaponExtendedclip)
						TriggerServerEvent('weapons:removeItem', component, 1)
						--ESX.ShowNotification(_L("component_equiped"))
						exports['mythic_notify']:SendAlert('inform', "Component Equiped", 5500)
					end
				end
			else
				count = count + 1
			end
		end
	end
end)

RegisterNetEvent('rico_weapons:verifycomponents')
AddEventHandler('rico_weapons:verifycomponents', function(weaponHash, count)
	local ped = PlayerPedId(-1)

	local weaponSuppressor = Config.weaponsList[count].suppressor
	local weaponFlashlight = Config.weaponsList[count].flashlight
	local weaponGrip = Config.weaponsList[count].grip
	local weaponScope = Config.weaponsList[count].scope
	local weaponYusuf = Config.weaponsList[count].yusuf
	local weaponExtendedclip = Config.weaponsList[count].extendedclip

	if HasPedGotWeaponComponent(ped, weaponHash, weaponSuppressor) then
		RemoveWeaponComponentFromPed(ped, weaponHash, weaponSuppressor)
		TriggerServerEvent('weapons:giveItem', 'suppressor', 1)
	end
	if HasPedGotWeaponComponent(ped, weaponHash, weaponFlashlight) then
		RemoveWeaponComponentFromPed(ped, weaponHash, weaponFlashlight)
		TriggerServerEvent('weapons:giveItem', 'flashlight', 1)
	end
	if HasPedGotWeaponComponent(ped, weaponHash, weaponGrip) then
		RemoveWeaponComponentFromPed(ped, weaponHash, weaponGrip)
		TriggerServerEvent('weapons:giveItem', 'grip', 1)
	end
	if HasPedGotWeaponComponent(ped, weaponHash, weaponScope) then
		RemoveWeaponComponentFromPed(ped, weaponHash, weaponScope)
		TriggerServerEvent('weapons:giveItem', 'scope', 1)
	end
	if HasPedGotWeaponComponent(ped, weaponHash, weaponYusuf) then
		RemoveWeaponComponentFromPed(ped, weaponHash, weaponYusuf)
		TriggerServerEvent('weapons:giveItem', 'yusuf', 1)
	end
	if HasPedGotWeaponComponent(ped, weaponHash, weaponExtendedclip) then
		RemoveWeaponComponentFromPed(ped, weaponHash, weaponExtendedclip)
		TriggerServerEvent('weapons:giveItem', 'extendedclip', 1)
	end
end)

-- Leaked By: Leaking Hub | J. Snow | leakinghub.com