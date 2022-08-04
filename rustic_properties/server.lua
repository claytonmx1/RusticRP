ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('rustic_properties:GetOwned', function(source, cb)
	MySQL.Async.fetchAll('SELECT * FROM sm_owned_properties', {}, function(result)
		cb(result)
	end)
end)

ESX.RegisterServerCallback('rustic_properties:GetEmpty', function(source, cb)
	MySQL.Async.fetchAll('SELECT * FROM sm_properties', {}, function(result)
		cb(result)
	end)
end)

ESX.RegisterServerCallback('rustic_properties:GetLock', function(source, cb)
	MySQL.Async.fetchAll('SELECT * FROM sm_properties_objects', {}, function(result)
		cb(result)
	end)
end)

ESX.RegisterServerCallback('rustic_properties:GetMoney', function(source, cb, propertyName)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local src = source

	MySQL.Async.fetchAll('Select * FROM sm_properties', {}, function(result)
		for i = 1, #result, 1 do
			if result[i].name == propertyName then
				if xPlayer.getAccount('bank').money >= result[i].price then
					cb(true)
				else
					cb(false)
				end
			end
		end
	end)
end)

RegisterServerEvent('rustic_properties:BuyProperty')
AddEventHandler('rustic_properties:BuyProperty', function(propertyName)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local src = source

	MySQL.Async.fetchAll('Select * FROM sm_properties', {}, function(result)
		for i=1, #result, 1 do
			if result[i].name == propertyName and result[i].empty == 1 then
				if xPlayer.getAccount('bank').money >= result[i].price then
					xPlayer.removeAccountMoney('bank', result[i].price)
					MySQL.Sync.execute("UPDATE sm_properties SET empty=@empty WHERE name=@name", {['@name'] = propertyName, ['@empty'] = 0})
					MySQL.Async.execute("INSERT INTO sm_owned_properties (owner, name, price) VALUES (@owner,@name,@price)", {['@owner'] = xPlayer.getIdentifier(), ['@name'] = propertyName, ['@price'] = result[i].price})
					-- PUTTING THIS IN FOR BLIP
					-- MySQL.Async.execute("INSERT INTO rustic_house_blipcheck (propertyxcord) VALUES (@name)", {['@name'] = propertyName})
					--END OF PUTTING THIS
					TriggerClientEvent('updateEmpty', src, propertyName, false)
					TriggerClientEvent('updateOwned', src, propertyName, true)
				else
					TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'You dont have enough money for this house.'})
				end
			else
				TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'Someone already owns this house.'})
			end
		end
    end)
end)

RegisterServerEvent('rustic_properties:UpdatePropertyLock')
AddEventHandler('rustic_properties:UpdatePropertyLock', function(propertyName, to)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local src = source

	MySQL.Async.fetchAll('Select * FROM sm_owned_properties', {}, function(result)
		for i=1, #result, 1 do
			if result[i].name == propertyName and result[i].owner == xPlayer.getIdentifier() then
				MySQL.Sync.execute("UPDATE sm_owned_properties SET locked=@locked WHERE name=@name", {['@name'] = propertyName, ['@locked'] = to})

				if to == 1 then
					TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'success', text = 'You locked the door.'})
					TriggerClientEvent('checkLock', src)
				elseif to == 0 then
					TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'You unlocked the door.'})
					TriggerClientEvent('checkLock', src)
				end
			end
		end
    end)
end)

RegisterServerEvent('rustic_properties:UpdateStorageLock')
AddEventHandler('rustic_properties:UpdateStorageLock', function(coords, to)
	local src = source
	local xPlayer  = ESX.GetPlayerFromId(src)

	MySQL.Async.fetchAll('Select * FROM sm_properties_objects', {}, function(result)
		for i=1, #result, 1 do
			if result[i].x == coords.x and result[i].y == coords.y and result[i].z == coords.z and result[i].owner == xPlayer.getIdentifier() then
				MySQL.Sync.execute("UPDATE sm_properties_objects SET locked=@locked WHERE owner=@owner", {['@owner'] = xPlayer.getIdentifier(), ['@locked'] = to})
				if to == 1 then
					TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'You locked the door.'})
					TriggerClientEvent('rustic_properties:ClientupdateStorageLock', src, coords, to)
				elseif to == 0 then
					TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'You unlocked the door.'})
					TriggerClientEvent('rustic_properties:ClientupdateStorageLock', src, coords, to)
				end
			end
		end
    end)
end)

