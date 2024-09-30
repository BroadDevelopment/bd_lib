function GetPlayer(source)
    if Config.core == "qb-core" then
        local QBCore = exports['qb-core']:GetCoreObject()
        local p = QBCore.Functions.GetPlayer(source)
        return p
    end
end

function GetCoreObject()
    if Config.core == "qb-core" then
        return exports['qb-core']:GetCoreObject()
    end
end

function GetLang()
    return Config.language
 end

exports("GetPlayer", GetPlayer)
exports("GetLang", GetLang)
exports("GetCoreObject", GetCoreObject)