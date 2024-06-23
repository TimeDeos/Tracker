local HttpService = game:GetService("HttpService")

-- Edit this part
local config = '{"actSelect":"6","Macros Selected":{"Raid":[],"Story":[],"Infinite":[],"Challenge":[]},"blackScreen":false,"Auto Claim Quests":true,"Auto Hide Name":false,"Auto Raid (Lobby)":false,"Enable Auto Join Player":false,"Webhook":{"ID":0,"Ping":false,"Result":false,"URL":""},"Ping On Secret Drop":false,"TP Lobby when RAID OPEN":false,"Auto TP Raid Open":false,"Auto Summon":false,"Auto Leave Wave":true,"Summon Gems":0,"Record Options":"Money","Summon Unit":"","Auto Raid":false,"Export File":"","Auto Start Time Delay":0,"Auto Lobby TP on Time":false,"Summon Select":"1","Black Screen":false,"Selected Macro":"b","Auto Tower":false,"Play Macro":true,"friendSelect":true,"Auto Start Game/Skip":false,"Auto Start Delay":0,"Auto Joiner Player":false,"IgnoreChallengeMap":[],"Auto Story":false,"Step Delay":3,"Ping On Selected Item":false,"Auto Leave":true,"IgnoreChallengeRewards":[],"Macro Mode Select":"Story","Auto Join Map":false,"Delete Map":true,"Auto Buy Raid":false,"Auto Story Mode":"Automatic","TP Delay":3,"Selected Raids":[],"AutoChallenge":false,"mapSelect":"FooshaVillage","AutoLeaveOnWave":31,"modeSelect":"Infinite","Auto Replay":true,"Selected Story":"FooshaVillage_Chapter1","IgnoreChallenge":[],"Auto Leave on Wave":false,"Auto Sell Wave":1,"Summon Mode":"All Gems","TP Lobby":false,"Raid Buy List":[],"Ping User":false,"Hide Key":"U","TP Lobby Time":10,"AutoStart":true,"Auto Buy Raid2":false,"Summon Banner":"Standard","Enable Auto Challenge":false,"Auto Sell Units":false,"Auto Joiner Player Select":"","FirstTime":true,"Auto Next":false,"PingSelected":false,"Auto Skip Wave":true,"Auto Hide UI on Execute":true,"Import Mode":"Link","Auto Try Reconnect":true,"Raid2 Buy List":[],"Enable Auto Story":false,"Large Window":false,"Auto Start":false,"Result Webhook":false,"AutoSellFarmsWave":1,"WebhookPingSelected":[],"FPS Boost":true,"Hide Additional Frame":false,"Record Macro":false,"difficultySelect":"Normal","Friends Only":false,"Auto Sell Farms":false,"AutoJoinMap":false,"Auto Execute":true}'
-- local macroToImport = "https://cdn.discordapp.com/attachments/1247887586450735147/1247892049404104827/MagicArrow.txt?ex=66776e49&is=66761cc9&hm=d36f47aec4d342901157d72fe78c898cf0c9a6bb6ae7e022ed26762713a25458&"
local macroToImport = ""
local macroName = "MACHAP1"
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
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
    wait(3)
    ScreenGui:Destroy()
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
