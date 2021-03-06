
CreateThread(function()
	local handsup = false
	while true do
		Wait(1)
		local playerPed = PlayerPedId()
		if IsControlJustReleased(0, 246) then
			RequestAnimDict('missminuteman_1ig_2')
			while not HasAnimDictLoaded('missminuteman_1ig_2') do
				Wait(100)
			end
			if handsup then
				handsup = false
				ClearPedSecondaryTask(playerPed)
			else
				handsup = true
				TaskPlayAnim(playerPed, "missminuteman_1ig_2", "handsup_base", 2.0, 2.5, -1, 49, 0, 0, 0, 0 )
			end

			TriggerEvent("debug", 'Handsup: ' .. (handsup and 'Enabled' or 'Disabled'), (handsup and 'success' or 'error'))
		end
	end
end)

local weaponblacklist = {
	--[[Vehicle Weapon Blacklist
	"VEHICLE_WEAPON_ROTORS",
	"VEHICLE_WEAPON_TANK",
	"VEHICLE_WEAPON_SPACE_ROCKET",
	"VEHICLE_WEAPON_PLANE_ROCKET",
	"VEHICLE_WEAPON_PLAYER_LAZER",
	"VEHICLE_WEAPON_PLAYER_LASER",
	"VEHICLE_WEAPON_PLAYER_BULLET",
	"VEHICLE_WEAPON_PLAYER_BUZZARD",
	"VEHICLE_WEAPON_PLAYER_HUNTER",
	"VEHICLE_WEAPON_ENEMY_LASER",
	"VEHICLE_WEAPON_SEARCHLIGHT",
	"VEHICLE_WEAPON_RADAR",
	"VEHICLE_WEAPON_TURRET_INSURGENT",
	"VEHICLE_WEAPON_TURRET_TECHNICAL",
	"VEHICLE_WEAPON_NOSE_TURRET_VALKYRIE",
	"VEHICLE_WEAPON_PLAYER_SAVAGE",
	"VEHICLE_WEAPON_TURRET_LIMO",
	"VEHICLE_WEAPON_CANNON_BLAZER",
	"VEHICLE_WEAPON_TURRET_BOXVILLE",
	"VEHICLE_WEAPON_RUINER_BULLET",
	"PICKUP_HANDCUFF_KEY",
	"PICKUP_CUSTOM_SCRIPT",
	"PICKUP_CAMERA",
	"PICKUP_PORTABLE_PACKAGE",
	"PICKUP_PORTABLE_CRATE_UNFIXED",
	"PICKUP_PORTABLE_CRATE_UNFIXED_INCAR",
	"PICKUP_MONEY_CASE",
	"PICKUP_MONEY_WALLET",
	"PICKUP_MONEY_PURSE",
	"PICKUP_MONEY_DEP_BAG",
	"PICKUP_MONEY_MED_BAG",
	"PICKUP_MONEY_PAPER_BAG",
	"PICKUP_MONEY_SECURITY_CASE",
	"PICKUP_VEHICLE_WEAPON_COMBATPISTOL",
	"PICKUP_VEHICLE_WEAPON_APPISTOL",
	"PICKUP_VEHICLE_WEAPON_PISTOL",
	"PICKUP_VEHICLE_WEAPON_GRENADE",
	"PICKUP_VEHICLE_WEAPON_MOLOTOV",
	"PICKUP_VEHICLE_WEAPON_SMOKEGRENADE",
	"PICKUP_VEHICLE_HEALTH_STANDARD",
	"PICKUP_VEHICLE_ARMOUR_STANDARD",
	"PICKUP_VEHICLE_WEAPON_MICROSMG",
	"PICKUP_VEHICLE_WEAPON_SMG",
	"PICKUP_VEHICLE_WEAPON_SAWNOFF",
	"PICKUP_VEHICLE_CUSTOM_SCRIPT",
	"PICKUP_VEHICLE_MONEY_VARIABLE",
	-- Weapon Ammo Blacklist
	"PICKUP_SUBMARINE",
	"PICKUP_HEALTH_SNACK",
	"PICKUP_PARACHUTE",
	"PICKUP_AMMO_PISTOL",
	"PICKUP_AMMO_PISTOL_MK2",
	"PICKUP_AMMO_COMBATPISTOL",
	"PICKUP_AMMO_APPISTOL",
	"PICKUP_AMMO_STUNGUN",
	"PICKUP_AMMO_PISTOL50",
	"PICKUP_AMMO_SNSPISTOL",
	"PICKUP_AMMO_SNSPISTOL_MK2",
	"PICKUP_AMMO_HEAVYPISTOL",	
	"PICKUP_AMMO_VINTAGEPISTOL",	
	"PICKUP_AMMO_FLAREGUN",	
	"PICKUP_AMMO_MARKSMANPISTOL",	
	"PICKUP_AMMO_REVOLVER",	
	"PICKUP_AMMO_REVOLVER_MK2",	
	"PICKUP_AMMO_DOUBLEACTION",	
	"PICKUP_AMMO_RAYPISTOL",	
	"PICKUP_AMMO_CERAMICPISTOL",
	"PICKUP_AMMO_NAVYREVOLVER",
	"PICKUP_AMMO_MICROSMG",
	"PICKUP_AMMO_SMG",
	"PICKUP_AMMO_SMG_MK2",
	"PICKUP_AMMO_ASSAULTSMG",
	"PICKUP_AMMO_COMBATPDW",	
	"PICKUP_AMMO_MACHINEPISTOL",
	"PICKUP_AMMO_MINISMG",
	"PICKUP_AMMO_RAYCARBINE",
	"PICKUP_AMMO_PUMPSHOTGUN",
	"PICKUP_AMMO_PUMPSHOTGUN_MK2",
	"PICKUP_AMMO_SAWNOFFSHOTGUN",
	"PICKUP_AMMO_ASSAULTSHOTGUN",
	"PICKUP_AMMO_BULLPUPSHOTGUN",
	"PICKUP_AMMO_MUSKET",
	"PICKUP_AMMO_HEAVYSHOTGUN",
	"PICKUP_AMMO_DBSHOTGUN",
	"PICKUP_AMMO_AUTOSHOTGUN",
	"PICKUP_AMMO_ASSAULTRIFLE",
	"PICKUP_AMMO_ASSAULTRIFLE_MK2",
	"PICKUP_AMMO_CARBINERIFLE",
	"PICKUP_AMMO_CARBINERIFLE_MK2",	
	"PICKUP_AMMO_ADVANCEDRIFLE",
	"PICKUP_AMMO_SPECIALCARBINE",
	"PICKUP_AMMO_SPECIALCARBINE_MK2",
	"PICKUP_AMMO_BULLPUPRIFLE",
	"PICKUP_AMMO_BULLPUPRIFLE_MK2",
	"PICKUP_AMMO_COMPACTRIFLE",
	"PICKUP_AMMO_MG",			
	"PICKUP_AMMO_COMBATMG",	
	"PICKUP_AMMO_COMBATMG_MK2",	
	"PICKUP_AMMO_GUSENBERG",	
	"PICKUP_AMMO_SNIPERRIFLE",	
	"PICKUP_AMMO_HEAVYSNIPER",	
	"PICKUP_AMMO_HEAVYSNIPER_MK2",	
	"PICKUP_AMMO_MARKSMANRIFLE",	
	"PICKUP_AMMO_MARKSMANRIFLE_MK2",	
	"PICKUP_AMMO_RPG",	
	"PICKUP_AMMO_GRENADELAUNCHER",	
	"PICKUP_AMMO_GRENADELAUNCHER_SMOKE",	
	"PICKUP_AMMO_MINIGUN",	
	"PICKUP_AMMO_FIREWORK",	
	"PICKUP_AMMO_RAILGUN",	
	"PICKUP_AMMO_HOMINGLAUNCHER",	
	"PICKUP_AMMO_COMPACTLAUNCHER",	
	"PICKUP_AMMO_RAYMINIGUN",	
	"PICKUP_AMMO_GRENADE",				
	"PICKUP_AMMO_BZGAS",
	"PICKUP_AMMO_MOLOTOV",
	"PICKUP_AMMO_STICKYBOMB",
	"PICKUP_AMMO_PROXMINE",
	"PICKUP_AMMO_PIPEBOMB",
	"PICKUP_AMMO_SMOKEGRANDE",
	"PICKUP_AMMO_FLARE"
	-- Weapons Blacklist
	"WEAPON_MARKSMANPISTOL",
	"WEAPON_REVOLVER_MK2",
	"WEAPON_RAYPISTOL",
	"WEAPON_CERAMICPISTOL",
	"WEAPON_NAVYREVOLVER",
	"WEAPON_ASSAULTSMG",
	"WEAPON_RAYCARBINE",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_HEAVYSHOTGUN",
	"WEAPON_AUTOSHOTGUN",
	"WEAPON_ADVANCEDRIFLE",
	"WEAPON_SNIPERRIFLE",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_HEAVYSNIPER_MK2",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_MARKSMANRIFLE_MK2",
	"WEAPON_RPG",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_GRENADELAUNCHER_SMOKE",
	"WEAPON_STICKYBOMB",
	"WEAPON_MINIGUN",
	"WEAPON_FIREWORK",
	"WEAPON_RAILGUN",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_COMPACTLAUNCHER",
	"WEAPON_RAYMINIGUN",
	"WEAPON_GRENADE",
	"WEAPON_BZGAS",
	"WEAPON_PROXMINE",
	"WEAPON_PIPEBOMB",
	"WEAPON_HAZARDCAN"]]--
}

