script_key = "PqHoDxFkbceJBkpqwayystTAAtkIRqth"
getgenv().Setting = {
    AutoSkipWave=true,
    AutoClaimQuest = true,
    CapFps = true,
    FpsBoost = true,
    BlackScreen = true,
    WebhookUrl = "https://discord.com/api/webhooks/1259058359068528681/j5m3SsIo0Kb9HwdoFs8FeZB3zB6CidOmO0pGT_64Y7u7Fdy5yGb9Q5xlSW-D0X6Zioyh",
    OneClickNewSetting = { 
        Enable = true,
        Feed = true,
        Leave=false,
        AllChapter = false,
        IgnoreEquipBest = false,
        LeaveWave = true,
        RequiredLevel = 25,
        AllUnitsToGo = {"Cursed Fighter"},
        SnipeBannerUnits = {"Cursed Fighter"}, --Snipe Unit Must Be In All Units To Use
        TradingSnipe = false,
        ForceInf = false, --Ignore Level, Unit
        AnyUnitMythical_Secret = {
            StartInfinite=true,
            Feed=true,
            IgnoreLevel = false
        },
        TradingSnipeUnits = {"Electric Cyborg"},
        MaxGemUnit = 1000,
    },
}
if getgenv().Loaded  then
    return 
end
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/57d5eebd9b111f1639a5970102487168.lua"))()
