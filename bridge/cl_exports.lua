function GetLang()
   return Config.language
end

function getImageURL(item)
   if Config.inventory == "qb" then
       return ("https://cfx-nui-qb-inventory/html/images/%s.png"):format(item)
   elseif Config.inventory == "ox" then
       return ("https://cfx-nui-ox_inventory/web/images/%s.png"):format(item)
   end
end


exports("getImageURL", getImageURL)
exports("GetLang", GetLang)