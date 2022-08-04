-- Leaked By: Leaking Hub | J. Snow | leakinghub.com

Config,Locale = {},{} -- do not touch

Config.locale = "en"

-- Command to store weapon
Config.SaveWeaponCmd = 'saveweapon'

-- Command to store weapon components
Config.SaveComponentsCmd = 'savecomponents'

-- true = give ammo as item | false = add ammo directly to the weapon
Config.BoxGiveAmmoItem = false 	

-- if true adds the clip size to the weapon | if false adds BoxAmmoAmount to the weapon
-- works only if BoxGiveAmmoItem = false
Config.BoxGiveClipSize = false

-- amount of ammo to give if BoxGiveAmmoItem = true or BoxGiveClipSize = false
Config.BoxRifleAmmoAmount = 10    -- Value used for 7.62 and 5.56 ammo
Config.BoxSniperAmmoAmount = 10   -- Value used for .308 boxes if the box gives items/for snipers if it loads them
Config.BoxPistolAmmoAmount = 5   -- Value used for .45 ACP boxes if the box gives items/for pistols if it loads them
Config.BoxShotgunAmmoAmount = 8  -- Value used for Gauge 12 boxes if the box gives items/for shotguns if it loads them
Config.BoxSMGAmmoAmount = 10      -- Value used for 9mm boxes if the box gives items/for SMG if it loads them


-- Diferent types of weapons: 	sniper
--								pistol
--								shotgun
--								smg
--								melee
--								throwable
--								heavy

