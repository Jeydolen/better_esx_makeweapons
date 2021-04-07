-- esx_makeweapons by Znajak forked by Jeydolen
local component_names 	= Config.component_names
local weapons 			= Config.weapons

ESX	= nil
TriggerEvent('esx:getSharedObject', function(obj)	ESX = obj	end)

function registerComponent(name)
	RegisterServerEvent('esx_makeweapons:craft'..name)
	AddEventHandler('esx_makeweapons:craft'..name, function() 
		craft(source, name, 'component') 
	end)
end

for i,v in ipairs(component_names) do registerComponent(v)	end

RegisterServerEvent('esx_makeweapons:craftweapon')
AddEventHandler('esx_makeweapons:craftweapon', function(weapon_name) 
	craft(source, weapon_name, 'weapon') 
end)

function showNotif(source, msg)	TriggerClientEvent('esx_makeweapons:shownotification', source, msg)	end

function craft(source, item, item_type) 
	local xPlayer, result_item, enough_component = ESX.GetPlayerFromId(source)
	local item = item:lower()
	showNotif(source,'Fabrication de '..item..'...')
	TriggerClientEvent('esx_makeweapons:startanim', source)
	Citizen.Wait(Config.waiting_time)
	
	if item_type == 'weapon' then
		for i,v in ipairs(component_names) do enough_component = check_enough_component(source, v..'_'..item, 1) end
			if enough_component then
				for i,v in ipairs(component_names) do xPlayer.removeInventoryItem(v..'_'..item, 1) end
			else 
				TriggerClientEvent('esx_makeweapons:stopanim', source)
				TriggerClientEvent('esx_makeweapons:craftend', source)	
				return showNotif(source,'Pas assez de matériaux') 
			end
	end
	
	if (math.random(0,100) <= Config.chance) then
		if item_type == 'component' then
			local randomNum, weapon = math.random(1, get_table_length(weapons))
			for k,v in pairs(weapons) do
				for key,luck in pairs(weapons[k]) do
					if key == 'luck' then
						if 	randomNum == luck then weapon = k break end
					end
				end
			end
			result_item = ( item..'_'..weapon )
		elseif item_type == 'weapon' then
			for k,v in pairs(weapons) do
				if 	item == k then 
					for key,val in pairs(weapons[k]) do 
						if ( key == 'weapon_hash' ) then result_item = val end 
					end 
				end
			end
		end

		if result_item ~= nil then
			showNotif(source,'Vous avez fabriqué un '..result_item)
			xPlayer.addInventoryItem( result_item, 1)
		end
	else showNotif(source,'Pendant la fabrication, ' ..item..' s\'est cassé !')	end
	TriggerClientEvent('esx_makeweapons:stopanim', source)
	TriggerClientEvent('esx_makeweapons:craftend', source)
end 

function check_enough_component(source, item, number_required)
	return ESX.GetPlayerFromId(source).getInventoryItem(item).count >= number_required
end

function get_table_length (table_arg)
	local count = 0
	for i,v in pairs(table_arg) do count = count +1 end
	return count
end