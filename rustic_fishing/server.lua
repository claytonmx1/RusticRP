ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('turtlebait', function(source)

	local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('fishingrod').count > 0 then
		TriggerClientEvent('fishing:setbait', _source, "turtlebait")
		
		--xPlayer.removeInventoryItem('turtlebait', 1)
		--TriggerClientEvent('fishing:message', _source, "~g~You attach the turtle bait onto your fishing rod")
		TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'success', text = "You Attach TurtBait On Your Hook", length = 5500})
	else
		--TriggerClientEvent('fishing:message', _source, "~r~You dont have a fishing rod")
		TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = "You Need A Fishing Rod!", length = 5500})
	end
	
end)

ESX.RegisterUsableItem('fishbait', function(source)

	local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('fishingrod').count > 0 then
		TriggerClientEvent('fishing:setbait', _source, "fishbait")
		
		--xPlayer.removeInventoryItem('fishbait', 1)
		--TriggerClientEvent('fishing:message', _source, "~g~You attach the fish bait onto your fishing rod")
		TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'success', text = "You Attach Fish Bait On Your Hook", length = 5500})
		
	else
		--TriggerClientEvent('fishing:message', _source, "~r~You dont have a fishing rod")
		TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = "You Need A Fishing Rod!", length = 5500})
	end
	
end)

ESX.RegisterUsableItem('turtle', function(source)

	local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('fishingrod').count > 0 then
		TriggerClientEvent('fishing:setbait', _source, "turtle")
		
		--xPlayer.removeInventoryItem('turtle', 1)
		--TriggerClientEvent('fishing:message', _source, "~g~You attach the turtle meat onto the fishing rod")
		TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'success', text = "You Attach Turtle Meat On Your Hook", length = 5500})
	else
		--TriggerClientEvent('fishing:message', _source, "~r~You dont have a fishing rod")
		TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = "You Need A Fishing Rod!", length = 5500})
	end
	
end)

--ESX.RegisterUsableItem('dolphin', function(source)

	--local _source = source
	--xPlayer = ESX.GetPlayerFromId(_source)
	--if xPlayer.getInventoryItem('fishingrod').count > 0 then
	--	TriggerClientEvent('fishing:setbait', _source, "sharktiger")
		
	--	xPlayer.removeInventoryItem('dolphin', 1)
	--	TriggerClientEvent('fishing:message', _source, "~g~You attach the dolphin meat onto the fishing rod")
	--else
	--	TriggerClientEvent('fishing:message', _source, "~r~You dont have a fishing rod")
	--end
	
--end)

--ESX.RegisterUsableItem('sharktiger', function(source)

--	local _source = source
--	xPlayer = ESX.GetPlayerFromId(_source)
--	if xPlayer.getInventoryItem('fishingrod').count > 0 then
	--	TriggerClientEvent('fishing:setbait', _source, "sharkhammer")
		
	--	xPlayer.removeInventoryItem('sharktiger', 1)
	--	TriggerClientEvent('fishing:message', _source, "~g~You attach the tiger shark meat onto the fishing rod")
	--else
	--	TriggerClientEvent('fishing:message', _source, "~r~You dont have a fishing rod")
	--end
	
--end)

--ESX.RegisterUsableItem('sharkhammer', function(source)

	--local _source = source
	--xPlayer = ESX.GetPlayerFromId(_source)
--	if xPlayer.getInventoryItem('fishingrod').count > 0 then
--		TriggerClientEvent('fishing:setbait', _source, "killerwhale")		
	--	xPlayer.removeInventoryItem('sharkhammer', 1)
	--	TriggerClientEvent('fishing:message', _source, "~g~You attach the hammerhead shark meat onto the fishing rod")
--	else
	--	TriggerClientEvent('fishing:message', _source, "~r~You dont have a fishing rod")
--	end
	
--end)


ESX.RegisterUsableItem('fishingrod', function(source)

	local _source = source
	TriggerClientEvent('fishing:fishstart', _source)
	
	

end)

