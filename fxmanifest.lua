fx_version 'cerulean'
game 'gta5'
lua54 'yes'

client_script 'src/client/*.lua'
server_scripts {
    -- '@vrp/lib/utils.lua', -- comment or uncomment this if you are using/not using vrp
    'src/server/*.lua'
}

shared_scripts { '@ox_lib/init.lua', 'src/shared/*.lua' }

ui_page 'src/web/index.html'
files { 'src/web/index.html', 'src/web/index.js', 'src/web/index.css', 'src/web/blindfold.png', 'locales/*.json' }


dependencies { 'ox_lib' }