fx_version 'cerulean'
game 'gta5'

name 'qb-help'
author 'Braiden Marshall'
description 'QBCore Help / Tablet Panel UI (in-game clock, hardened)'
version '1.1.1'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/app.js',
    'html/style.css'
}

shared_scripts {
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}