--[[Working Harpoon to use for Whales
ESX.RegisterUsableItem('harpoon', function(source)

	local _source = source
	TriggerClientEvent('fishing:fishstart', _source)
	
	

end)]]


-- Start catching shit			
RegisterNetEvent('fishing:catch')
AddEventHandler('fishing:catch', function(bait)
	local _source = source
	local weight = 2
	local rnd = math.random(1,100)
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	--regular turtle bait shit
	
	if bait == "turtlebait" then
		if rnd >= 75 then
			if rnd >= 95 then
				TriggerClientEvent('fishing:setbait', _source, "none")
				--TriggerClientEvent('fishing:message', _source, "It was huge and it broke your ~y~fishing rod!")
				TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = "Your Rod Broke, The Turtle Cut The Line!", length = 5500})
				TriggerClientEvent('fishing:break', _source)
				xPlayer.removeInventoryItem('fishingrod', 1)
			else
				TriggerClientEvent('fishing:setbait', _source, "none")
				if xPlayer.getWeight() > 100 then
					--TriggerClientEvent('fishing:message', _source, "~r~You cant hold more turtles")
					TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = "You Cant Hold More Turtles!", length = 5500})
				else
					--TriggerClientEvent('fishing:message', _source, "You caught a ~y~turtle!~s~\n ")
					TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'success', text = "You Caught A Turtle, These Are Illegal To Possess!", length = 5500})
					TriggerClientEvent('fish:spawnPed', _source)
					xPlayer.addInventoryItem('turtle', 1)
					xPlayer.removeInventoryItem('turtlebait', 1)
				end
			end
		else
			if rnd <= 75 then
				if xPlayer.getWeight() > 100 then
					--TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
					TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = "You Cant Hold More Fish!", length = 5500})
				else
					weight = math.random(4,9)
					--TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish~s~: ~g~~h~" .. weight .. "lbs")
					TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'success', text = "You Caught A Fish: lbs".. weight .."lbs", length = 5500})
					xPlayer.addInventoryItem('fish', weight)
					xPlayer.removeInventoryItem('turtlebait', 1)
					TriggerClientEvent('fish:spawnPed', _source)
				end
			else
				if xPlayer.getWeight() > 100 then
					--TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
					TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = "You Cant Hold More Fish!", length = 5500})
				else
					weight = math.random(2,6)
					--TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish~s~: ~g~~h~" .. weight .. "lbs")
					TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'success', text = "You Caught A Fish: ".. weight .."lbs", length = 5500})
					xPlayer.addInventoryItem('fish', weight)
					xPlayer.removeInventoryItem('turtlebait', 1)
					TriggerClientEvent('fish:spawnPed', _source)
				end
			end
		end
	else
		---end of turtle bait shit

		--start of fish bait fishing
		if bait == "fishbait" then
			if rnd >= 75 then
				TriggerClientEvent('fishing:setbait', _source, "none")
				if xPlayer.getWeight() > 100 then
					--TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
					TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = "You Cant Hold More Fish!", length = 5500})
				else
					weight = math.random(4,11)
				--	TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish~s~: ~g~~h~" .. weight .. "lbs")
					TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'success', text = "You Caught A Fish: ".. weight .."lbs", length = 5500})
					xPlayer.addInventoryItem('fish', weight)
					xPlayer.removeInventoryItem('fishbait', 1)
					TriggerClientEvent('fish:spawnPed', _source)
				end

			else
				if xPlayer.getWeight() > 100 then
					--TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
					TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = "You Cant Hold More Fish!", length = 5500})
				else
					weight = math.random(1,6)
					--TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish~s~: ~g~~h~" .. weight .. "lbs")
					TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'success', text = "You Caught A Fish: ".. weight .."lbs", length = 5500})
					xPlayer.addInventoryItem('fish', weight)
					xPlayer.removeInventoryItem('fishbait', 1)
					TriggerClientEvent('fish:spawnPed', _source)
				end
			end
		end
		--end of fish bait shit

		--no bait on rod shit
		if bait == "none" then
			if rnd >= 70 then
			--TriggerClientEvent('fishing:message', _source, "You are currently fishing without any equipped bait")
			TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = "You Are Fishing Without Bait!", length = 5500})
			if  xPlayer.getWeight() > 100 then
					--TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
					TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = "You Cant Hold More Fish!", length = 5500})
				else
					weight = math.random(2,4)
					--TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish~s~: ~g~~h~" .. weight .. "lbs")
					TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'success', text = "You Caught A Fish: ".. weight .."lbs", length = 5500})
					xPlayer.addInventoryItem('fish', weight)
					TriggerClientEvent('fish:spawnPed', _source)
				end
			else
			--TriggerClientEvent('fishing:message', _source, "You are currently fishing without any equipped bait")
			TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = "You Are Fishing Without Bait!", length = 5500})
				if xPlayer.getWeight() > 100 then
					--TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
					TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = "You Cant Hold More Fish!", length = 5500})
				else
					weight = math.random(1,2)
					--TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish~s~: ~g~~h~" .. weight .. "lbs")
					TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'success', text = "You Caught A Fish: ".. weight .."lbs", length = 5500})
					xPlayer.addInventoryItem('fish', weight)
					TriggerClientEvent('fish:spawnPed', _source)
				end
			end
		end
		-- end of no bait in rod

		--start of shark fishing
		if bait == "turtle" then
			if rnd >= 85 then
				if rnd >= 97 then
					TriggerClientEvent('fishing:setbait', _source, "none")
					--TriggerClientEvent('fishing:message', _source, "~r~It was huge and it broke your fishing rod!")
					TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = "Shark Busted Your Fishing Rod!", length = 5500})
					TriggerClientEvent('fishing:break', _source)
					xPlayer.removeInventoryItem('fishingrod', 1)
				else
					if xPlayer.getWeight() > 100  then
						TriggerClientEvent('fishing:setbait', _source, "none")
						--TriggerClientEvent('fishing:message', _source, "~r~You cant hold more sharks")
						TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = "You Cant Hold More Sharks!", length = 5500})
					else
						--TriggerClientEvent('fishing:message', _source, "You caught a ~y~shark!~s~\nThese are endangered species and are ~r~illegal~s~ to possess")
						TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'success', text = "You Caught A Shark! These Are Illegal To Possess", length = 5500})
						TriggerClientEvent('shark:spawnPed', _source)
						xPlayer.addInventoryItem('shark', 1)
						xPlayer.removeInventoryItem('turtle', 1)
					end
				end
			else
				if xPlayer.getWeight() > 100 then
					--TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
					TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = "You Cant Hold More Fish!", length = 5500})
				else
					weight = math.random(4,8)
					--TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish no shark ths time: ~g~~h~" .. weight .. "lbs")
					TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'success', text = "You Caught A Fish: ".. weight .."lbs", length = 5500})
					xPlayer.addInventoryItem('fish', weight)
					xPlayer.removeInventoryItem('turtle', 1)
					TriggerClientEvent('fish:spawnPed', _source)
				end
			end
		end
		--end of shark shit

		--[[
		if bait == "sharkhammer" then
			if rnd >= 82 then
				if rnd >= 91 then
					TriggerClientEvent('fishing:setbait', _source, "none")
					TriggerClientEvent('fishing:message', _source, "~r~It was huge and it broke your fishing rod!")
					TriggerClientEvent('fishing:break', _source)
					xPlayer.removeInventoryItem('fishingrod', 1)
				else
					if xPlayer.getInventoryItem('sharkhammer').count > 1  then
						TriggerClientEvent('fishing:setbait', _source, "none")
						TriggerClientEvent('fishing:message', _source, "~r~You cant hold more hammerhead sharks")
					else
						TriggerClientEvent('fishing:message', _source, "You caught a ~y~hammerhead shark!~s~\nThese are endangered species and are ~r~illegal~s~ to possess")
						TriggerClientEvent('sharkhammer:spawnPed', _source)
						xPlayer.addInventoryItem('sharkhammer', 1)
					end
				end
			else
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(4,8)
					TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish: ~g~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
					TriggerClientEvent('fish:spawnPed', _source)
				end
			end
        end
		if bait == "killerwhale" then
			if rnd >= 82 then
				if rnd >= 91 then
					TriggerClientEvent('fishing:setbait', _source, "none")
					TriggerClientEvent('fishing:message', _source, "~r~It was huge and it broke your fishing rod!")
					TriggerClientEvent('fishing:break', _source)
					xPlayer.removeInventoryItem('fishingrod', 1)
				else
					if xPlayer.getInventoryItem('killerwhale').count > 0  then
						TriggerClientEvent('fishing:setbait', _source, "none")
						TriggerClientEvent('fishing:message', _source, "~r~You cant hold more killer whales")
					else
						TriggerClientEvent('fishing:message', _source, "You caught a ~y~killer whale!~s~\nThese are endangered species and are ~r~illegal~s~ to possess")
						TriggerClientEvent('killerwhale:spawnPed', _source)
						xPlayer.addInventoryItem('killerwhale', 1)
					end
				end
			else
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(4,8)
					TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish: ~g~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
					TriggerClientEvent('fish:spawnPed', _source)
				end
			end
		end
		if bait == "dolphin" then
			if rnd >= 82 then
				if rnd >= 91 then
					TriggerClientEvent('fishing:setbait', _source, "none")
					TriggerClientEvent('fishing:message', _source, "~r~It was huge and it broke your fishing rod!")
					TriggerClientEvent('fishing:break', _source)
					xPlayer.removeInventoryItem('fishingrod', 1)
				else
					if xPlayer.getInventoryItem('dolphin').count > 1  then
						TriggerClientEvent('fishing:setbait', _source, "none")
						TriggerClientEvent('fishing:message', _source, "~r~You cant hold more dolphins")
					else
						TriggerClientEvent('fishing:message', _source, "You caught a ~y~dolphin!~s~\nThese are endangered species and are ~r~illegal~s~ to possess")
						TriggerClientEvent('dolphin:spawnPed', _source)
						xPlayer.addInventoryItem('dolphin', 1)
					end
				end
			else
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(4,8)
					TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish: ~g~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
					TriggerClientEvent('fish:spawnPed', _source)
				end
			end
        end
		--]]
	end
