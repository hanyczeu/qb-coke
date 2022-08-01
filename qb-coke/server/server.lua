local QBCore = exports['qb-core']:GetCoreObject()

local itemcraft = 'markedbills'

RegisterServerEvent('qb-cokepicking:pickedUpCocaLeafs', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	    if 	TriggerClientEvent("QBCore:Notify", src, "Picked up some Coca Leafs!!", "Success", 1000) then
		  Player.Functions.AddItem('cocaine_leaf', 1) ---- change this shit 
		  TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cocaine_leaf'], "add")
	    end
end)

RegisterServerEvent('qb-cokepicking:processcoke', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cocaine_leaf = Player.Functions.GetItemByName("cocaine_leaf")
      local plastic_baggie = Player.Functions.GetItemByName("plastic_baggie")

    if cocaine_leaf ~= nil and plastic_baggie ~= nil then
        if Player.Functions.RemoveItem('cocaine_leaf', 3) and Player.Functions.RemoveItem('plastic_baggie', 1) then
            Player.Functions.AddItem('cocaine_bag', 1)-----change this
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cocaine_leaf'], "remove")
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['plastic_baggie'], "remove")
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cocaine_bag'], "add")
            TriggerClientEvent('QBCore:Notify', src, 'Coca Leafs Processed successfully', "success")  
        else
            TriggerClientEvent('QBCore:Notify', src, 'You don\'t have the right items', "error") 
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'You don\'t have the right items', "error") 
    end
end)

--selldrug ok

RegisterServerEvent('qb-cokepicking:selld', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local Item = Player.Functions.GetItemByName('cocaine_bag')
   
	if Item ~= nil and Item.amount >= 1 then
		local chance2 = math.random(1, 12)
		if chance2 == 1 or chance2 == 2 or chance2 == 9 or chance2 == 4 or chance2 == 10 or chance2 == 6 or chance2 == 7 or chance2 == 8 then
			Player.Functions.RemoveItem('cocaine_bag', 1)----change this
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cocaine_bag'], "remove")
			Player.Functions.AddMoney("cash", Config.Pricesell, "sold-pawn-items")
			TriggerClientEvent('QBCore:Notify', src, 'you sold to the pusher', "success")  
		else
			Player.Functions.RemoveItem('cocaine_bag', 1)----change this
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cocaine_bag'], "remove")
			Player.Functions.AddMoney("cash", Config.Pricesell-100, "sold-pawn-items")
			TriggerClientEvent('QBCore:Notify', src, 'you sold to the pusher', "success")
		end
else
	TriggerClientEvent('QBCore:Notify', src, 'You don\'t have the right items', "error") 
	
end
end)

function CancelProcessing(playerId)
	if playersProcessingCocaine_leaf[playerId] then
		ClearTimeout(playersProcessingCocaine_leaf[playerId])
		playersProcessingCocaine_leaf[playerId] = nil
	end
end

RegisterServerEvent('qb-cokepicking:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('QBCore_:playerDropped', function(playerId, reason)
	CancelProcessing(playerId)
end)

RegisterServerEvent('qb-cokepicking:onPlayerDeath', function(data)
	local src = source
	CancelProcessing(src)
end)

QBCore.Functions.CreateCallback('poppy:process', function(source, cb)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	 
	if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
		for k, v in pairs(Player.PlayerData.items) do
		    if Player.Playerdata.items[k] ~= nil then
				if Player.Playerdata.items[k].name == "cocaine_leaf" then
					cb(true)
			    else
					TriggerClientEvent("QBCore:Notify", src, "You do not have any Coca Leafs", "error", 10000)
					cb(false)
				end
	        end
		end	
	end
end)
