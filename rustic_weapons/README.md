Hello! Thank you for buying my script! You can't imagine how grateful I am!

In order to get the script 100% functional you have to follow some steps.

1. Go to your database and execute the following command.

INSERT INTO `items` (name, label, weight) VALUES
	('box_308', '.308 Box', 1),
	('ammo_308', '.308 Ammo', 1),
	('box_45acp', '.45 ACP Box', 1),
	('ammo_45acp', '.45 ACP Ammo', 1),
	('box_556', '5.56 Box', 1),
	('ammo_556', '5.56 Ammo', 1),
	('box_762', '7.62 Box', 1),
	('ammo_762', '7.62 Ammo', 1),
	('box_9mm', '9mm Box', 1),
	('ammo_9mm', '9mm Ammo', 1),
	('box_gauge12', 'Gauge 12 Box', 1),
	('ammo_gauge12', 'Gauge 12 Ammo', 1),
	('ammo_40x46', '40x46 Ammo', 1),
	('rocket', 'Rocket', 1),
	('firework', 'Firework', 1),
	('suppressor', 'Suppressor', 1),
	('flashlight', 'Flashlight', 1),
	('grip', 'Grip', 1),
	('scope', 'Scope', 1),
	('yusuf', 'Yusuf', 1),
	('extendedclip', 'Extended Clip', 1)
;

2. If you want throwables to have ammo, you should do the following: 

	2.1 - Add the item to your database, I will add the molotov as an example.
	INSERT INTO `items` (name, label, weight) VALUES
		('ammo_molotov', 'Molotov Ammo', 1)
	;

	2.2 - Open config.lua and go to the line 106, you should write the name of the item in the "ammo" field just like that:

	name = 'WEAPON_MOLOTOV', type = 'throwable', ammo = 'ammo_molotov'

	2.3 - Open server.lua and go to the line 344.

	ESX.RegisterUsableItem('ammo_molotov', function(source)
    	TriggerClientEvent('rico_weapons:verifyAmmo', source, 'ammo_molotov')
	end)

3. If you want to add more ammo boxes, go to the line 386 and add the following:

	ESX.RegisterUsableItem('box_molotov', function(source)
	    local xPlayer = ESX.GetPlayerFromId(source)
	    
	    if Config.BoxGiveAmmoItem then
	        xPlayer.removeInventoryItem('box_molotov', 1)
	        xPlayer.addInventoryItem('ammo_molotov', Config.BoxSMGAmmoAmount)
	    else
	        TriggerClientEvent('rico_weapons:usarbox', source, 'box_molotov')
	    end
	end)

	Go to the line 106 again and now change the "box" field:

	name = 'WEAPON_MOLOTOV', type = 'throwable', ammo = 'ammo_molotov', box = 'box_molotov'

4. Have fun! :)


PS: If you have any problem or if you want the icons of all of the items do not hesitate to contact me on discord. Rico#0893