end)

RegisterServerEvent("fishing:lowmoney")
AddEventHandler("fishing:lowmoney", function(model)
    local _source = source	
	local myModel = model
	local xPlayer = ESX.GetPlayerFromId(_source)
	for k, v in ipairs(Server_Config.RentalBoats) do
		if GetHashKey(v.model) == myModel then
			xPlayer.removeMoney(v.price)
		end
	end
end)

RegisterServerEvent("fishing:returnDeposit")
AddEventHandler("fishing:returnDeposit", function(model)
	local _source = source
	local myModel = model
	local xPlayer = ESX.GetPlayerFromId(_source)
	for k, v in ipairs(Server_Config.RentalBoats) do
		if GetHashKey(v.model) == myModel then
			xPlayer.addMoney(v.price / 2)
		end
	end
end)

RegisterServerEvent('fishing:startSelling')
AddEventHandler('fishing:startSelling', function(yaItem)
	local _source = source
	local item = yaItem
	local xPlayer  = ESX.GetPlayerFromId(_source)
	if item == "legal" then
		local FishQuantity = xPlayer.getInventoryItem('fish').count
			if FishQuantity <= 4 then
			--TriggerClientEvent('esx:showNotification', source, 'You dont have enough~y~ fish')
			TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = "You Don't Have Enough Fish To Sell!", length = 3500})			
		else   
			xPlayer.removeInventoryItem('fish', 5)
			local payment = Server_Config.FishPrice.a
			payment = math.random(Server_Config.FishPrice.a, Server_Config.FishPrice.b) 
			xPlayer.addAccountMoney('bank', payment)
			TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'success', text = "Sold Fish For: $".. payment, length = 3500})
		end	
	end
	if item == "illegal" then
		local FishQuantity = xPlayer.getInventoryItem('shark').count
		if FishQuantity <= 0 then
			--TriggerClientEvent('esx:showNotification', source, 'You dont have enough~y~ Sharks')
			TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = "You Don't Have Sharks To Sell!", length = 3500})			
		else   
			xPlayer.removeInventoryItem('shark', 1)
			local payment = Server_Config.sharkPrice.a
			payment = math.random(Server_Config.sharkPrice.a, Server_Config.sharkPrice.b) 
			xPlayer.addMoney(payment)
			TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'success', text = "Sold Shark For: $".. payment, length = 3500})
		end
	end
	if item == "illegal" then
		local FishQuantity = xPlayer.getInventoryItem('turtle').count
		if FishQuantity <= 0 then
			--TriggerClientEvent('esx:showNotification', source, 'You dont have enough~y~ Turtles')
			TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = "You Don't Have Turtles To Sell!", length = 3500})	
		else   
			xPlayer.removeInventoryItem('turtle', 1)
			local payment = Server_Config.turtlePrice.a
			payment = math.random(Server_Config.turtlePrice.a, Server_Config.turtlePrice.b)
			xPlayer.addMoney(payment)
			TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'success', text = "Sold Turtle For: $".. payment, length = 3500})
		end
	end
