function CreateTarget(coords, debug, options)
    if Config.target == "qb" then
    
    elseif Config.target == "ox_target" then
        exports.ox_target:addSphereZone({
                            
            coords = coords,
            radius = 1.5,
            debug = debug,
            options = options
        })
    end
    end
    
    function addModelTarget(models, options)
        if Config.target == "qb-target" then
            
        elseif Config.target == "ox_target" then
            exports.ox_target:addModel(models, options)
        end
    end
    
    function CreateEntityTarget(entities,options )
        if Config.target == "qb-target" then
            exports['qb-target']:AddTargetEntity(entities,options)
        elseif Config.target == "ox_target" then
            exports.ox_target:addLocalEntity(entities, options)
        end
    end
    


    

    exports("CreateTarget", CreateTarget)
    exports("CreateEntityTarget", CreateEntityTarget)
    exports("addModelTarget", addModelTarget)  