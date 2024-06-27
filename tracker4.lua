-- You steal this shit you gay ass fuck
-- Gato FPS Boost
repeat wait() until game:IsLoaded()

-- Gems
local gemsCount = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetInventory"):InvokeServer().Currencies.Gems
-- Rerolls
local rerollsCount = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetInventory"):InvokeServer().Items["Trait Crystal"]
-- Level
local levelCount = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetInventory"):InvokeServer().Level
-- Username
local playerName = game.Players.LocalPlayer.Name

local function blackScreen()
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
end

local function spawnFPSBoost()
    local lobby = game:GetService("Workspace").Lobby
    local keep = lobby.Build.Play

    for _, child in ipairs(lobby:GetChildren()) do
        if child ~= lobby.Build then
            child:Destroy()
        else
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
    --blackScreen()
end

ID = game.PlaceId
if ID == 17764698696 then
    spawnFPSBoost()
else
    print("Lol")
end