--	if item == "illegal" then
	--	local FishQuantity = xPlayer.getInventoryItem('dolphin').count
	--	if FishQuantity <= 0 then
	--		TriggerClientEvent('esx:showNotification', source, 'You dont have enough~y~ Dolphins')			
	--	else   
		--	xPlayer.removeInventoryItem('dolphin', 1)
		--	local payment = Server_Config.dolphinPrice.a
		--	payment = math.random(Server_Config.dolphinPrice.a, Server_Config.dolphinPrice.b)
		--	xPlayer.addAccountMoney('black_money', payment)
	--	end
	--end
	--if item == "illegal" then
	--	local FishQuantity = xPlayer.getInventoryItem('killerwhale').count
	--	if FishQuantity <= 0 then
	--		TriggerClientEvent('esx:showNotification', source, 'You dont have enough~y~ Killer Whales')			
	--	else   
	--		xPlayer.removeInventoryItem('killerwhale', 1)
	--		local payment = Server_Config.killerwhalePrice.a
	--		payment = math.random(Server_Config.killerwhalePrice.a, Server_Config.killerwhalePrice.b)
	--		xPlayer.addAccountMoney('black_money', payment)
	--	end
--	end
	--if item == "legal" then
	--	local FishQuantity = xPlayer.getInventoryItem('stingray').count
	--	if FishQuantity <= 0 then
	---		TriggerClientEvent('esx:showNotification', source, 'You dont have enough~y~ Stingrays')			
	--	else   
		--	xPlayer.removeInventoryItem('stingray', 1)
		--	local payment = Server_Config.stingrayPrice.a
		--	payment = math.random(Server_Config.stingrayPrice.a, Server_Config.stingrayPrice.b)
	--		xPlayer.addMoney(payment)
	--	end
	--end
end)


RegisterNetEvent('fishing:checkbaitcount')
AddEventHandler('fishing:checkbaitcount', function(baitimusing)
	local _source = source
	local item = yaItem
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local whattodo = ""
	local baitcount = xPlayer.getInventoryItem(baitimusing).count
	
	if baitcount > 0 then

	end
	if baitcount <= 0 then
		whattodo = "none"
		TriggerClientEvent('fishing:setbait', _source, whattodo)
	end

end)