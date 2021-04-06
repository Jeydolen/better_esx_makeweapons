-- esx_makeweapons by Znajak forked by Jeydolen
local component_names = {"barrel","lock","spring"}
local weapons = { 
	ak47 	= {weapon_hash = 'weapon_assaultrifle', luck = 25 }, 
	sns 	= {weapon_hash = 'weapon_snspistol', 	luck = 50 },
	smg 	= {weapon_hash = 'weapon_smg', 			luck = 75 },
	sniper 	= {weapon_hash = 'weapon_heavysniper', 	luck = 100},
}

ESX	= nil
TriggerEvent('esx:getSharedObject', function(obj)	ESX = obj	end)

function registerComponent(name)
	RegisterServerEvent('esx_makeweapons:craft'..name)
	AddEventHandler('esx_makeweapons:craft'..name, function() craft_component(source, name) end)
end

for i,v in ipairs(component_names) do registerComponent(v)	end

RegisterServerEvent('esx_makeweapons:craftweapon')
AddEventHandler('esx_makeweapons:craftweapon', function(weapon_name) craft_weapon(source, weapon_name) end)

function showNotif(source, msg)	
	TriggerClientEvent('esx_makeweapons:shownotification', source, msg)	
end

function craft_component (_source, component)
	local xPlayer = ESX.GetPlayerFromId(_source)
	local randomNumber = math.random(0,100)
	local randomNumber_weapon = math.random(0,100)
	local weapon = 'null'
	showNotif(_source,'Création du '..component)
	TriggerClientEvent('esx_makeweapons:startanim', _source)
	Citizen.Wait(5000)

	if randomNumber <= Config.chance then
		if randomNumber_weapon <= 25 then									weapon = 'ak47'
		elseif randomNumber_weapon > 25 and randomNumber_weapon <= 50 then	weapon = 'sns'		
		elseif randomNumber_weapon > 50 and randomNumber_weapon <= 75 then	weapon = 'smg'
		elseif randomNumber_weapon > 75 then								weapon = 'sniper'	end
		showNotif(_source,'Vous avez fabriqué un '..component..' ('..weapon..')')
		xPlayer.addInventoryItem(component..'_'..weapon, 1)
	else showNotif(_source,'Pendant la fabrication, ' ..component..' s\'est cassé !')			end
	TriggerClientEvent('esx_makeweapons:stopanim', _source)
	TriggerClientEvent('esx_makeweapons:craftend', _source)
end

function craft_weapon (_source, weapon_name)
	local xPlayer = ESX.GetPlayerFromId(_source)
	local randomNumber = math.random(0,100)
	local weapon = weapon_name:lower()
	local weapon_hash = 'null'

	if 	xPlayer.getInventoryItem('spring_' .. weapon ).count >= 1 and xPlayer.getInventoryItem('lock_' .. weapon).count >= 1 and xPlayer.getInventoryItem('barrel_' .. weapon).count >= 1 then
		for i,v in ipairs(component_names) do xPlayer.removeInventoryItem(v ..'_' .. weapon)	end
		showNotif(_source, 'Fabrication de '..weapon..'..')
		TriggerClientEvent('esx_makeweapons:startanim', _source)
		Citizen.Wait(5000)
		if randomNumber <= Config.chance then
			if 		weapon == 'ak47' 	then 	weapon_hash = 'weapon_assaultrifle'
			elseif 	weapon == 'sns'  	then 	weapon_hash = 'weapon_snspistol'
			elseif 	weapon == 'smg'  	then 	weapon_hash = 'weapon_smg'
			elseif 	weapon == 'sniper'	then 	weapon_hash = 'weapon_heavysniper'
			end

			xPlayer.addInventoryItem( weapon_hash, 1)
			showNotif(_source, 'Vous avez reçu une ' .. weapon)
		else
			showNotif(_source, 'Un coup de ressort droit dans la gueule!')
			TriggerClientEvent('esx_makeweapons:givedamage', _source)
		end
		TriggerClientEvent('esx_makeweapons:stopanim', _source)
		TriggerClientEvent('esx_makeweapons:craftend', _source)
	else
		showNotif(_source, 'Vous n\'avez pas le matériel requis!')
		TriggerClientEvent('esx_makeweapons:craftend', _source)
	end
end