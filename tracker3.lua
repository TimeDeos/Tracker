local HttpService = game:GetService("HttpService")

-- Edit this part
local config = '{"actSelect":"1","Macros Selected":{"Raid":[],"Story":[],"Infinite":[],"Challenge":[]},"blackScreen":false,"Auto Claim Quests":true,"Auto Hide Name":false,"Auto Raid (Lobby)":false,"Enable Auto Join Player":false,"Webhook":{"ID":0,"Ping":false,"Result":false,"URL":""},"Ping On Secret Drop":false,"TP Lobby when RAID OPEN":false,"Auto Buy Raid":false,"Auto Summon":false,"Auto Leave Wave":false,"Summon Gems":0,"Record Options":"Money","Summon Unit":"","Auto Raid":false,"Export File":"Fire","Auto Start Time Delay":0,"Auto Lobby TP on Time":false,"Black Screen":false,"Selected Macro":"Fire","Auto Tower":false,"Play Macro":true,"friendSelect":true,"Auto Start Game/Skip":false,"Auto Start Delay":0,"Auto Joiner Player":false,"IgnoreChallengeMap":[],"Auto Next":false,"Step Delay":3,"Ping On Selected Item":false,"Auto Leave":true,"IgnoreChallengeRewards":[],"Macro Mode Select":"Story","Auto Join Map":false,"Delete Map":true,"Auto Story Mode":"Automatic","TP Delay":3,"Auto Sell Wave":1,"mapSelect":"FooshaVillage","AutoLeaveOnWave":1,"Enable Auto Challenge":false,"difficultySelect":"Normal","IgnoreChallenge":[],"Auto TP Raid Open":false,"modeSelect":"Story","Summon Mode":"All Gems","AutoStart":true,"Raid Buy List":[],"Auto Leave on Wave":false,"Summon Banner":"Standard","TP Lobby Time":10,"TP Lobby":false,"Ping User":false,"Auto Sell Farms":false,"Auto Replay":true,"Auto Sell Units":false,"Auto Joiner Player Select":"","AutoChallenge":false,"Auto Story":false,"PingSelected":false,"Auto Skip Wave":true,"Auto Hide UI on Execute":true,"Import Mode":"Link","Auto Try Reconnect":true,"FirstTime":true,"Enable Auto Story":false,"Hide Key":"U","Auto Start":false,"Result Webhook":false,"AutoSellFarmsWave":1,"WebhookPingSelected":[],"Large Window":false,"FPS Boost":true,"Record Macro":false,"Auto Execute":true,"Friends Only":false,"Selected Story":"FooshaVillage_Chapter1","AutoJoinMap":true,"Hide Additional Frame":false}'
local macroToImport = "https://cdn.discordapp.com/attachments/1246493755477987428/1252612317678665799/Fire.txt?ex=6672d9a0&is=66718820&hm=aa7c632ecb88ad80cabfeba5ce87089b94961b908b91c638a2598fdf5b173981&"
local macroName = "Fire"
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
