function SpawnModel(model, location)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end


    local entity = CreatePed(1, model, location.x, location.y, location.z - 1, location.w, false, false)
    FreezeEntityPosition(entity, true)
    SetEntityInvincible(entity, true)

    return entity
end

function RemoveModel()
    DeleteEntity()
end

exports("SpawnModel", SpawnModel)