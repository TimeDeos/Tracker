local script_key = "PqHoDxFkbceJBkpqwayystTAAtkIRqth"
local Username = game.Players.LocalPlayer.Name

-- Pre-assigned users to transfer accounts
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
    wait(600)
    startScript(config)
end
