fx_version 'cerulean'
game 'gta5'

author 'Jeydolen'
description 'Little script to implement weapon crafting on ESX FiveM servers'
version '1.1'

client_scripts{
	'@es_extended/locale.lua',
	'locales/*.lua'
	'config.lua',
	'client.lua'
}
server_scripts{
	'@es_extended/locale.lua',
	'locales/*.lua'
	'config.lua',
	'server.lua'
}