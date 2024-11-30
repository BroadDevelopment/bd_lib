local core = exports.bd_lib:GetCoreObject()

function GetPlayer(source)
    if Config.core == "qb-core" then
        local p = core.Functions.GetPlayer(source)
        return p
    elseif Config.core == "esx" then
        local p core.GetPlayerFromId(source)
        return p 
    end
end

function getjobName(player)
    if Config.core == 'qb-core' then
        return player.PlayerData.job.name
    elseif Config.core == "esx" then

    end
end

function getjobLabel(player)
    if Config.core == 'qb-core' then
        return player.PlayerData.job.label
    elseif Config.core == "esx" then

    end
end

function GetPlayerIdentifier(player)
    if Config.core == "qb-core" then
       return player.PlayerData.citizenid
    elseif Config.core == "esx" then
        return GetPlayerIdentifierByType(player,'license')
    end
end

function GetName(player)
    if Config.core == "qb-core" then
        return player.PlayerData.charinfo.firstname .. " " .. player.PlayerData.charinfo.lastname
    elseif Config.core == "esx" then
        return player.getName()
    end
end


exports("GetPlayer", GetPlayer)
exports("GetPlayerIdentifier", GetPlayerIdentifier)
exports("GetName", GetName )
exports("getjobLabel", getjobLabel)
exports("getjobName", getjobName)
exports("getjobName", getjobName)