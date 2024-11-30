fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'bd_lib'
author 'broad.' 
description ''
version '1.0.2' 

shared_scripts { 
    'config.lua', 
    '@ox_lib/init.lua',
    "bridge/sh_exports.lua",
}

client_scripts { 
    'client/frameworks/*.lua',
    'client/*.lua',
    'bridge/cl_exports.lua' -- Excludes files in client/frameworks/qb
}


server_scripts { 
  'server/frameworks/*.lua',
    'bridge/sv_exports.lua' -- Excludes files in client/frameworks/qb
}
