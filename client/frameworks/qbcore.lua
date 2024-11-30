    local framework = Config.core


    if framework == "qb-core" then
       local QBCore = exports['qb-core']:GetCoreObject()
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
            
            
            function Notify(title , description, type, location, duration)
                if Config.notify == "qb" then
                    QBCore.Functions.Notify(title, type, duration)
                elseif Config.notify == "ox" then
                    lib.notify({
                        title = title,
                        description = description,
                        type = type,
                        position = location,
                        duration = duration,
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

            
            function triggerCallback(name, delay, cb)
                lib.callback(name, delay, cb)
            end

            function jobCheck(job)
                local QBCore = exports['qb-core']:GetCoreObject()
                local PlayerData = QBCore.Functions.GetPlayerData()
                local pjob = PlayerData.job.name
                print(pjob)
                if job == pjob then
                    return true
                else
                    return false
                end
            end

            -- Client Sided Exports
            exports("triggerCallback", triggerCallback)
            exports("Notify", Notify)
            exports("OpenInventory", OpenInventory)
            exports("ProgressBar", ProgressBar)
            exports("getItemCount", getItemCount)       
            exports("setFuel", setFuel)    
            exports("jobCheck", jobCheck)
            
    end
