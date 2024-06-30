local script_key = "PqHoDxFkbceJBkpqwayystTAAtkIRqth"
local Username = game.Players.LocalPlayer.Name
local ID = game.PlaceId
local gemsCount = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetInventory"):InvokeServer().Currencies.Gems

local function blackScreen()
    if gemsCount > 100 then
        local player = game.Players.LocalPlayer
        local playerGui = player:WaitForChild("PlayerGui")
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "BlackScreenGui"
        screenGui.Parent = playerGui
        local blackFrame = Instance.new("Frame")
        blackFrame.Size = UDim2.new(1, 0, 1, 0)
        blackFrame.BackgroundColor3 = Color3.new(0, 0, 0)
        blackFrame.BorderSizePixel = 0
        blackFrame.Parent = screenGui
        game:GetService("RunService"):Set3dRenderingEnabled(false)
    elseif gemsCount <= 100 then
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
        TextLabel.Text = "Close me!"
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextScaled = true
    end
end

local function spawnFPSBoost()
    local lobby = game:GetService("Workspace").Lobby
    local keep = lobby.Build.Play

    -- Iterate through all children of lobby
    for _, child in ipairs(lobby:GetChildren()) do
        -- Check if the child is not the instance to keep
        if child ~= lobby.Build then
            child:Destroy()
        else
            -- If the child is Build, iterate through its children
            for _, buildChild in ipairs(child:GetChildren()) do
                if buildChild ~= keep then
                    buildChild:Destroy()
                end
            end
        end
    end
    workspace.TowerModel:Destroy()
    workspace.SubStuff_DONT_DELETE.Leaderboards:Destroy()
    workspace.SubStuff_DONT_DELETE.TowerOfEternity:Destroy()
    workspace.Model:Destroy()
    workspace.Lobby.Build.Play:GetChildren()[9]:Destroy()
    blackScreen()
end


local userAssignments = {
    ZygkWW0205 = {
        "VvhTCR5264", "JgkdWT3407", "VwmxVB8202", "KkghRV0780", 
        "CncGCR1969", "CgklJB1602", "LmfjKR9309", "PfmqNY7543"
    },
    GatosT001 = {
        "PrbwQZ5049", "PfnQSR6347", "NsxpRP5003", "GmqmVZ2055",
        "QclXBN1191", "SrpsZY8890", "ZvdyCG2680", "GreenPH9478"
    },
    TotalPetX_2 = {
        "MgzsJW0374", "WrhjQD8317", "FrdJWB1833", "NtxvLH4280",
        "FcgnCQ4170", "MbfgYF2213", "QhpFXN8335", "DswpPT6275"
    },
    PnzMTJ5165 = {
        "YxxWHB2538", "GrhqZS4987", "NxwtXK8650", "JjmqWT3603",
        "LfjFMP3505", "DjjXCZ8033", "WchfRV4896", "XfxdzYG0938"
    },
    Chanll1224 = {
        "BjdhXM3673", "GyhjNG7052", "XzjbFR4406", "JbrtCC1564",
        "GxypJR9561", "XlgQPD4571", "ThompsonGZ9194", "SmmcMB7276"
    }
}

local function startScript(config)
    getgenv().script_key = config.script_key
    getgenv().SelectedPlayer = config.SelectedPlayer
    getgenv().MainAccount = config.MainAccount
    getgenv().MainAccountSetting = config.MainAccountSetting
    getgenv().AltAccountSetting = config.AltAccountSetting

    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3051457467c11f25288cfe2de3708373.lua"))()
end

local isConfigured = false
local isTransferAccount = false
local config = {
    script_key = script_key,
    MainAccountSetting = {
        ManuallyClaimBooth = false,
        Units = {"Electric Cyborg", "Magic Arrow"}
    },
    AltAccountSetting = {
        Trade = true,
        NotSendGem = false,
        TradeItems = {"Trait Crystal", "Risky Dice"},
        GiveBackUnit = true
    }
}

for transfer, users in pairs(userAssignments) do
    if transfer == Username then
        config.SelectedPlayer = transfer
        config.MainAccount = true
        isConfigured = true
        isTransferAccount = true
        print("Configured as transfer account for: " .. transfer)
        break
    elseif table.find(users, Username) then
        config.SelectedPlayer = transfer
        config.MainAccount = false
        isConfigured = true
        print("Configured as user for transfer account: " .. transfer)
        break
    end
end

if not isConfigured then
    error("Username not found in the configuration")
end

if isTransferAccount then
    startScript(config)
else
    if ID == 17017769292 then
        spawnFPSBoost()
        wait(600)
        startScript(config)
    else
        startScript(config)
    end
end
