local HttpService = game:GetService("HttpService")

-- Edit this part
local macroToImport = "https://cdn.discordapp.com/attachments/1246493755477987428/1261664842075344968/CursedFighter_Wave31_1.json?ex=6693c872&is=669276f2&hm=13503916c871f849bbc9d784012bbc2cfb50f85dbcb7c81e544f4b0a58e91f66&"
local macroName = "curse"
-- ( macroToImport should be a GitHub or Discord link. )
-- Leave macroToImport blank if you don't need to import

local realMacroName = "Buang/AD/Macros/" .. macroName .. ".json"
-- don't touch this one, only change macroName

local function grabMacro(url)
    local response = request({
        Url = url,
        Method = "GET",
    })
    
    if response.Success then
        writefile(realMacroName, response.Body)
        print("Successfully imported the macro as", macroName .. ".json")
    else
        warn("Failed to fetch macro: " .. response.StatusMessage)
    end
end

if macroToImport == "" then
    print("No macro to import.")
else
    grabMacro(macroToImport)
end
