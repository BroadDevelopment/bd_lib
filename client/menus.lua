function InputMenu(heading, rows)
    if Config.input == "ox" then
    --   lib.inputDialog(heading, rows) 
        return lib.inputDialog(heading, rows) 
    end
end

function CreateContext(id, title, options, menu, exit)
    if Config.input == "ox" then
        lib.registerContext({
            id = id,
            title = title,
            menu = menu,
            onExit = exit,
            options = options,
        })

    end
end

function ShowMenus(menu)
    if Config.input == "ox" then
       lib.showContext(menu) 
    end
end


-- Menu Exports
exports("CreateContext", CreateContext)
exports("InputMenu", InputMenu)
exports("ShowMenus", ShowMenus)