Config.weaponsList = {

	-- Rifles
	{name = 'WEAPON_ADVANCEDRIFLE', 	type = 'rifle', ammo = 'ammo_556', box = 'box_556', suppressor = 'COMPONENT_AT_AR_SUPP', flashlight = 'COMPONENT_AT_AR_FLSH', grip = '', scope = 'COMPONENT_AT_SCOPE_SMALL', yusuf = 'COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE', extendedclip = 'COMPONENT_ADVANCEDRIFLE_CLIP_02'}, 			
	{name = 'WEAPON_ASSAULTRIFLE', 		type = 'rifle', ammo = 'ammo_762', box = 'box_762', suppressor = 'COMPONENT_AT_AR_SUPP_02', flashlight = 'COMPONENT_AT_AR_FLSH', grip = 'COMPONENT_AT_AR_AFGRIP', scope = 'COMPONENT_AT_SCOPE_MACRO', yusuf = 'COMPONENT_ASSAULTRIFLE_VARMOD_LUXE', extendedclip = 'COMPONENT_ASSAULTRIFLE_CLIP_02'},
	{name = 'WEAPON_BULLPUPRIFLE', 		type = 'rifle', ammo = 'ammo_556', box = 'box_556', suppressor = 'COMPONENT_AT_AR_SUPP', flashlight = 'COMPONENT_AT_AR_FLSH', grip = 'COMPONENT_AT_AR_AFGRIP', scope = 'COMPONENT_AT_SCOPE_SMALL', yusuf = 'COMPONENT_BULLPUPRIFLE_VARMOD_LOW', extendedclip = 'COMPONENT_BULLPUPRIFLE_CLIP_02'},
	{name = 'WEAPON_CARBINERIFLE', 		type = 'rifle', ammo = 'ammo_556', box = 'box_556', suppressor = 'COMPONENT_AT_AR_SUPP', flashlight = 'COMPONENT_AT_AR_FLSH', grip = 'COMPONENT_AT_AR_AFGRIP', scope = 'COMPONENT_AT_SCOPE_MEDIUM', yusuf = 'COMPONENT_CARBINERIFLE_VARMOD_LUXE', extendedclip = 'COMPONENT_CARBINERIFLE_CLIP_02'},
	{name = 'WEAPON_COMPACTRIFLE', 		type = 'rifle', ammo = 'ammo_762', box = 'box_762', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = 'COMPONENT_COMPACTRIFLE_CLIP_02'},
	{name = 'WEAPON_SPECIALCARBINE', 	type = 'rifle', ammo = 'ammo_556', box = 'box_556', suppressor = 'COMPONENT_AT_AR_SUPP_02', flashlight = 'COMPONENT_AT_AR_FLSH', grip = 'COMPONENT_AT_AR_AFGRIP', scope = 'COMPONENT_AT_SCOPE_MEDIUM', yusuf = 'COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER', extendedclip = 'COMPONENT_SPECIALCARBINE_CLIP_02'},

	-- Snipers
	{name = 'WEAPON_HEAVYSNIPER', 		type = 'sniper', ammo = 'ammo_308', box = 'box_308', suppressor = '', flashlight = '', grip = '', scope = 'COMPONENT_AT_SCOPE_LARGE', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_MARKSMANRIFLE', 	type = 'sniper', ammo = 'ammo_308', box = 'box_308', suppressor = 'COMPONENT_AT_AR_SUPP', flashlight = 'COMPONENT_AT_AR_FLSH', grip = 'COMPONENT_AT_AR_AFGRIP', scope = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM', yusuf = 'COMPONENT_MARKSMANRIFLE_VARMOD_LUXE', extendedclip = 'COMPONENT_MARKSMANRIFLE_CLIP_02'},
	{name = 'WEAPON_SNIPERRIFLE', 		type = 'sniper', ammo = 'ammo_308', box = 'box_308', suppressor = 'COMPONENT_AT_AR_SUPP_02', flashlight = '', grip = '', scope = 'COMPONENT_AT_SCOPE_LARGE', yusuf = 'COMPONENT_SNIPERRIFLE_VARMOD_LUXE', extendedclip = ''},

	-- Pistols
	{name = 'WEAPON_APPISTOL', 			type = 'pistol', ammo = 'ammo_9mm', box = 'box_9mm', suppressor = 'COMPONENT_AT_PI_SUPP', flashlight = 'COMPONENT_AT_PI_FLSH', grip = '', scope = '', yusuf = 'COMPONENT_APPISTOL_VARMOD_LUXE', extendedclip = 'COMPONENT_APPISTOL_CLIP_02'}, 				
	{name = 'WEAPON_COMBATPISTOL', 		type = 'pistol', ammo = 'ammo_9mm', box = 'box_9mm', suppressor = 'COMPONENT_AT_PI_SUPP', flashlight = 'COMPONENT_AT_PI_FLSH', grip = '', scope = '', yusuf = 'COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER', extendedclip = 'COMPONENT_COMBATPISTOL_CLIP_02'},
	{name = 'WEAPON_DOUBLEACTION', 		type = 'pistol', ammo = 'ammo_762', box = 'box_762', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_HEAVYPISTOL', 		type = 'pistol', ammo = 'ammo_45acp', box = 'box_45acp', suppressor = 'COMPONENT_AT_PI_SUPP', flashlight = 'COMPONENT_AT_PI_FLSH', grip = '', scope = '', yusuf = 'COMPONENT_HEAVYPISTOL_VARMOD_LUXE', extendedclip = 'COMPONENT_HEAVYPISTOL_CLIP_02'},
	{name = 'WEAPON_MACHINEPISTOL', 	type = 'pistol', ammo = 'ammo_45acp', box = 'box_45acp', suppressor = 'COMPONENT_AT_PI_SUPP', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = 'COMPONENT_MACHINEPISTOL_CLIP_02'},
	{name = 'WEAPON_MARKSMANPISTOL', 	type = 'pistol', ammo = 'ammo_45acp', box = 'box_45acp', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_PISTOL', 			type = 'pistol', ammo = 'ammo_9mm', box = 'box_9mm', suppressor = 'COMPONENT_AT_PI_SUPP_02', flashlight = 'COMPONENT_AT_PI_FLSH', grip = '', scope = '', yusuf = 'COMPONENT_PISTOL_VARMOD_LUXE', extendedclip = 'COMPONENT_PISTOL_CLIP_02'},
	{name = 'WEAPON_PISTOL50', 			type = 'pistol', ammo = 'ammo_45acp', box = 'box_45acp', suppressor = 'COMPONENT_AT_AR_SUPP_02', flashlight = 'COMPONENT_AT_PI_FLSH', grip = '', scope = '', yusuf = 'COMPONENT_PISTOL50_VARMOD_LUXE', extendedclip = 'COMPONENT_PISTOL50_CLIP_02'},
	{name = 'WEAPON_REVOLVER', 			type = 'pistol', ammo = 'ammo_762', box = 'box_762', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = 'COMPONENT_REVOLVER_VARMOD_BOSS', extendedclip = ''},
	{name = 'WEAPON_SNSPISTOL', 		type = 'pistol', ammo = 'ammo_45acp', box = 'box_45acp', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = 'COMPONENT_SNSPISTOL_VARMOD_LOWRIDER', extendedclip = 'COMPONENT_SNSPISTOL_CLIP_02'},
	{name = 'WEAPON_VINTAGEPISTOL', 	type = 'pistol', ammo = 'ammo_9mm', box = 'box_9mm', suppressor = 'COMPONENT_AT_PI_SUPP', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = 'COMPONENT_VINTAGEPISTOL_CLIP_02'},

	-- Shotguns
	{name = 'WEAPON_ASSAULTSHOTGUN', 	type = 'shotgun', ammo = 'ammo_gauge12', box = 'box_gauge12', suppressor = 'COMPONENT_AT_AR_SUPP', flashlight = 'COMPONENT_AT_AR_FLSH', grip = 'COMPONENT_AT_AR_AFGRIP', scope = '', yusuf = '', extendedclip = 'COMPONENT_ASSAULTSHOTGUN_CLIP_02'},		
	{name = 'WEAPON_AUTOSHOTGUN',		type = 'shotgun', ammo = 'ammo_gauge12', box = 'box_gauge12', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_BULLPUPSHOTGUN', 	type = 'shotgun', ammo = 'ammo_gauge12', box = 'box_gauge12', suppressor = 'COMPONENT_AT_AR_SUPP_02', flashlight = 'COMPONENT_AT_AR_FLSH', grip = 'COMPONENT_AT_AR_AFGRIP', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_DBSHOTGUN', 		type = 'shotgun', ammo = 'ammo_gauge12', box = 'box_gauge12', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_HEAVYSHOTGUN', 		type = 'shotgun', ammo = 'ammo_gauge12', box = 'box_gauge12', suppressor = 'COMPONENT_AT_AR_SUPP_02', flashlight = 'COMPONENT_AT_AR_FLSH', grip = 'COMPONENT_AT_AR_AFGRIP', scope = '', yusuf = '', extendedclip = 'COMPONENT_HEAVYSHOTGUN_CLIP_02'}, 
	{name = 'WEAPON_PUMPSHOTGUN', 		type = 'shotgun', ammo = 'ammo_gauge12', box = 'box_gauge12', suppressor = 'COMPONENT_AT_SR_SUPP', flashlight = 'COMPONENT_AT_AR_FLSH', grip = '', scope = '', yusuf = 'COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER', extendedclip = ''},
	{name = 'WEAPON_SAWNOFFSHOTGUN', 	type = 'shotgun', ammo = 'ammo_gauge12', box = 'box_gauge12', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = 'COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE', extendedclip = ''},

	-- SMG
	{name = 'WEAPON_ASSAULTSMG', 		type = 'smg', ammo = 'ammo_9mm', box = 'box_9mm', suppressor = 'COMPONENT_AT_AR_SUPP_02', flashlight = 'COMPONENT_AT_AR_FLSH', grip = '', scope = 'COMPONENT_AT_SCOPE_MACRO', yusuf = 'COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER', extendedclip = 'COMPONENT_ASSAULTSMG_CLIP_02'},					
	{name = 'WEAPON_COMBATPDW', 		type = 'smg', ammo = 'ammo_9mm', box = 'box_9mm', suppressor = '', flashlight = 'COMPONENT_AT_AR_FLSH', grip = 'COMPONENT_AT_AR_AFGRIP', scope = 'COMPONENT_AT_SCOPE_SMALL', yusuf = '', extendedclip = 'COMPONENT_COMBATPDW_CLIP_02'},
	{name = 'WEAPON_GUSENBERG', 		type = 'smg', ammo = 'ammo_9mm', box = 'box_9mm', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_MICROSMG', 			type = 'smg', ammo = 'ammo_9mm', box = 'box_9mm', suppressor = 'COMPONENT_AT_AR_SUPP_02', flashlight = 'COMPONENT_AT_PI_FLSH', grip = '', scope = 'COMPONENT_AT_SCOPE_MACRO', yusuf = 'COMPONENT_MICROSMG_VARMOD_LUXE', extendedclip = 'COMPONENT_MICROSMG_CLIP_02'},
	{name = 'WEAPON_MINIGUN', 			type = 'smg', ammo = 'ammo_9mm', box = 'box_9mm', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_MINISMG', 			type = 'smg', ammo = 'ammo_9mm', box = 'box_9mm', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = 'COMPONENT_MINISMG_CLIP_02'},
	{name = 'WEAPON_SMG', 				type = 'smg', ammo = 'ammo_9mm', box = 'box_9mm', suppressor = 'COMPONENT_AT_PI_SUPP', flashlight = 'COMPONENT_AT_AR_FLSH', grip = '', scope = 'COMPONENT_AT_SCOPE_MACRO_02', yusuf = 'COMPONENT_SMG_VARMOD_LUXE', extendedclip = 'COMPONENT_SMG_CLIP_02'},

	-- Melee
	{name = 'WEAPON_BAT', 				type = 'melee', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},								
	{name = 'WEAPON_BATTLEAXE', 		type = 'melee', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_BOTTLE', 			type = 'melee', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_CROWBAR', 			type = 'melee', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_DAGGER', 			type = 'melee', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_FLASHLIGHT', 		type = 'melee', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_GOLFCLUB', 			type = 'melee', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_HAMMER', 			type = 'melee', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_HATCHET', 			type = 'melee', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_KNIFE', 			type = 'melee', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_KNUCKLE', 			type = 'melee', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_MACHETE', 			type = 'melee', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_MUSKET', 			type = 'melee', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_NIGHTSTICK', 		type = 'melee', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_POOLCUE', 			type = 'melee', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_WRENCH', 			type = 'melee', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_SWITCHBLADE', 		type = 'melee', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},

	-- Throwables/others
	{name = 'WEAPON_PETROLCAN', 		type = 'throwable', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},						
	{name = 'WEAPON_BALL', 				type = 'throwable', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_BZGAS', 			type = 'throwable', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_FIREEXTINGUISHER', 	type = 'throwable', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_FLARE', 			type = 'throwable', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_GRENADE', 			type = 'throwable', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_MOLOTOV', 			type = 'throwable', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_PIPEBOMB', 			type = 'throwable', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_PROXMINE', 			type = 'throwable', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_SMOKEGRENADE', 		type = 'throwable', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_SNOWBALL', 			type = 'throwable', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_STICKYBOMB', 		type = 'throwable', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_STUNGUN', 			type = 'throwable', ammo = '', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},

	-- Heavy
	{name = 'WEAPON_COMBATMG', 			type = 'heavy', ammo = 'ammo_762', box = 'box_762', suppressor = '', flashlight = '', grip = 'COMPONENT_AT_AR_AFGRIP', scope = 'COMPONENT_AT_SCOPE_MEDIUM', yusuf = 'COMPONENT_COMBATMG_VARMOD_LOWRIDER', extendedclip = 'COMPONENT_COMBATMG_CLIP_02'},					
	{name = 'WEAPON_COMPACTLAUNCHER', 	type = 'heavy', ammo = 'ammo_40x46', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_FIREWORK', 			type = 'heavy', ammo = 'firework', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_FLAREGUN', 			type = 'heavy', ammo = 'firework', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_GRENADELAUNCHER', 	type = 'heavy', ammo = 'ammo_40x46', box = '', suppressor = '', flashlight = 'COMPONENT_AT_AR_FLSH', grip = 'COMPONENT_AT_AR_AFGRIP', scope = 'COMPONENT_AT_SCOPE_SMALL', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_HOMINGLAUNCHER', 	type = 'heavy', ammo = 'rocket', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_MG', 				type = 'heavy', ammo = 'ammo_762', box = 'box_762', suppressor = '', flashlight = '', grip = '', scope = 'COMPONENT_AT_SCOPE_SMALL_02', yusuf = 'COMPONENT_MG_VARMOD_LOWRIDER', extendedclip = 'COMPONENT_MG_CLIP_02'},
	{name = 'WEAPON_RAILGUN', 			type = 'heavy', ammo = 'rocket', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''},
	{name = 'WEAPON_RPG', 				type = 'heavy', ammo = 'rocket', box = '', suppressor = '', flashlight = '', grip = '', scope = '', yusuf = '', extendedclip = ''}
}

-- Leaked By: Leaking Hub | J. Snow | leakinghub.com