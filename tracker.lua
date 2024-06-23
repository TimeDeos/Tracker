local Username = "ZygkWW0205"
local script_key = "PqHoDxFkbceJBkpqwayystTAAtkIRqth"

if game.Players.LocalPlayer.Name == Username then
    getgenv().SelectedPlayer = Username -- Main Account/Account To Send Gems
    getgenv().MainAccount = true -- Set true if it's the account to receive gems, false if the account sends gems
    getgenv().MainAccountSetting = { -- Unit To Sell
        ManuallyClaimBooth = false, -- Set true to manually claim booth (fix crash for codex)
        Units = {"Electric Cyborg"}
    }
    getgenv().AltAccountSetting = {
        Trade = true,
        NotSendGem = false,
        TradeItems = {"Trait Crystal", "Risky Dice"},
        GiveBackUnit = true
    }
else
    getgenv().SelectedPlayer = Username -- Main Account/Account To Send Gems
    getgenv().MainAccount = false -- Set true if it's the account to receive gems, false if the account sends gems
    getgenv().MainAccountSetting = { -- Unit To Sell
        ManuallyClaimBooth = false, -- Set true to manually claim booth (fix crash for codex)
        Units = {"Electric Cyborg"}
    }
    getgenv().AltAccountSetting = {
        Trade = true,
        NotSendGem = false,
        TradeItems = {"Trait Crystal", "Risky Dice"},
        GiveBackUnit = true
    }
end

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3051457467c11f25288cfe2de3708373.lua"))()
