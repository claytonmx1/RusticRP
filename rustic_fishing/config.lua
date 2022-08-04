Config = {}
	---------------------------------------------------------------
	--=====How long should it take for player to catch a fish=======--
	---------------------------------------------------------------
	--Time in miliseconds
	Config.FishTime = {a = 20000, b = 44000}
	Config.nobaitFishTime = {a = 40000, b = 45000}

	--------------------------------------------------------
	--=====Locations where players can sell stuff========--
	--------------------------------------------------------

	Config.Sell = {
		{
			pos = vec3(-3248.97, 990.8, 11.49), 
			type = "legal",
			sellText = "Fish Market",
			blip = 317,
			colour = 69
		},
       {
			pos = vec3(-317.21 , -2778.76, 4.0), 
			type = "illegal", 
			sellText = "Fish Black Market",
			blip = 68,
			colour = 49
		}
	}

	--------------------------------------------------------
	--=====Locations where players can rent boats========--
	--------------------------------------------------------
Config.MarkerZones = { 
	{
		Marker = vec3(-3426.7,	955.66, 7.35), -- Rental Marker
		Spawn = vec3(-3426.2, 942.4, 1.1), -- Boat Spawn Point
		SpawnHeading = 90.0, -- Boat Heading
		Return = vec3(-3436.27, 954.18, 0.19) -- Boat Return Point
	},
	{
		Marker = vec3(-806.17, -1496.57, 0.6),
		Spawn = vec3(-802.05, -1504.36, -0.47),
		SpawnHeading = 112.27,
		Return = vec3(-802.05, -1503.56, -0.09)
	},  
	{
		Marker = vec3(-281.25,	6632.1, 6.4),
		Spawn = vec3(-330.22, 6660.0, 1.0),
		SpawnHeading = 45.0,
		Return = vec3(-291.52, 6644.76, -0.13)
	},
	{
		Marker = vec3(3855.0, 4463.7, 1.6),
		Spawn = vec3(3885.2, 4507.2, 1.0),
		SpawnHeading = 300.0,
		Return = vec3(3862.1, 4440.4, -0.2)
	},
	{
		Marker = vec3(1330.8, 4226.6, 32.9),
		Spawn = vec3(1343.44, 4190.42, 30.0),
		SpawnSpawnHeading = 200.0,
		Return = vec3(1330.92, 4207.59, 29.65)
	},
}

Config.RentalBoats = {
	{model = "seashark", price = 500},
	{model = "dinghy", price = 1000},
	{model = "marquis", price = 1250},
	{model = "tropic", price = 1500},
	{model = "jetmax", price = 1500},
	{model = "speeder", price = 1500},
	--{model = "tug", price = 2500},
	--{model = "submersible", price = 5000},
	
}