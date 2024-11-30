function GetCoreObject()
if Config.core == "qb-core" then
    return exports["qb-core"]:GetCoreObject()
elseif Config.core == "esx" then
    return exports['es_extended']:getSharedObject()
end
end


function getImageURL(item)
    if Config.inventory == "qb" then
        return ("https://cfx-nui-qb-inventory/html/images/%s.png"):format(item)
    elseif Config.inventory == "ox" then
        return ("https://cfx-nui-ox_inventory/web/images/%s.png"):format(item)
    elseif Config.inventory == "lj-inventory" then
        return ("https://cfx-nui-lj-inventory/html/images/%s.png"):format(item)
    end
 end

 function GetLang()
    return Config.language
 end
 
 exports("GetLang", GetLang)
exports("getImageURL", getImageURL)
exports("GetCoreObject", GetCoreObject)