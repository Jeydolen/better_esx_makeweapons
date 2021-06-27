Config = {}
Config.chance = 50
Config.waiting_time = 5000
Config.Locale = "fr"

Config.Zones = {
	make_weapons = {
		Pos 	= {x = 287.24, y = -1065.82, z = 28.52},
        Size  	= {x = 2.0, y = 2.0, z = 2.0},
        Color 	= {r = 136, g = 243, b = 216},
        Name  	= _U('makeweapon_label'),
		Text 	= _U('makeweapon_text'),
        Type  	= 27,
		action  = "weapon"
	},
	barrel = {
		Pos 	= {x = 277.24, y = -1065.82, z = 28.52},
        Size  	= {x = 2.0, y = 2.0, z = 2.0},
        Color 	= {r = 136, g = 243, b = 216},
        Name  	= _U('makebarrel_label'),
		Text 	= _U('makebarrel_text'),
        Type  	= 27,
		action  = "barrel"
	},
	spring = {
		Pos 	= {x = 277.24, y = -1060.82, z = 28.52},
        Size  	= {x = 2.0, y = 2.0, z = 2.0},
        Color 	= {r = 136, g = 243, b = 216},
        Name  	= _U('makespring_label'),
		Text 	= _U('makespring_text'),
        Type  	= 27,
		action  = "spring"
	},
	lock = {
		Pos 	= {x = 277.24, y = -1055.82, z = 28.52},
        Size  	= {x = 2.0, y = 2.0, z = 2.0},
        Color 	= {r = 136, g = 243, b = 216},
        Name  	= _U('makelock_label'),
		Text 	= _U('makelock_text'),
        Type  	= 27,
		action  = "lock"
	}
}

Config.component_names = {"barrel","lock","spring"}

Config.weapons = { 
	ak47 	= { weapon_hash = 'weapon_assaultrifle', weapon_type = 'rifle', }, 
	sns 	= { weapon_hash = 'weapon_snspistol', 	 weapon_type = 'handgun',},
	smg 	= { weapon_hash = 'weapon_smg', 		 weapon_type = 'smg',},
	sniper 	= { weapon_hash = 'weapon_heavysniper',  weapon_type = 'sniper',},
}

Config.components = {
	barrel 	= {silver = 0, copper = 10, gold = 2},
	lock 	= {silver = 5, copper = 0,  gold = 0},
	spring 	= {silver = 0, copper = 10, gold = 0}
}