RegisterServerEvent('rustic_properties:addProp')
AddEventHandler('rustic_properties:addProp', function(name, coords, currentAmount, items, selected, spawned, property)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local src = source
	MySQL.Async.execute("INSERT INTO sm_properties_objects (name, owner, x, y, z, r, currentAmount, items, selected, spawned, locked, property) VALUES (@name,@owner,@x,@y,@z,@r,@currentAmount,@items,@selected,@spawned,@locked,@property)", {['@name'] = name, ['@owner'] = xPlayer.getIdentifier(), ['@x'] = coords.x, ['@y'] = coords.y, ['@z'] = coords.z, ['@r'] = coords.r, ['@currentAmount'] = currentAmount, ['@items'] = items, ['@selected'] = selected, ['@spawned'] = spawned, ['@locked'] = 1, ['@property'] = property})
end)

RegisterServerEvent('rustic_properties:updateProp')
AddEventHandler('rustic_properties:updateProp', function(coords, selected)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local src = source
	MySQL.Async.fetchAll('Select * FROM sm_properties_objects', {}, function(result)
		for i=1, #result, 1 do
			if result[i].selected == 1 then
				MySQL.Async.execute("UPDATE sm_properties_objects (x, y, z, r, selected) VALUES (@x,@y,@z,@r, @selected)", {['@x'] = coords.x, ['@y'] = coords.y, ['@z'] = coords.z, ['@r'] = coords.r,  ['@selected'] = selected})
			end
		end
	end)
end)

RegisterServerEvent('rustic_properties:updateSelected')
AddEventHandler('rustic_properties:updateSelected', function(coords, type, bool)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local src = source

	MySQL.Async.fetchAll('Select * FROM sm_properties_objects WHERE `owner` = @identifier', {
        ['@identifier'] = xPlayer.getIdentifier()
	}, function(result)
		for i=1, #result, 1 do
			if result[i].x == coords.x and result[i].y == coords.y and result[i].z == coords.z and result[i].r == coords.r and result[i].owner == xPlayer.getIdentifier() then
				MySQL.Sync.execute("UPDATE sm_properties_objects SET selected=@selected WHERE name=@name", {['@name'] = type, ['@selected'] = bool})
			end
		end
    end)
end)

RegisterServerEvent('rustic_properties:updateSpawned')
AddEventHandler('rustic_properties:updateSpawned', function()
	local xPlayer  = ESX.GetPlayerFromId(source)
	local src = source

	MySQL.Async.fetchAll('Select * FROM sm_properties_objects', {}, function(result)
		for i=1, #result, 1 do
			if result[i].spawned == 0 then
				TriggerClientEvent('spawnCheck', src, result[i].name, result[i].x, result[i].y, result[i].z, result[i].r, result[i].currentAmount, result[i].selected, result[i].owner, result[i].locked, result[i].property)
			end
		end
    end)
end)

RegisterServerEvent('rustic_properties:SellProperty')
AddEventHandler('rustic_properties:SellProperty', function(propertyName)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local src = source

	MySQL.Async.fetchAll('Select * FROM sm_owned_properties', {}, function(result)
		for i=1, #result, 1 do
			if result[i].name == propertyName and result[i].owner == xPlayer.getIdentifier() then
				MySQL.Sync.execute("UPDATE sm_properties SET empty=@empty WHERE name=@name", {['@name'] = propertyName, ['@empty'] = 1})
				MySQL.Sync.execute("DELETE FROM sm_owned_properties WHERE name=@name", {['@name'] = propertyName})
			--	MySQL.Sync.execute("DELETE FROM rustic_house_blipcheck WHERE propertyxcord=@name", {['@name'] = propertyName})
				TriggerClientEvent('updateEmpty', src, propertyName, true)
				TriggerClientEvent('updateOwned', src, propertyName, false)
			end
		end
	end)
	
	MySQL.Async.fetchAll('Select * FROM sm_properties_objects', {}, function(result)
		for i=1, #result, 1 do
			if result[i].property == propertyName and result[i].owner == xPlayer.getIdentifier() then
				MySQL.Sync.execute("DELETE FROM sm_properties_objects WHERE property=@property", {['@property'] = propertyName})
				TriggerClientEvent('rustic_properties:deleteObjectsOnSell', src, propertyName)
				MySQL.Async.fetchAll('Select * FROM sm_properties_items', {}, function(result2)
					for f=1, #result2, 1 do
						if result[i].x == result2[f].x and result[i].y == result2[f].y and result[i].z == result2[f].z then
							MySQL.Sync.execute("DELETE FROM sm_properties_items WHERE x=@x AND y=@y AND z=@z", {['@x'] = result2[f].x, ['@y'] = result2[f].y, ['@z'] = result2[f].z})
						end
					end
				end)
			end
		end
    end)
end)

