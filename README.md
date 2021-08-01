# mi-card
QBCore Trading Cards

### Demo: [https://streamable.com/oz669m](https://streamable.com/oz669m)
## Screenshots
![Opening Cards](/screenshot/Screenshot_1.png)
![Opening Cards 2](/screenshot/Screenshot_2.png)
![Use Card](/screenshot/Screenshot_3.png)
![Use PSA Card](/screenshot/Screenshot_4.png)

---

### qb-core (shared.lua)
```
-- MI CARD
["micard_legendary"]			=  {["name"] = "micard_legendary", 				["label"] = "Legendary Card", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "micard_legendary.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Wow!! You have a legendary card!!"},
["micard_rare"]					=  {["name"] = "micard_rare",					["label"] = "Rare Card", 				    ["weight"] = 0, 		["type"] = "item", 		["image"] = "micard_rare.png", 					["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Wow!! You have a rare card!!"},
["micard_basic"]				=  {["name"] = "micard_basic",					["label"] = "Basic Card", 				    ["weight"] = 0, 		["type"] = "item", 		["image"] = "micard_basic.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Phewww, just basic card"},
["micard_booster_pack1"]		=  {["name"] = "micard_booster_pack1",			["label"] = "Booster Pack", 			    ["weight"] = 0, 		["type"] = "item", 		["image"] = "micard_booster_pack1.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Contains 5 cards"},
["micard_booster_pack2"]		=  {["name"] = "micard_booster_pack2",			["label"] = "Booster Pack", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "micard_booster_pack2.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Contains 10 cards"},
["micard_psa"]					=  {["name"] = "micard_psa",					["label"] = "PSA Case",		 				["weight"] = 0, 		["type"] = "item", 		["image"] = "micard_booster_pack2.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "PSA Case"},
```

## 
### qb-inventory (server/main.lua), setInventoryData
```
elseif QBCore.Shared.SplitStr(shopType, "_")[1] == "Itemshop" then
	-- MICARD
	if itemData.name == "micard_psa" then
		local StringCharset = {}
		local NumberCharset = {}
		for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
		for i = 65,  90 do table.insert(StringCharset, string.char(i)) end
		for i = 97, 122 do table.insert(StringCharset, string.char(i)) end
		
		RandomStr = function(length)
			if length > 0 then
				return RandomStr(length-1) .. StringCharset[math.random(1, #StringCharset)]
			else
				return ''
			end
		end
		
		RandomInt = function(length)
			if length > 0 then
				return RandomInt(length-1) .. NumberCharset[math.random(1, #NumberCharset)]
			else
				return ''
			end
		end


		local psaId = tostring(RandomStr(3) .. RandomInt(2) .. RandomStr(1) .. RandomInt(2) .. RandomInt(3))
		itemData.info = {
			serial = psaId
		}
	end
	-- END MICARD
```