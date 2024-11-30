local Inventory = Config.core

if Inventory == 'ox_inventory' then

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

    exports("RegisterInventory", RegisterInventory)
else return
end