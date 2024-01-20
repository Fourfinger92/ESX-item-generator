
CreateThread(function()
	for k, v in pairs(Configusableitems.items) do
        ESX.RegisterUsableItem(k, function(source)
            local xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.removeInventoryItem(k, 1)  
            for l,i in pairs(v.Art) do      

                TriggerClientEvent('esx_status:add', source, i, v.menge)
                if i == "hunger" then                
                    TriggerClientEvent('esx_basicneeds:onEat', source, v.prop_name)                 
                elseif i == "thirst" then
                    TriggerClientEvent('esx_basicneeds:onDrink', source, v.prop_name)
                elseif i == "drunk" then
                    TriggerClientEvent('esx_optionalneeds:onDrink', source, v.prop_name)                    
                end                
            end
            xPlayer.showNotification(v.notification)
        end)	
	end
end)
