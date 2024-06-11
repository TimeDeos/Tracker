-- You steal this shit you gay ass fuck

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
        Url = "http://192.168.1.3:5000/gato",
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("Sent..?")
    print("Server response:", response)
end
