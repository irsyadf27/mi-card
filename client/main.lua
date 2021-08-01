local randomCards = {}

RegisterNUICallback('escape', function(data, cb)
    SetNuiFocus(false, false)
    EnableGUI("ON_CLOSE", false, "cards")
    cb('ok')
end)


RegisterNUICallback('openInventory', function(data, cb)
    SetNuiFocus(false, false)
    EnableGUI("ON_CLOSE", false, "cards")
    TriggerServerEvent("inventory:server:OpenInventory")
    cb('ok')
end)


RegisterNUICallback('openAnother', function(data, cb)
    --SetNuiFocus(false, false)
    --EnableGUI("ON_CLOSE", false, "cards")
    TriggerEvent("mi-card:client:randomCards", data.remain)
    cb('ok')
end)


function EnableGUI(type, enable, menu)
    enabled = enable
    SetNuiFocus(enable, enable)
    SendNUIMessage({
        type = type,
        enable = enable,
        menu = menu,
        cards = randomCards,
        isService = isService,
    })
end


function generateRandomCards(n)
    randomCards = {}
    for i=1, n do
        randomCards[i] = Config.Cards[math.random(#Config.Cards)]
        color = Config.CardColors[randomCards[i].color]
        randomCards[i].colors = color
        randomCards[i].isFliped = false
    end
end

-- Create NPC Seller
Citizen.CreateThread(function()
    seller = Config.Locations["seller"]
    pos = seller.location
    RequestModel(GetHashKey(seller.model))
    while not HasModelLoaded(GetHashKey(seller.model)) do
      Wait(1)
    end

    RequestAnimDict("mini@strip_club@idles@bouncer@base")
    while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
      Wait(1)
    end
    ped =  CreatePed(4, seller.hash, seller.location.x, seller.location.y, seller.location.z, seller.location.w, false, true)
    --SetEntityHeading(ped, seller.location.w)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
end)

-- Open Shop
RegisterNetEvent('mi-card:client:OpenShop')
AddEventHandler('mi-card:client:OpenShop', function()
    local ShopItems = {}
    ShopItems.label = "Mi Cards"
    ShopItems.items = Config.ShopItems
    ShopItems.slots = 5
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Itemshop_micard", ShopItems)
end)



RegisterNetEvent("mi-card:client:randomCards")
AddEventHandler("mi-card:client:randomCards", function(n)
    local max = 5

    if n > 5 then
        generateRandomCards(5) -- Isi 5
        SendNUIMessage({
            type = "ON_ADD_CARDS",
            cards = randomCards,
            remain = n - 5
        })
    else
        generateRandomCards(n) -- Isi 5
        SendNUIMessage({
            type = "ON_ADD_CARDS",
            cards = randomCards,
            remain = 0
        })
    end


    for k, card in pairs(randomCards) do
        if card.rank == "legendary" then
            TriggerServerEvent('QBCore:Server:AddItem', "micard_legendary", 1, nil, card)
        elseif card.rank == "rare" then
            TriggerServerEvent('QBCore:Server:AddItem', "micard_rare", 1, nil, card)
        else
            TriggerServerEvent('QBCore:Server:AddItem', "micard_basic", 1, nil, card)
        end
    end
end)


RegisterNetEvent("mi-card:client:showCard")
AddEventHandler("mi-card:client:showCard", function(item)
    -- card.isFliped = true
    -- card.colors = Config.CardColors[card.color]
    local card = item.info
    
    card.isFliped = true
    SetNuiFocus(true, true)
    EnableGUI("ON_OPEN", true, "cards-container")
    SendNUIMessage({
        type = "ON_SHOW_CARD",
        card = card,
    })
end)


-- Open Booster Pack
RegisterNetEvent("mi-card:client:OpenBoosterPack1")
AddEventHandler("mi-card:client:OpenBoosterPack1", function(itemName)
    QBCore.Functions.Progressbar("buka_kartu", "Opening Card..", Config.OpeningTime, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        SetNuiFocus(true, true)
        EnableGUI("ON_OPEN", true, "cards-container")
        
        TriggerEvent("mi-card:client:randomCards", 5)
    end)
end)


RegisterNetEvent("mi-card:client:OpenBoosterPack2")
AddEventHandler("mi-card:client:OpenBoosterPack2", function(itemName)
    QBCore.Functions.Progressbar("buka_kartu", "Opening Card..", Config.OpeningTime, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        SetNuiFocus(true, true)
        EnableGUI("ON_OPEN", true, "cards-container")
        
        TriggerEvent("mi-card:client:randomCards", 10)
    end)
end)


-- Use PSA
RegisterNetEvent("mi-card:client:UsePsa")
AddEventHandler("mi-card:client:UsePsa", function(item)
    local serial = item.info["serial"]

    local info = {
        maxweight = 100,
        slots = 1,
    }
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "psa_" .. serial, info)
    TriggerEvent("inventory:client:SetCurrentStash", "psa_" .. serial)
    QBCore.Functions.Notify("PSA Card has been opened successfully", "success")
end)

-- Debug Commands


RegisterCommand("testcard", function(source, args, rawCommand)
    SetNuiFocus(true, true)
    EnableGUI("ON_OPEN", true, "cards-container")
    local card = Config.Cards[tonumber(args[1])]
    local colors = Config.CardColors[card.rank]
    local withCase = false

    if args[2] ~= nil then
        withCase = true
    end

    local item = {
        info = {
            rank = card.rank,
            label = card.label,
            images = card.images,
            description = card.description,
            term = card.term,
            health = card.health,
            attack = card.attack,
            icon = card.icon,
            isFliped = false,
            withCase = withCase,
            colors = colors
        }
    }
    TriggerEvent("mi-card:client:showCard", item)
end, false) 