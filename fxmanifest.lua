fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'bd_lib'
author 'broad.' 
description ''
version '0.0.1' 

shared_scripts { 
    'config.lua', 
    '@ox_lib/init.lua'
}

client_scripts { 
    'client/frameworks/esx/*.lua', -- For files directly in client/frameworks
    'client/frameworks/qb/*.lua', -- Excludes files in client/frameworks/qb
    'client/frameworks/qb/menus.lua', -- Excludes files in client/frameworks/qb

    'bridge/cl_exports.lua' -- Excludes files in client/frameworks/qb
}


server_scripts { 
    'server/frameworks/qb/*.lua', 
    'server/frameworks/esx/*.lua',
    'bridge/sv_exports.lua' -- Excludes files in client/frameworks/qb
}
