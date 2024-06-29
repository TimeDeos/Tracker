local HttpService = game:GetService("HttpService")

-- Edit this part
local config = '{"Hide Key":"U","Macros Selected":{"Challenge":[],"Infinite":[],"Raid":[],"Story":[],"Tower":{"Map1":"","Map2":"","Map5":"","Map3":"","Map4":""}},"TP Lobby":false,"Auto Claim Quests":true,"Auto Reroll":false,"Auto Raid (Lobby)":false,"Enable Auto Join Player":false,"Webhook":{"ID":0,"Ping":false,"Result":false,"URL":""},"Ping On Secret Drop":false,"TP Lobby when RAID OPEN":false,"Auto Buy Raid":false,"Auto Summon":false,"Auto Leave Wave":false,"Enable Auto Delete Rarity":false,"Auto Leave when No Enemy Spawn":true,"Summon Unit":"","Auto Raid":false,"Ignore Shiny Auto Sell Rarity":true,"Auto Start Time Delay":0,"Auto Lobby TP on Time":false,"Summon Select":"1","Black Screen":false,"Selected Macro":"curse","Join Priority":{"1":"Auto Join Player","3":"Auto Raid","2":"Auto Tower","5":"Auto Story","4":"Auto Challenge","6":"Auto Join Map"},"Auto Tower":false,"Selected Raids":[],"Record Options":"Money","modeSelect":"Story","Auto Execute":true,"AutoStart":true,"Hide Additional Frame":false,"Summon Gems":0,"Auto Start Delay":0,"Auto Next":true,"Auto Joiner Player":false,"Selected Traits Reroll":[],"Auto Story":true,"Step Delay":3,"Ping On Selected Item":false,"Auto Trait Reroll":false,"Auto Sell Wave":1,"Auto TP Raid Open":false,"Auto Leave":false,"IgnoreChallengeRewards":[],"Enable Sell Rarity":false,"Ignore Shiny Sell Rarity":false,"Macro Mode Select":"Story","Enable Auto Sell Rarity":false,"Auto Sell Farms":false,"Auto Join Map":true,"Delete Map":true,"Export File":"","Auto Story Mode":"Automatic","TP Delay":8,"Auto Skip Wave":true,"AutoChallenge":false,"mapSelect":"FooshaVillage","Auto Joiner Player Select":"","FirstTime":true,"difficultySelect":"Normal","Selected Story":"FooshaVillage_Chapter6","IgnoreChallenge":[],"Auto Sell Rarity":[],"Ping User":false,"Summon Mode":"All Gems","Enable Delete Rarity":false,"Raid Buy List":[],"Raid2 Buy List":[],"TP Lobby Time":10,"Auto Start":false,"friendSelect":true,"Auto Buy Raid2":false,"actSelect":"2","Auto Leave on Wave":false,"Auto Sell Units":false,"Summon Banner":"Standard","IgnoreChallengeMap":[],"Auto Delete Rarity":[],"PingSelected":false,"AutoLeaveOnWave":31,"Auto Hide UI on Execute":true,"Import Mode":"Link","Auto Try Reconnect":true,"Large Window":false,"Enable Auto Story":false,"Auto Hide Name":false,"Enable Auto Challenge":false,"FPS Boost":true,"AutoSellFarmsWave":1,"WebhookPingSelected":[],"Result Webhook":false,"Play Macro":true,"Record Macro":false,"blackScreen":false,"Friends Only":false,"Auto Start Game/Skip":false,"AutoJoinMap":false,"Auto Replay":false}'
local macroToImport = ""
local macroName = "curse"
-- ( macroToImport should be a GitHub or Discord link. )
-- Leave macroToImport blank if don't need to import


local function rejoin()
    wait(3)
    -- game:GetService("Players").LocalPlayer.PlayerGui.PAGES.UpdatesUI:Destroy()
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")

    ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(1, 0, 1, 0)

    TextLabel.Parent = Frame
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0.5, -100, 0.5, -50)
    TextLabel.Size = UDim2.new(0, 200, 0, 100)
    TextLabel.Font = Enum.Font.SourceSans
    -- TextLabel.Text = "Rejoining to apply changes."
    TextLabel.Text = "Applied config changes."
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextScaled = true
    -- game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
end

local realMacroName = "Buang/AD/Macros/" .. macroName .. ".json"
-- don't touch this one, only change macroName
local function grabMacro(url)
    local response = request({
        Url = url,
        Method = "GET",
    })
    
    if response.Success then
        writefile(realMacroName, response.Body)
        print("Successfully imported the macro as", macroName .. ".json")
    else
        warn("Failed to fetch macro: " .. response.StatusMessage)
    end
end

if macroToImport == "" then
    print("No macro to import, moving onto config")
else
    grabMacro(macroToImport)
end

local configName = "Buang/AD/Settings_" .. game.Players.LocalPlayer.Name .. ".json"
if isfile(configName) then
    local fileContent = readfile(configName)
    local existingData = HttpService:JSONDecode(fileContent)
    print("========== Current Config ==========")
    print(existingData)
    print("========== New Config ==========")
    writefile(configName, config)
    print(config)
    rejoin()
else
    warn("There's no config file.. something's wrong dawg")
end

