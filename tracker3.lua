local HttpService = game:GetService("HttpService")

-- Edit this part
local macroToImport = "https://cdn.discordapp.com/attachments/1246493755477987428/1255169894723616778/CursedFighter_Wave31_1.json?ex=667cd04e&is=667b7ece&hm=6a0dd204bca08886c3796d5e329286b8a9e1b3feb5ab970e6750cdb29e7bc761&"
local macroName = "b"
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
