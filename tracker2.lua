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

-- Function to hop to a low server
local function hopLowServer()
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local Api = "https://games.roblox.com/v1/games/"
    local _place = game.PlaceId
    local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"

    local function ListServers(cursor)
       local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
       return Http:JSONDecode(Raw)
    end

    local Server, Next
    repeat
       local Servers = ListServers(Next)
       Server = Servers.data[1]
       Next = Servers.nextPageCursor
    until Server

    TPS:TeleportToPlaceInstance(_place, Server.id, game.Players.LocalPlayer)
    -- credits to https://robloxscripts.com/server-hopper-join-lowest-player-servers-on-roblox-script/
end

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
    blackScreen()
end

local function startTimerAndCheckPlaceId()
    local placeIdToCheck = 17764698696
    local checkInterval = 5 * 60 -- 5 minutes in seconds

    spawn(function()
        wait(checkInterval)
        if game.PlaceId == placeIdToCheck then
            hopLowServer()
        end
    end)
end

ID = game.PlaceId
if ID == 17764698696 then
    spawnFPSBoost()
    startTimerAndCheckPlaceId()
else
    blackScreen()
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
            Url = "http://192.168.1.3:5000/gato",
            Method = "POST",
            Headers = headers,
            Body = body
        })
        print("Sent..?")
        print("Server response:", response)
    end
end
