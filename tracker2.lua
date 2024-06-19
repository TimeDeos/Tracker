repeat wait() until game:IsLoaded()
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

-- Gems
local gemsCount = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetInventory"):InvokeServer().Currencies.Gems
-- Rerolls
local rerollsCount = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetInventory"):InvokeServer().Items["Trait Crystal"]
-- Level
local levelCount = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetInventory"):InvokeServer().Level
-- Username
local playerName = game.Players.LocalPlayer.Name

while wait(15) do
    local msg = "[" .. levelCount .. "] " .. playerName .. " - <:diamond:1244316023708979271> " .. gemsCount .. " <:rr:1244982385242804304> " .. rerollsCount

    print("Sending message:", msg)  -- Debugging line

    local httpService = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["content"] = msg
    }
    local body = httpService:JSONEncode(data)

    local response = request({
        Url = "https://closed-margo-applecidervinegar-9c2dd853.koyeb.app/gato2",
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("Sent..?")
    print("Server response:", response)
end
