Server_Config = {}
	-------------------------------------------
	--=====Prices of the items players can sell==========--
	--------------------------------------------------------
	--First amount minimum price second maximum amount (the amount player will get is random between those two numbers)
	Server_Config.FishPrice = {a = 100, b = 150} -- Will get clean money THIS PRICE IS FOR EVERY 5 FISH ITEMS (5 kg)
	Server_Config.sharkPrice = {a = 2000, b = 4000} -- Will get dirty money
	Server_Config.turtlePrice = {a = 1000, b = 2000} -- Will get dirty money
--	Server_Config.dolphinPrice = {a = 1000, b = 1500} -- Will get dirty money
--	Server_Config.stingrayPrice = {a = 500, b = 1000} -- Will get clean money
--	Server_Config.killerwhalePrice = {a = 10000, b = 15000} -- will get dirty money
	Server_Config.RentalBoats = {
		-- Fee and Deposit is 50% of the price, you get the deposit returned
		-- Add more boats if you want
		{model = "smallboat", price = 2500},
	}