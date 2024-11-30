-- Ensuring Script Name Is Untouched // Or Else won't work.
local Framework = Config.core

if Framework == "qb-core" then
    local QBCore = exports['qb-core']:GetCoreObject()

    function GetPlayerData()
        local QBCore = exports['qb-core']:GetCoreObject()    
        return QBCore.Functions.GetPlayerData()
    end
    

    
    function registerStash(id, label, slots, weight, owner)
        if Config.inventory == "ox" then
            local stash = {
                id = id,
                label = label,
                slots = slots,
                weight = weight,
                owner = owner
            }
        end
    end
    
    function CreateUsable(item, options)
        if Config.core == "qb-core" or "qbx" then
            QBCore.Functions.CreateUseableItem(item, options)
        elseif Config.Settings.core == "ox" then
    
        end
    end
    
    function removeItem(src, item, amt, metadata)
        if Config.inventory == "qb" then
            
        elseif Config.inventory == "ox" then
            exports.ox_inventory:RemoveItem(src, item, amt, metadata)
        end
    end
    
    function addItem(src, item, amt, metadata)
        if Config.inventory == "qb" then
            local Player = bd:GetPlayer(src)
            Player.Functions.AddItem(item, amt, nil, metadata)
        elseif Config.inventory == "ox" then
            exports.ox_inventory:AddItem(src, item, amt, metadata)
        end
    end
    
    function addMoney(src ,type , amt)
       local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddMoney(type, amt)
    end
    
    function getMoney(src, type)
        local player = QBCore.Functions.GetPlayer(src)

        if type == "cash" then
            return player.PlayerData.money.cash 
        elseif type == "bank" then
            return player.PlayerData.money.bank
        end
    end
    
    function removeMoney(src ,type , amt)
        local Player = QBCore.Functions.GetPlayer(src)
        local player = QBCore.Functions.GetPlayer()
        Player.Functions.RemoveMoney(type, amt)
    end
    
    function GiveKeys(vehicle)
        local plate = GetVehicleNumberPlateText(veh)
        if Config.KeySystem == "qb" or "qbx" then
            TriggerEvent("vehiclekeys:client:SetOwner", plate)
        end
    end
    
    function Search(src, item, metadata)
        if Config.inventory == "qb" then
            QBCore.Functions.HasItem(item)
        elseif Config.inventory == "ox" then
            local c = exports.ox_inventory:Search(src ,"count", item, metadata)
            if c >= 1 then
                return true
            end
        end
    end
    
    function ServerNotify()
        
    end
    
    function GetItem(source, item, metadata, returnItem)
        return exports.ox_inventory:GetItem(source, item,  metadata, returnItem)
    end
    


    
    
    -- All Server Sided Exports
    exports("CreateUsable", CreateUsable)
    exports("removeItem", removeItem)
    exports("addItem", addItem)
    exports("getMoney", getMoney)    
    exports("addMoney", addMoney)  
    exports("removeMoney", removeMoney)
    exports("GiveKeys", GiveKeys)
    exports("Search", Search)
    exports("registerStash", registerStash)
    exports("GetItem", GetItem)

end


if GetCurrentResourceName() == "bd_lib" then
    print("^5[" .. GetCurrentResourceName() .. "] ".. " ^2Started Correctly!^0")
    print("^5[" .. GetCurrentResourceName() .. "] ^0".. "^4A Broad Development Script!^0")
else
    print("^5[" .. GetCurrentResourceName() .. "] ".. "^1Resource Has The Wrong Name and will not work correctly.")
end