ESX.RegisterUsableItem('safe', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    xPlayer.removeInventoryItem('safe', 1)
	TriggerClientEvent('createClient', playerId, "p_v_43_safe_s")
end)


RegisterServerEvent('rustic_properties:addPropBack')
AddEventHandler('rustic_properties:addPropBack', function(propName)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local src = source
	if xPlayer.canCarryItem(propName, 1) then
		xPlayer.setInventoryItem(propName, 1)
	end
end)

ESX.RegisterServerCallback('rustic_properties:getPlayerInventory', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local money 	 = xPlayer.getMoney()
	local items      = xPlayer.inventory

	cb({
		money 	   = money,
		items      = items,
		weapons    = xPlayer.getLoadout()
	})
end)

RegisterServerEvent('rustic_properties:putItem')
AddEventHandler('rustic_properties:putItem', function(coords, type, item, label, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayerOwner = ESX.GetPlayerFromIdentifier(owner)

	if type == 'item_standard' then
		local playerItemCount = xPlayer.getInventoryItem(item).count

		if playerItemCount >= count and count > 0 then
			xPlayer.removeInventoryItem(item, count)
			MySQL.Async.fetchAll('Select * FROM sm_properties_items', {}, function(result)
				local found = false
				local number = nil
				if #result >= 1 then
					for i=1, #result, 1 do
						if result[i].item == item and result[i].x == coords.x and result[i].y == coords.y and result[i].z == coords.z then
							found = true
							number = i
							break
						end
					end
					if found then
						MySQL.Sync.execute("UPDATE sm_properties_items SET count=@count WHERE item=@item", {['@item'] = item, ['@count'] = result[number].count + count})
					else
						MySQL.Async.execute("INSERT INTO sm_properties_items (x, y, z, item, label, type, count) VALUES (@x,@y,@z,@item,@label,@type,@count)", {['@x'] = coords.x, ['@y'] = coords.y, ['@z'] = coords.z, ['@item'] = item, ['@label'] = label, ['@type'] = type, ['@count'] = count})
					end
				elseif #result < 1 then
					MySQL.Async.execute("INSERT INTO sm_properties_items (x, y, z, item, label, type, count) VALUES (@x,@y,@z,@item,@label,@type,@count)", {['@x'] = coords.x, ['@y'] = coords.y, ['@z'] = coords.z, ['@item'] = item, ['@label'] = label, ['@type'] = type, ['@count'] = count})
				end
			end)
		else
			xPlayer.showNotification('invalid_quantity')
		end
	elseif type == 'item_money' then
		if xPlayer.getMoney() >= count and count > 0 then
			xPlayer.removeMoney(count)
			MySQL.Async.fetchAll('Select * FROM sm_properties_items', {}, function(result)
				local found = false
				local number = nil
				if #result >= 1 then
					for i=1, #result, 1 do
						if result[i].item == item and result[i].x == coords.x and result[i].y == coords.y and result[i].z == coords.z then
							found = true
							number = i
							break
						end
					end
					if found then
						MySQL.Sync.execute("UPDATE sm_properties_items SET count=@count WHERE item=@item", {['@item'] = item, ['@count'] = result[number].count + count})
					else
						MySQL.Async.execute("INSERT INTO sm_properties_items (x, y, z, item, label, type, count) VALUES (@x,@y,@z,@item,@label,@type,@count)", {['@x'] = coords.x, ['@y'] = coords.y, ['@z'] = coords.z, ['@item'] = item, ['@label'] = label, ['@type'] = type, ['@count'] = count})
					end
				elseif #result < 1 then
					MySQL.Async.execute("INSERT INTO sm_properties_items (x, y, z, item, label, type, count) VALUES (@x,@y,@z,@item,@label,@type,@count)", {['@x'] = coords.x, ['@y'] = coords.y, ['@z'] = coords.z, ['@item'] = item, ['@label'] = label, ['@type'] = type, ['@count'] = count})
				end
			end)
		else
			xPlayer.showNotification('amount_invalid')
		end
	elseif type == 'item_weapon' then
		if xPlayer.hasWeapon(item) then
			MySQL.Async.fetchAll('Select * FROM sm_properties_items', {}, function(result)
				xPlayer.removeWeapon(item)
				for i=1, #result, 1 do
					if result[i].item == item then
						found = true
						number = i
						break
					end
				end
				if found then
					MySQL.Sync.execute("UPDATE sm_properties_items SET amount=@amount WHERE item=@item", {['@item'] = item, ['@amount'] = result[number].amount + 1})
				else
					MySQL.Async.execute("INSERT INTO sm_properties_items (x, y, z, item, label, type, amount, count) VALUES (@x,@y,@z,@item,@label,@type,@amount,@count)", {['@x'] = coords.x, ['@y'] = coords.y, ['@z'] = coords.z, ['@item'] = item, ['@label'] = label, ['@type'] = type, ['@amount'] = 1, ['@count'] = count})
				end
			end)
		end
	end
end)


ESX.RegisterServerCallback('rustic_properties:getPropertyInventory', function(source, cb, coords)
	local xPlayer    = ESX.GetPlayerFromIdentifier(source)
	
	MySQL.Async.fetchAll('Select * FROM sm_properties_items', {}, function(result)
		local money 	 = 0
		local items      = {}
		local weapons    = {}	
		for i=1, #result, 1 do
			if result[i].x == coords.x and result[i].y == coords.y and result[i].z == coords.z then
				if result[i].type == "item_standard" then
					table.insert(items, {
						name  = result[i].item,
						count = result[i].count,
						label = result[i].label
					})
				elseif result[i].type == "item_weapon" then
					table.insert(weapons, {
						name  = result[i].item,
						amount = result[i].amount,
						ammo = result[i].count
					})
				elseif result[i].type ==  'item_money' then
					money = result[i].count
				end
			end
		end
		cb({
			items      = items,
			weapons    = weapons,
			money 	   = money
		})
	end)
end)


RegisterServerEvent('rustic_properties:getItem')
AddEventHandler('rustic_properties:getItem', function(coords, type, item, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local src = source
	MySQL.Async.fetchAll('Select * FROM sm_properties_items', {}, function(result)
		for i=1, #result, 1 do
			if result[i].x == coords.x and result[i].y == coords.y and result[i].z == coords.z and result[i].item == item then
				if type == 'item_standard' then
					if count > 0 and result[i].count >= count then
						if xPlayer.canCarryItem(item, count) then
							if result[i].count > count then
								MySQL.Sync.execute("UPDATE sm_properties_items SET count=@count WHERE item=@item", {['@item'] = item, ['@count'] = result[i].count - count})
							elseif result[i].count == count then
								MySQL.Async.execute('DELETE FROM sm_properties_items WHERE item = @item', {['@item'] = item})
							end
							xPlayer.addInventoryItem(item, count)
						else
							TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'You cant hold this item.'})
						end
					else
						TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'There isnt enough in the property.'})
					end
				elseif type == 'item_money' then
					if count > 0 and result[i].count >= count then
						if result[i].count > count then
							MySQL.Sync.execute("UPDATE sm_properties_items SET count=@count WHERE item=@item", {['@item'] = item, ['@count'] = result[i].count - count})
						elseif result[i].count == count then
							MySQL.Async.execute('DELETE FROM sm_properties_items WHERE item = @item', {['@item'] = item})
						end
						xPlayer.addMoney(count)
					else
						TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'There isnt enough in the property.'})
					end
				elseif type == 'item_weapon' then
					if not xPlayer.hasWeapon(item) then
						if result[i].amount >= 1 then
							if result[i].amount > 1 then
								MySQL.Sync.execute("UPDATE sm_properties_items SET amount=@amount WHERE item=@item", {['@item'] = item, ['@amount'] = result[i].amount - 1})
							elseif result[i].amount == 1 then
								MySQL.Async.execute('DELETE FROM sm_properties_items WHERE item = @item', {['@item'] = item})
							end
							xPlayer.addWeapon(result[i].item, result[i].count)
						else
							TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'There isnt enough in the property.'})
						end
					else
						TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'You already have this weapon.'})
					end
				end
			end
		end
	end)
end)

-- LISTNER TO SEE IF A HOUSE IS BOUGHT AND REMOVE IT FROM THE MAP
RegisterServerEvent('rustic_properties:checkifitsbought')
AddEventHandler('rustic_properties:checkifitsbought', function()

	MySQL.Async.fetchAll('SELECT * FROM sm_owned_properties', {}, function(result)
	MySQL.Async.fetchAll('SELECT * FROM rustic_house_blipcheck', {}, function(result2)
			TriggerClientEvent('setownedblips', -1, result, result2)
	end)
	end)
end)


RegisterServerEvent('rustic_properties:addingblip')
AddEventHandler('rustic_properties:addingblip', function(addme)

	MySQL.Async.execute("INSERT INTO rustic_house_blipcheck (propertyxcord) VALUES (@name)", {['@name'] = addme})
	end)

-- END OF LISTENER