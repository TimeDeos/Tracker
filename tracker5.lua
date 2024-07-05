local script_key = "PqHoDxFkbceJBkpqwayystTAAtkIRqth"
local Username = game.Players.LocalPlayer.Name
local ID = game.PlaceId
local gemsCount = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetInventory"):InvokeServer().Currencies.Gems
local updatesUI = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("PAGES", true):FindFirstChild("UpdatesUI", true)
local gracePeriod = 600
local rerollsCount = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetInventory"):InvokeServer().Items["Trait Crystal"]

local function formatNumberWithCommas(number)
    local formatted = tostring(number)
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then break end
    end
    return formatted
end

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
    
        -- Create a TextLabel to display the countdown
        local countdownLabel = Instance.new("TextLabel")
        countdownLabel.Size = UDim2.new(0.3, 0, 0.1, 0)
        countdownLabel.Position = UDim2.new(0.35, 0, 0.4, 0)
        countdownLabel.BackgroundTransparency = 1
        countdownLabel.TextColor3 = Color3.new(1, 1, 1)
        countdownLabel.TextScaled = true
        countdownLabel.Parent = blackFrame

        -- Create a TextLabel to display the gem count
        local gemsLabel = Instance.new("TextLabel")
        gemsLabel.Size = UDim2.new(0.3, 0, 0.1, 0)
        gemsLabel.Position = UDim2.new(0.35, 0, 0.5, 0)
        gemsLabel.BackgroundTransparency = 1
        gemsLabel.TextColor3 = Color3.new(1, 1, 1)
        gemsLabel.TextScaled = true
        gemsLabel.Text = "Gems: " .. formatNumberWithCommas(gemsCount)
        gemsLabel.Parent = blackFrame

        -- Create a TextLabel to display the reroll count
        local rerollsLabel = Instance.new("TextLabel")
        rerollsLabel.Size = UDim2.new(0.3, 0, 0.1, 0)
        rerollsLabel.Position = UDim2.new(0.35, 0, 0.6, 0)
        rerollsLabel.BackgroundTransparency = 1
        rerollsLabel.TextColor3 = Color3.new(1, 1, 1)
        rerollsLabel.TextScaled = true
        rerollsLabel.Text = "Rerolls: " .. formatNumberWithCommas(rerollsCount)
        rerollsLabel.Parent = blackFrame
    
        -- Create a Button to remove the black screen and enable 3D rendering
        local removeButton = Instance.new("TextButton")
        removeButton.Size = UDim2.new(0.2, 0, 0.1, 0)
        removeButton.Position = UDim2.new(0.4, 0, 0.7, 0)
        removeButton.BackgroundColor3 = Color3.new(1, 0, 0)
        removeButton.TextColor3 = Color3.new(1, 1, 1)
        removeButton.Text = "Remove Black Screen"
        removeButton.TextScaled = true
        removeButton.Parent = blackFrame

        -- Function to handle button click
        removeButton.MouseButton1Click:Connect(function()
            screenGui:Destroy()
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end)
    
        -- Function to update the countdown every second
        local function updateCountdown()
            local totalTime = gracePeriod - 10
            while totalTime > 0 do
                local minutes = math.floor(totalTime / 60)
                local seconds = totalTime % 60
                countdownLabel.Text = string.format("Time remaining: %02d:%02d", minutes, seconds)
                wait(1)
                totalTime = totalTime - 1
            end
            countdownLabel.Text = "Time is up!"
        end
        coroutine.wrap(updateCountdown)()
    
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




local function spawnPlatform()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")

    -- Create the platform
    local platform = Instance.new("Part")
    platform.Size = Vector3.new(200, 1, 200)
    platform.Position = rootPart.Position - Vector3.new(0, rootPart.Size.Y / 2 + platform.Size.Y / 2, 0)
    platform.Anchored = true
    platform.BrickColor = BrickColor.new("Bright blue")
    platform.Parent = workspace
end

local function spawnFPSBoost2()
    local platform = Instance.new('Part')
    platform.Name = "Platform"
    platform.Parent = game:GetService("Players").LocalPlayer.Character
    platform.Transparency = 0.5
    platform.Size = Vector3.new(50,2,50)
    platform.Anchored = true
    platform.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0,50,0)
    wait(1)
    workspace.TradingLobby:Destroy()
    workspace.Terrain:Destroy()
    workspace.Billboards:Destroy()
    workspace.SubStuff_DONT_DELETE:Destroy()
end

local function spawnFPSBoost()
    if updatesUI then
        updatesUI:Destroy()
    else
        print("Updates log thing not found")
    end
    spawnPlatform()
    wait(2)
    local lobby = game:GetService("Workspace").Lobby
    local keepPlay = lobby.Build.Play
    local keepPortal = lobby.Build.Portal
    
    -- Iterate through all children of lobby
    for _, child in ipairs(lobby:GetChildren()) do
        -- Check if the child is not the instance to keep
        if child ~= lobby.Build then
            child:Destroy()
        else
            -- If the child is Build, iterate through its children
            for _, buildChild in ipairs(child:GetChildren()) do
                if buildChild ~= keepPlay and buildChild ~= keepPortal then
                    buildChild:Destroy()
                end
            end
        end
    end
    
    workspace.MirrorBuilding:Destroy()
    workspace.SubStuff_DONT_DELETE.Leaderboards:Destroy()
    workspace.SubStuff_DONT_DELETE.TowerOfEternity:Destroy()
    workspace.Model:Destroy()
    wait(10)
    blackScreen()
end


---VPS 1/2
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

-- VPS 3/4
-- local userAssignments = {
--     ZygkWW0205 = {
--         "NjzjLJ1485", "DfryJQ8066", "MwqnDZ4181", "CcgzLW8798",
--         "HnfgPY3221", "YwjJSM9539", "FbswLF4433", "ScscDR8992"
--     },
--     GatosT001 = {
--         "GbbpSN2079", "thompsonTC7955", "KlqfNL0429", "ZtzwTR6905",
--         "LqhqMV0664", "JxstJG2612", "RysgSH4820", "DmvBGT9178"
--     },
--     TotalPetX_2 = {
--         "YnylHZ9941", "bykovPDF4508", "QnkGXT5169", "HzkgLS4691",
--         "XthwLK7142", "WrightSL1336", "HymXPD0855", "JkggWT8744"
--     },
--     PnzMTJ5165 = {
--         "GcrkRT8491", "NbpxCP7376", "FqpRWH1316", "QftmSJ0439",
--         "QmvwFP0737", "YgmPND3379", "JonesKV3284", "VytcRK6795"
--     },
--     Chanll1224 = {
--         "JmsgQJ4842", "YnpjBP5773", "YscpSG0430", "ZpzYVS0430",
--         "NtrxBY8535", "CrgtQX9249", "RvwVZR0262", "bakerCX8226"
--     }
-- }


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
        wait(gracePeriod)
        startScript(config)
    else
        startScript(config)
        --wait(3)
        --spawnFPSBoost2()
    end
end



