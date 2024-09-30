-- Ensuring Script Name Is Untouched // Or Else won't work.
local QBCore = exports['qb-core']:GetCoreObject()
local Framework = Config.core
if GetCurrentResourceName() == "bd_lib" then
    print("^5[" .. GetCurrentResourceName() .. "] ".. " ^2Started Correctly!^0")
    print("^5[" .. GetCurrentResourceName() .. "] ^0".. "^4A Broad Development Script!^0")
else
    print("^5[" .. GetCurrentResourceName() .. "] ".. "^1Resource Has The Wrong Name and will not work correctly.")
end


function RegisterInventory(name, label, inventory, targets)
    if Config.inventory == "ox" then
        exports.ox_inventory:RegisterShop(name, {
            name = label,
            inventory = inventory,
            locations = {
               targets
            },
        })   
    end
end


function CreateUsable(item, options)
    if Config.core == "qb-core" or "qbx" then
        QBCore.Functions.CreateUseableItem(item, options)
    elseif Config.Settings.core == "ox" then

    end
end

function removeItem(src, item, amt)
    if Config.inventory == "qb" then
        
    elseif Config.inventory == "ox" then
        exports.ox_inventory:RemoveItem(src, item, amt)
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

function addMoney(Player, amt)
    Player.Functions.AddMoney("cash", amt)
end

function removeMoney(Player, amt)
    Player.Functions.RemoveMoney("cash", amt)
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



-- All Server Sided Exports
exports("RegisterInventory", RegisterInventory)
exports("CreateUsable", CreateUsable)
exports("removeItem", removeItem)
exports("addItem", addItem)
exports("addMoney", addMoney)    
exports("removeMoney", removeMoney)
exports("GiveKeys", GiveKeys)
exports("Search", Search)