
function CreateTarget(coords, debug, label , name , icon , onSelect)
if Config.target == "qb" then

elseif Config.target == "ox_target" then
    exports.ox_target:addSphereZone({
                        
        coords = coords,
        radius = 1.5,
        debug = debug,
        options = {
            {
            label = label,
            name = name,
            icon = icon, 
            distance = 1.5,
            onSelect = onSelect
        }
        }
    })
end
end

function CreateEntityTarget(entities, label, icon, action, job )
    if Config.target == "qb-target" then
        exports['qb-target']:AddTargetEntity(entities, { -- The specified entity number
        options = { -- This is your options table, in this table all the options will be specified for the target to accept
          { -- This is the first table with options, you can make as many options inside the options table as you want
            icon = icon, -- This is the icon that will display next to this trigger option
            label = label, -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
            action = action,
    }
        },
        distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
      })
    elseif Config.target == "ox_target" then
        -- exports.ox_target:addLocalEntity(entities, {
        --     label = label,
        --     icon = icon,
        --     onSelect = action,
        --     groups = job,
        -- })
        exports.ox_target:addLocalEntity(entities, {
            label = label,
            icon = icon,
            onSelect = action,
            groups = job,
        })
    end
end


function CreateGlobalPed()
    if Config.target == 'qb' then
        
    elseif Config.target == "ox_target" then
        exports.ox_target:addGlobalPed(options)

    end
end

function ProgressBar(type, duration, label, useWhileDead, canCancel, disable, animTable)
    if type == "bar" then
       local results = lib.progressBar({
            duration = duration,
            label = label,
            useWhileDead = useWhileDead,
            canCancel = canCancel,
            disable = disable,
            anim = animTable
        })

        return results
    elseif type == "circle" then
       local results =  lib.progressCircle({
            duration = duration,
            position = "bottom",
            label = label,
            useWhileDead = useWhileDead,
            canCancel = canCancel,
            disable = disable,
            anim = animTable
        })
        
        return results
    end
end


function Notify(title , description, type, location)
    if Config.notify == "qb" then
        
    elseif Config.notify == "ox" then
        lib.notify({
            title = title,
            description = description,
            type = type,
            position = location,
        })
    end
end

function OpenInventory(type, data)
    exports.ox_inventory:openInventory(type,data) 
end


function getItemCount(item)
    if Config.inventory == "qb" then
        QBCore.Functions.HasItem(item)
    elseif Config.inventory == "ox" then
       local c = exports.ox_inventory:GetItemCount(item)
            return c
    end
end

function setFuel(vehicle, fuel)
    if Config.FuelSystem == "LegacyFuel" then
    exports["LegacyFuel"]:SetFuel(vehicle, fuel)
    elseif Config.FuelSystem == "ox_fuel" then
        
        Entity(vehicle).state.fuel = fuel
    end
end

function addLocalEntity(entities, label , icon , action)
    exports.ox_target:addLocalEntity(entities, {
        label = label,
        icon = icon,
        onSelect = action,
    })
end


-- Client Sided Exports
exports("CreateTarget", CreateTarget)
exports("CreateEntityTarget", CreateEntityTarget)
exports("Notify", Notify)
exports("OpenInventory", OpenInventory)
exports("ProgressBar", ProgressBar)
exports("getItemCount", getItemCount)       
exports("setFuel", setFuel)    
exports("addLocalEntity", addLocalEntity)  


