Config = {}

Config.OpeningTime = 5000

Config.Locations = {
    ["seller"] = { -- Kayu
        type = 4,
        model = "u_m_y_pogo_01",
        hash = 0xDC59940D,
        location = vector4(-136.68, 229.74, 93.95, 358.07)
    },
}

Config.ShopItems = {
    [1] = {
        name = "micard_booster_pack1",
        price = 10,
        amount = 18,
        info = {},
        type = "item",
        slot = 1,
    },
    [2] = {
        name = "micard_booster_pack2",
        price = 20,
        amount = 18,
        info = {},
        type = "item",
        slot = 2,
    },
    [3] = {
        name = "micard_psa",
        price = 100,
        amount = 5,
        info = {},
        type = "item",
        slot = 3,
    },
}

Config.CardColors = {
    ["basic"] = {
        color1 = "#fff",
        color2 = "#fff",
        color3 = "#fff",
        color4 = "#fff",
        border_size = 6, -- in px
        border_color = "#999",
        -- Effect
        shining = false,
        sparkles = false,
    },
    ["rare"] = {
        color1 = "#af13ce",
        color2 = "#87a593",
        color3 = "#ffbe33",
        color4 = "#ffcf33",
        border_size = 6, -- in px
        border_color = "#999",
        -- Effect
        shining = false,
        sparkles = true,
    },
    ["legendary"] = {
        color1 = "#e09a3d",
        color2 = "#41ece4",
        color3 = "#ff9f9f",
        color4 = "#ff7676",
        border_size = 6, -- in px
        border_color = "#999",
        -- Effect
        shining = true,
        sparkles = true,
    },
}
Config.Cards = {
    [1] = {
        color = "legendary",
        rank = "legendary", -- Only basic, rare, legendary
        label = "Irsyad Fauzan",
        images = "img/avatar1.png",
        description = "Human, Height: 168, Weight: 80",
        term = "Jack Of All Trades",
        health = 200,
        attack = 99,
        icon = "",
        quality = 100,
    },
    [2] = {
        color = "basic",
        rank = "basic",
        label = "Maulidin Aziz",
        images = "img/avatar3.png",
        description = "Trash, Height: 172, Weight: 68",
        term = "Sleeping Everytime",
        health = 40,
        attack = 20,
        icon = "",
        quality = 100,
    },
    [3] = {
        color = "rare",
        rank = "rare",
        label = "Yumabok",
        images = "img/avatar5.png",
        description = "Drunken, Height: 170, Weight: 77",
        term = "Drunken Master",
        health = 60,
        attack = 20,
        icon = "",
        quality = 100,
    },
    [4] = {
        color = "legendary",
        rank = "legendary",
        label = "Yuma",
        images = "img/avatar2.png",
        description = "Trash, Height: 174, Weight: 75",
        term = "Keep Eating",
        health = 80,
        attack = 20,
        icon = "",
        quality = 100,
    },
    [5] = {
        color = "rare",
        rank = "rare",
        label = "Yudi",
        images = "img/avatar4.png",
        description = "Trash, Height: 164, Weight: 80",
        term = "Sleeping Everytime",
        health = 60,
        attack = 20,
        icon = "",
        quality = 100,
    },
}