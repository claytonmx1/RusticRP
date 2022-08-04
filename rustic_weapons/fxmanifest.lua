fx_version 'adamant'

game 'gta5'

description 'Weapons as items, attachments, multiple ammo types by Rico'

shared_script 'config.lua'

client_scripts {
	'client.lua',
	'locales.lua'
} 

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	'server.lua'
}
