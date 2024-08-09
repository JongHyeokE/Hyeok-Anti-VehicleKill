fx_version "cerulean"
games {'gta5'}

description "Made By JongHyeok [ jonghyeoke ]"

lua54 "yes"

server_scripts {
    "@vrp/lib/MySQL.lua",
    "@vrp/lib/utils.lua",
    "config/sv_config.lua",
    "server/*.lua",
}

client_scripts {
    '@vrp/client/Tunnel.lua',
    '@vrp/client/Proxy.lua',
	'client/*.lua',
}