local carblacklist = {
	"annihilator",
	"buzzard",
	"savage",
	"skylift",
	"seasparrow",
	"valkrie",
	"valkrie2",
	"volatus",
	"apc",				
	--"barracks",
	--"barracks2",
	--"barracks3",
	--"crusader",
	"halftrack",
	"rhino",
	"trailersmall2",
	"opressor",
	"besra",
	"cargoplane",
	"hydra",
	"jet",
	"lazer",
	"titan",
	"nokota",
	"avenger"
}

CreateThread(function()
	while true do
		Wait(1000)
		local playerPed = PlayerPedId()
		local success, weaponhash = GetCurrentPedWeapon(playerPed, true)
		for a, b in next, weaponblacklist do
			if GetHashKey(b) == weaponhash then
				RemoveWeaponFromPed(playerPed, weaponhash)
				sendForbiddenMessage("This weapon is forbidden!")
				break
			end
		end
		if IsPedInAnyVehicle(playerPed) then
			local veh = GetVehiclePedIsUsing(playerPed)
			for a, b in next, carblacklist do
				if GetEntityModel(veh) == GetHashKey(b) then
					DeleteEntity(veh)
					sendForbiddenMessage("This vehicle is forbidden!")
					break
				end
			end
		end
	end
end)

function sendForbiddenMessage(message)
	TriggerEvent("chatMessage", "", {0, 0, 0}, "^1" .. message)
end