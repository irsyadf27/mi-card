-- Use Booster Pack
QBCore.Functions.CreateUseableItem("micard_booster_pack1", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("mi-card:client:OpenBoosterPack1", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("micard_booster_pack2", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("mi-card:client:OpenBoosterPack2", source, item.name)
    end
end)

-- Use Card
QBCore.Functions.CreateUseableItem("micard_legendary", function(source, item)
	TriggerClientEvent("mi-card:client:showCard", source, item)
    -- for k, v in pairs(QBCore.Functions.GetPlayers()) do
	-- 	local character = QBCore.Functions.GetPlayer(source)
	-- 	local PlayerPed = GetPlayerPed(source)
	-- 	local TargetPed = GetPlayerPed(v)
	-- 	local dist = #(GetEntityCoords(PlayerPed) - GetEntityCoords(TargetPed))
    --     if dist < 3.0 then
    --         TriggerClientEvent("mi-card:client:showCard", v, item)
	-- 	end
	-- end
end)

QBCore.Functions.CreateUseableItem("micard_rare", function(source, item)
	TriggerClientEvent("mi-card:client:showCard", source, item)
    -- for k, v in pairs(QBCore.Functions.GetPlayers()) do
	-- 	local character = QBCore.Functions.GetPlayer(source)
	-- 	local PlayerPed = GetPlayerPed(source)
	-- 	local TargetPed = GetPlayerPed(v)
	-- 	local dist = #(GetEntityCoords(PlayerPed) - GetEntityCoords(TargetPed))
    --     if dist < 3.0 then
    --         TriggerClientEvent("mi-card:client:showCard", v, item)
	-- 	end
	-- end
end)

QBCore.Functions.CreateUseableItem("micard_basic", function(source, item)
	TriggerClientEvent("mi-card:client:showCard", source, item)
    -- for k, v in pairs(QBCore.Functions.GetPlayers()) do
	-- 	local character = QBCore.Functions.GetPlayer(source)
	-- 	local PlayerPed = GetPlayerPed(source)
	-- 	local TargetPed = GetPlayerPed(v)
	-- 	local dist = #(GetEntityCoords(PlayerPed) - GetEntityCoords(TargetPed))
    --     if dist < 3.0 then
    --         TriggerClientEvent("mi-card:client:showCard", v, item)
	-- 	end
	-- end
end)


-- Create PSA Case
QBCore.Functions.CreateUseableItem("micard_psa", function(source, item)
	local src = source
	local serial = item.info["serial"]
	local stashId = "psa_" .. serial

	QBCore.Functions.ExecuteSql(true, "SELECT * FROM `stashitemsnew` WHERE `stash` = '"..stashId.."'", function(result)
		if result[1] ~= nil then
			result[1].items = json.decode(result[1].items)
			if result[1].items[1] ~= nil then
				local card = result[1].items[1]
				card.info.withCase = true
				TriggerClientEvent("mi-card:client:showCard", source, card)
			else
				TriggerClientEvent("mi-card:client:UsePsa", source, item)
			end
		else
			TriggerClientEvent("mi-card:client:UsePsa", source, item)
		end
	end)
	
end)

-- RegisterServerEvent("inventory:server:SetInventoryData")
-- AddEventHandler('inventory:server:SetInventoryData', function(fromInventory, toInventory, fromSlot, toSlot, fromAmount, toAmount)
-- 	local src = source
-- 	local Player = QBCore.Functions.GetPlayer(src)
-- 	local fromSlot = tonumber(fromSlot)
-- 	local toSlot = tonumber(toSlot)

-- 	if QBCore.Shared.SplitStr(fromInventory, "-")[1] == "itemshop" then
-- 		local shopType = QBCore.Shared.SplitStr(fromInventory, "-")[2]
-- 		local itemData = Config.ShopItems[fromSlot]
-- 		local itemInfo = QBCore.Shared.Items[itemData.name:lower()]
-- 		local bankBalance = Player.PlayerData.money["bank"]
-- 		local price = tonumber((itemData.price*fromAmount))

-- 		if itemData.name == "micard_psa" then
				
-- 			local psaId = tostring(RandomStr(3) .. RandomInt(2) .. RandomStr(1) .. RandomInt(2) .. RandomInt(3))
-- 			itemData.info = {
-- 				serial = psaId
-- 			}

-- 			if QBCore.Shared.SplitStr(shopType, "_")[1] == "Itemshop" then
-- 				if Player.Functions.RemoveMoney("cash", price, "itemshop-bought-item") then
-- 					Player.Functions.AddItem(itemData.name, fromAmount, toSlot, itemData.info)
-- 					TriggerClientEvent('qb-shops:client:UpdateShop', src, QBCore.Shared.SplitStr(shopType, "_")[2], itemData, fromAmount)
-- 					TriggerClientEvent('QBCore:Notify', src, itemInfo["label"] .. " bought!", "success")
-- 					TriggerEvent("qb-log:server:CreateLog", "shops", "Shop item bought", "green", "**"..GetPlayerName(src) .. "** bought a " .. itemInfo["label"] .. " for $"..price)
-- 				elseif bankBalance >= price then
-- 					Player.Functions.RemoveMoney("bank", price, "itemshop-bought-item")
-- 					Player.Functions.AddItem(itemData.name, fromAmount, toSlot, itemData.info)
-- 					TriggerClientEvent('qb-shops:client:UpdateShop', src, QBCore.Shared.SplitStr(shopType, "_")[2], itemData, fromAmount)
-- 					TriggerClientEvent('QBCore:Notify', src, itemInfo["label"] .. " bought!", "success")
-- 					TriggerEvent("qb-log:server:CreateLog", "shops", "Shop item bought", "green", "**"..GetPlayerName(src) .. "** bought a " .. itemInfo["label"] .. " for $"..price)
-- 				else
-- 					TriggerClientEvent('QBCore:Notify', src, "You don't have enough cash..", "error")
-- 				end
-- 			end
-- 		end
-- 	end
-- end)