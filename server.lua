-- esx_makeweapons by Znajak forked by Jeydolen
local component_names 	= Config.component_names
local weapons 			= Config.weapons

ESX	= nil
TriggerEvent('esx:getSharedObject', function(obj)	ESX = obj	end)

RegisterServerEvent('esx_makeweapons:craft')
AddEventHandler('esx_makeweapons:craft', function(name, item_type) craft(source, name, item_type)  end)

function craft(source, item, item_type) 
	local xPlayer, result_item, enough_component, i,t,n = ESX.GetPlayerFromId(source)
	xPlayer.showNotification('Fabrication de '..item..'...')
	xPlayer.TriggerEvent('esx_makeweapons:startanim')
	Wait(Config.waiting_time)
	
	if item_type == 'weapon' then 	i = weapons[item].weapon_type 	t = component_names
	else 							i = item 						t = Config.components end
	
	local enough_component = CheckEnoughComponent(i,t,item_type)
	if enough_component then
		if item_type == 'weapon' for _,v in ipairs(t)   do xPlayer.removeInventoryItem(weapons[item].weapon_type'_'..v, 1) end
		else 					 for k,v in pairs(t[item]) do xPlayer.removeInventoryItem(k,v) end end
	else
		xPlayer.TriggerEvent('esx_makeweapons:craftend')	
		return xPlayer.showNotification('Pas assez de matériaux') 
	end
	
	if (math.random(0,100) <= Config.chance) then
		if item_type == 'component' then
			local randomNum, weapon_type = math.random(1, #weapons)
			for _,v in ipairs(weapons) do if randomNum == _ then weapon_type = weapons[_].weapon_type break end end
			result_item = (item..'_'..weapon_type)
		else result_item = weapons[k].weapon_hash end

		if result_item ~= nil then
			xPlayer.showNotification('Vous avez fabriqué un '..result_item)
			if item_type == 'weapon' then xPlayer.addWeapon(result_item, 256)
			else xPlayer.addInventoryItem(result_item, 1) end
		end
	else xPlayer.showNotification('Pendant la fabrication, ' ..item..' s\'est cassé !')	end
	xPlayer.TriggerEvent('esx_makeweapons:craftend')
end 

function CheckEnoughComponent(a, t, it)
	local check = true
	local xPlayer = ESX.GetPlayerFromId(source)
	if it == 'weapon' then 	for _,v in ipairs(t) 	do if not xPlayer.getInventoryItem(a..'_'..v).count <= req 	then check = false end end
	else 					for k,v in pairs(t[a]) 	do if not xPlayer.getInventoryItem(k).count <= v 			then check = false end end end
	return check
end