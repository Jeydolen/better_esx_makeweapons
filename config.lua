Config = {}

Config.chance = 50

Config.waiting_time = 5000

Config.Zones = {
	make_weapons = {
		Pos = {x = 287.24, y = -1065.82, z = 28.52},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Créer des armes",
		Text = "Appuyez sur ~INPUT_CONTEXT~ pour fabriquer une arme",
        Type  = 27,
		menu_label = "make_weapons"
	},
	barrel = {
		Pos = {x = 277.24, y = -1065.82, z = 28.52},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Création du canon",
		Text = "Appuyez sur ~INPUT_CONTEXT~ pour fabriquer un canon",
        Type  = 27,
		menu_label = "barrel_craft"
	},
	spring = {
		Pos = {x = 277.24, y = -1060.82, z = 28.52},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Création du ressort",
		Text = "Appuyez sur ~INPUT_CONTEXT~ pour fabriquer un ressort",
        Type  = 27,
		menu_label = "spring_craft"
	},
	lock = {
		Pos = {x = 277.24, y = -1055.82, z = 28.52},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Créer une gachette",
		Text = "Appuyez sur ~INPUT_CONTEXT~ pour fabriquer une gachette",
        Type  = 27,
		menu_label = "lock_craft"
	}
}

Config.component_names = {"barrel","lock","spring"}

Config.weapons = { 
	ak47 	= { weapon_hash = 'weapon_assaultrifle', 	luck = 1 }, 
	sns 	= { weapon_hash = 'weapon_snspistol', 		luck = 2 },
	smg 	= { weapon_hash = 'weapon_smg', 			luck = 3 },
	sniper 	= { weapon_hash = 'weapon_heavysniper', 	luck = 4 },
}