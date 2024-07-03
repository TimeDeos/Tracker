-- You steal this shit you gay ass fuck
-- Gato FPS Boost
repeat wait() until game:IsLoaded()


local function hopLowServer()
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local Api = "https://games.roblox.com/v1/games/"

    local _place = game.PlaceId
    local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
    function ListServers(cursor)
       local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
       return Http:JSONDecode(Raw)
    end

    local Server, Next; repeat
       local Servers = ListServers(Next)
       Server = Servers.data[1]
       Next = Servers.nextPageCursor
    until Server

    TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
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
    blackScreen()
end

local ID = game.PlaceId
if ID == 17764698696 then
    spawnFPSBoost()
    wait(90)
    while true do
        if ID == 17764698696 then
            hopLowServer()
            wait(10)
        end
    end
else
    blackScreen()
    repeat task.wait() until game:IsLoaded()
    getgenv().Hermanos_Settings = {
        ['key'] = '9e5a6c16-283a-49db-9ccc-8002c065413a',
        ['PC'] = 'VPS1',
    	}
    task.spawn(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/hermanos-dev/hermanos-script/main/ad-main.lua'))() end)
end
