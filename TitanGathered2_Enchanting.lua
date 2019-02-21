TITAN_GATHERED_PLUGIN_ID = "Enchanting"
tgenchPluginDb = {}

TitanGathered2_Enchanting = {}
-- Reduce the chance of functions and variables colliding with another addon.
local tgench = TitanGathered2_Enchanting
local infoBoardData = {}
local tg = TitanGathered2

tgench.id = TITAN_GATHERED_PLUGIN_ID
tgench.addon = "TitanGathered2_Enchanting"
tgench.email = "bajtlamer@gmail.com"
tgench.www = "www.rrsoft.cz"

--  Get data from the TOC file.
tgench.version = tostring(GetAddOnMetadata(tgench.addon, "Version")) or "Unknown"
tgench.author = tostring(GetAddOnMetadata(tgench.addon, "Author")) or "Unknown"


for _, _category in pairs(TGENCH_PLUGIN_CATEGORIES) do
    table.insert(TG_CATEGORIES, _category)
end


function tgench.Button_OnLoad(self)
	echo(tgench.addon.." ("..TitanUtils_GetGreenText(tgench.version).."|cffff8020) loaded! Created By "..tgench.author)

	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("PLAYER_LEAVING_WORLD")
    self:RegisterEvent("LOOT_OPENED")
    tgench.registerPlugin()
    tgench.registerPluginMinable()
end

function tgench.registerPlugin()
    table.insert(tgPlugins, tgench)
end

function tgench.registerPluginMinable()
    for _, _m in pairs(TGENCH_MINABLES)do
        table.insert(TG_MINABLES, _m)
    end
end

-- Event
function tgench.Button_OnEvent(self, event)
    -- EMPTY
end

function tgench.getGatherableSourceObject(objectId)
    for _, _m in pairs(TGENCH_MINABLES) do
        if (_m.id == objectId) then
            return _m
        end
    end
    return {id = objectId, name = nil}
end
