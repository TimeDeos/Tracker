local HttpService = game:GetService("HttpService")

-- Edit this part
local macroToImport = "https://cdn.discordapp.com/attachments/1246493755477987428/1257281598546640947/CursedFighter_Wave31_1.json?ex=6683d63c&is=668284bc&hm=65c776c11815ca76b1eead2e2c230d87c1aac71f90e6d5dfe07ba843ca1c3d23&"
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
