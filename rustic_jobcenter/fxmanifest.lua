fx_version 'adamant'

game 'gta5'

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/styles.css',
	'html/scripts.js',
	'html/debounce.min.js',
	'html/img/header.png',
    'html/img/tablet.png'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'config.lua',
	'locales/en.lua',
	'server/esx_joblisting_sv.lua'
}

client_scripts {
	'@menuv/menuv.lua',
	'@es_extended/locale.lua',
	'config.lua',
	'locales/en.lua',
	'client/esx_joblisting_cl.lua',
	'menu.lua'
}

dependencies {
	'es_extended',
	'menuv'
}