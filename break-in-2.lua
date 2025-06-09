local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Break in 2 script thing", "DarkTheme")

-- Tabs
local tabMain = Window:NewTab("Tab1/main")
local tabIngame = Window:NewTab("Ingame")
local itemSection = tabIngame:NewSection("Yay free items!!!")
local toolSection = tabIngame:NewSection("Tools")

-- Helper function for GiveTool
local function giveTool(itemName)
    game:GetService("ReplicatedStorage").Events.GiveTool:FireServer(itemName)
    print("Clicked: " .. itemName)
end

-- Helper function for RainbowWhatStat
local function giveStat(stat)
    game:GetService("ReplicatedStorage").Events.RainbowWhatStat:FireServer(stat)
    print("Clicked stat: " .. stat)
end

-- Helper function for Vending
local function vendItem(id, item, category, quantity)
    local player = game.Players.LocalPlayer
    local args = {
        [1] = id,
        [2] = item,
        [3] = category,
        [4] = player.Name,
        [5] = quantity or 1
    }
    game:GetService("ReplicatedStorage").Events.Vending:FireServer(unpack(args))
    print("Clicked: " .. item)
end

-- Food/Item Buttons
local itemList = {
    "GoldenApple", "BloxyCola", "Pizza", "Apple", "Cookie", "GoldPizza", "RainbowPizza",
    "MedKit", "Key", "GoldKey", "Louise", "Lollipop", "Chips",
    "RainbowPizzaBox", "Book", "Bottle", "Ladder", "Battery"
}

for _, item in ipairs(itemList) do
    itemSection:NewButton(item, "Give " .. item, function()
        giveTool(item)
    end)
end

-- Stat Buttons
itemSection:NewButton("+1 Speed", "Increases speed", function()
    giveStat("Speed")
end)

itemSection:NewButton("+1 Strength", "Increases strength", function()
    giveStat("Strength")
end)

-- Special Buttons
itemSection:NewButton("Armor", "Suit up with some armor.", function()
    vendItem(3, "Armor2", "Armor", 1)
end)

itemSection:NewButton("Pancake", "Make a pancake", function()
    game:GetService("ReplicatedStorage").Events.MakePancake:FireServer()
    print("Clicked: Pancake")
end)

-- Weapon Tools
toolSection:NewButton("Bat", "Get a bat", function()
    vendItem(3, "Bat", "Weapons")
end)

toolSection:NewButton("Wrench", "Get a wrench", function()
    vendItem(3, "Wrench", "Weapons")
end)

toolSection:NewButton("Pitchfork", "Get a pitchfork", function()
    vendItem(3, "Pitchfork", "Weapons", 0)
end)

toolSection:NewButton("Hammer", "Get a hammer", function()
    vendItem(3, "Hammer", "Weapons", 0)
end)

toolSection:NewButton("Broom", "Get a broom", function()
    vendItem(3, "Broom", "Weapons", 0)
end)
