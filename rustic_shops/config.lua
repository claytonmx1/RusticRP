Config = {}

Config.MallPed = `s_m_m_ammucountry`


Config.Shops = {

	RusticTwentyFourSeven = {

		Items = {
			{
				name = 'bread',
				type = 'item',
				price = 50
			},

			{
				name = 'water',
				type = 'item',
				price = 50
			}
		},

		Pos = {
			vector3(373.8, 325.8, 103.5),
			vector3(2557.4, 382.2, 108.6),
			vector3(-3038.9, 585.9, 7.9),
			vector3(-3241.9, 1001.4, 12.8),
			vector3(547.4, 2671.7, 42.1),
			vector3(1961.4, 3740.6, 32.3),
			vector3(2678.9, 3280.6, 55.2),
			vector3(1729.2, 6414.1, 35.0)
		},

		MarkerLabel = 'Rustic 24/7 Store',
		ShowBlip = true,
		ShowMarker = true,
		Size  = 0.7,
		Type  = 59,
		Color = 2
	},

	RusticLiquorStore = {

		Items = {
			{
				name = 'bread',
				type = 'item',
				price = 50
			},

			{
				name = 'water',
				type = 'item',
				price = 50
			}
		},

		Pos = {
			vector3(1135.8, -982.2, 46.4),
			vector3(-1222.9, -906.9, 12.3),
			vector3(-1487.5, -379.1, 40.1),
			vector3(-2968.2, 390.9, 15.0),
			vector3(1166.0, 2708.9, 38.1),
			vector3(1392.5, 3604.6,  34.9)
		},

		MarkerLabel = 'Rustic Liquor Store',
		ShowBlip = true,
		ShowMarker = true,
		Size  = 0.7,
		Type  = 59,
		Color = 2
	},

	RusticGasStationShop = {

		Items = {
			{
			 	name = 'bread',
				type = 'item',
			 	price = 50
			},

			{
				name = 'water',
			    type = 'item',
				price = 50
		    }

		},

		Pos = {
			vector3(-48.5,  -1757.5, 29.4),
			vector3(1163.3, -323.8, 69.2),
			vector3(-707.5, -914.2, 19.2),
			vector3(-1820.5, 792.5, 138.1),
			vector3(1698.3, 4924.4, 42.0)
		},

		MarkerLabel = 'Rustic Gas Station Shop',
		ShowBlip = true,
		ShowMarker = true,
		Size  = 0.7,
		Type  = 59,
		Color = 2
	},

	RusticAmmunation = {

		Items = {
			{
				name = 'WEAPON_PISTOL',
				type = 'weapon',
				price = 5000
			},

			{
				name = 'WEAPON_KNUCKLE',
				type = 'weapon',
				price = 2500
			},

			{
				name = 'WEAPON_KNIFE',
				type = 'weapon',
				price = 2500
			},
			{
				name = 'box_9mm',
				type = 'item',
				price = 250
			}

		},

		Pos = {
			vector3(-662.1, -935.3, 21.8),
			vector3(810.2, -2157.3, 29.6),
			vector3(1693.4, 3759.5, 34.7),
			vector3(-330.2, 6083.8, 31.4),
			vector3(252.3, -50.0, 69.9),
			vector3(22.0, -1107.2, 29.8),
			vector3(2567.6, 294.3, 108.7),
			vector3(-1117.5, 2698.6, 18.5),
			vector3(842.4, -1033.4, 28.1)
		},

		MarkerLabel = 'Rustic Ammunation',
		ShowBlip = true,
		ShowMarker = true,
		Type  = 110,
		Size  = 0.7,
		Color = 1
	},

	RusticMall = {

		Items = {
			{
				name = 'bread',
				type = 'item',
				price = 50
			},

			{
				name = 'water',
				type = 'item',
				price = 50
			},

			{
				name = 'fishingrod',
				type = 'item',
				price = 100
			}
		},

		Pos = {
			vector3(2748.29, 3472.39, 55.68),
			vector3(43.93, -1747.35, 29.46)
		},

		MarkerLabel = 'Rustic Mall',
		ShowBlip = true,
		ShowMarker = true,
		Size  = 0.7,
		Type  = 59,
		Color = 17
	}

	--[[
	BlackWeashop = {

		Items = {
			{
				name = 'weapon_pistol',
				type = 'weapon',
				blackMoney = true,
				price = 1100
			},

			{
				name = 'weapon_stickybomb',
				type = 'weapon',
				blackMoney = true,
				price = 900
			}
		},

		Pos = {
			vector3(-1306.2, -394.0, 36.6)
		},

		MarkerLabel = 'Black Market',
		ShowBlip = false,
		ShowMarker = true,
		Type  = 110,
		Size  = 1.0,
		Color = 1
	}
	--]]
}