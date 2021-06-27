-- esx_makeweapons by Znajak forked by Jeydolen
ESX = nil
Citizen.CreateThread(function() while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Citizen.Wait(0) end end)

local craft = false

function menu_makeweapons(menu_name)
	local elements = {}
	for k,v in pairs(Config.weapons) do table.insert(elements, {label = _U('assemble')..k, weapon = k}) end

	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default',GetCurrentResourceName(),'weaponcraft_menu',{title= menu_name,align= 'top-left',elements= elements},function(data, menu)
		if not craft then craft = true TriggerServerEvent('esx_makeweapons:craft', data.current.weapon, 'weapon')
		else ESX.ShowNotification(_U('already_crafting')) end
		ESX.UI.Menu.CloseAll()
	end, function(data, menu) menu.close() end)
end

Citizen.CreateThread(function()
    while true do
        Wait(100)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        for k,v in pairs(Config.Zones) do
			if(v.Type ~= -1) then
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 50) then
					DrawMarker(v.Type,v.Pos.x,v.Pos.y,v.Pos.z,0.0,0.0,0.0,0,0.0,0.0,v.Size.x,v.Size.y,v.Size.z,v.Color.r,v.Color.g,v.Color.b,100,false,true,2,false,false,false,false)
				end
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 2) then 
					ESX.ShowHelpNotification(v.Text) 
					if IsControlJustReleased(0, 38) then
						if v.action == "weapon" then menu_makeweapons(v.Name)
						else if not craft then craft = true TriggerServerEvent('esx_makeweapons:craft',v.action, 'component') else ESX.ShowNotification(_U('already_crafting')) end end
					end
				end
			end
        end
    end
end)

RegisterNetEvent('esx_makeweapons:startanim')
AddEventHandler('esx_makeweapons:startanim', function() TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_PARKING_METER", 0, false) end)

RegisterNetEvent('esx_makeweapons:craftend')
AddEventHandler('esx_makeweapons:craftend',  function() ClearPedTasksImmediately(GetPlayerPed(-1)) craft = false end)