extends Node

var sprite = "res://Player/Texturen/Player_F_Knight.png"

var speed = 130
var jump_height = -350

# warning-ignore:unused_class_variable
var playersprites = ["res://Player/Texturen/Player_M_Elf.png",
"res://Player/Texturen/Player_M_Knight.png",
"res://Player/Texturen/Player_M_Wizard.png",
"res://Player/Texturen/Player_F_Elf.png",
"res://Player/Texturen/Player_F_Knight.png",
"res://Player/Texturen/Player_F_Wizard.png"]

# warning-ignore:unused_class_variable
var playersounds = {
	"ritter" : {
		'walk' : "res://Sounds/FX/ritter/walk.wav",
		'attacke1' : "res://Sounds/FX/ritter/attacke1.wav",
		'attacke2' : "res://Sounds/FX/ritter/attacke2.wav",
		'attacke3' : "res://Sounds/FX/ritter/attacke3.wav",
		'hit1' : "res://Sounds/FX/ritter/hit1.wav",
		'hit2' : "res://Sounds/FX/ritter/hit2.wav",
		'hit3' : "res://Sounds/FX/ritter/hit3.wav",
		'died' : "res://Sounds/FX/ritter/died.wav"
	},
	"magier" : {
		'walk' : "res://Sounds/FX/magier/walk.wav",
		'attacke1' : "res://Sounds/FX/magier/attacke1.wav",
		'attacke2' : "res://Sounds/FX/magier/attacke2.wav",
		'attacke3' : "res://Sounds/FX/magier/attacke3.wav",
		'hit1' : "res://Sounds/FX/magier/hit1.wav",
		'hit2' : "res://Sounds/FX/magier/hit2.wav",
		'hit3' : "res://Sounds/FX/magier/hit3.wav",
		'died' : "res://Sounds/FX/magier/died.wav"
	},
	"elf" : {
		'walk' : "res://Sounds/FX/elf/walk.wav",
		'attacke1' : "res://Sounds/FX/elf/attacke1.wav",
		'attacke2' : "res://Sounds/FX/elf/attacke2.wav",
		'attacke3' : "res://Sounds/FX/elf/attacke3.wav",
		'hit1' : "res://Sounds/FX/elf/hit1.wav",
		'hit2' : "res://Sounds/FX/elf/hit2.wav",
		'hit3' : "res://Sounds/FX/elf/hit3.wav",
		'died' : "res://Sounds/FX/elf/died.wav"
	}
}

# warning-ignore:unused_class_variable
var aktivplayersounds = playersounds["ritter"]

# warning-ignore:unused_class_variable
var level = "res://Maps/TestMap.tscn"
# warning-ignore:unused_class_variable
var levelposition = Vector2()
# warning-ignore:unused_class_variable
var marvin = "res://Player/Texturen/Player_M_Knight.png"

# warning-ignore:unused_class_variable
var lastlevel = "level1"
# warning-ignore:unused_class_variable
var isdead = false
var max_health
var health

# warning-ignore:unused_class_variable
var klasse = "magier"
# warning-ignore:unused_class_variable
var gender = "male"

# warning-ignore:unused_class_variable
var checkpoint = ""

func load_preset():
	
	klasse = "magier"
	gender = "male"
	lastlevel = "level1"
	Game.level001 = false
	Game.level001_obj = false
	Game.level002 = false
	Game.level002_obj = false
	Game.level003 = false
	Game.level003_obj = false

func loadplayer(_klasse, _gender):
	
	if _gender == "male":
		if _klasse == "elf":
			sprite = "res://Player/Texturen/Player_M_Elf.png"
			max_health = 5
			health = max_health
			speed = 180
			jump_height = -360
			klasse = "elf"
			gender = "male"
			aktivplayersounds = playersounds["elf"]
		elif _klasse == "ritter":
			sprite = "res://Player/Texturen/Player_M_Knight.png"
			max_health = 8
			health = max_health
			speed = 90
			jump_height = -350
			klasse = "ritter"
			gender = "male"
			aktivplayersounds = playersounds["ritter"]
		elif _klasse == "magier":
			sprite = "res://Player/Texturen/Player_M_Wizard.png"
			max_health = 5
			health = max_health
			speed = 130
			jump_height = -350
			klasse = "magier"
			gender = "male"
			aktivplayersounds = playersounds["magier"]
	elif _gender == "female":
		if _klasse == "elf":
			sprite = "res://Player/Texturen/Player_F_Elf.png"
			max_health = 5
			health = max_health
			speed = 180
			jump_height = -360
			klasse = "elf"
			gender = "female"
			aktivplayersounds = playersounds["elf"]
		elif _klasse == "ritter":
			sprite = "res://Player/Texturen/Player_F_Knight.png"
			max_health = 8
			health = max_health
			speed = 90
			jump_height = -350
			klasse = "ritter"
			gender = "female"
			aktivplayersounds = playersounds["ritter"]
		elif _klasse == "magier":
			sprite = "res://Player/Texturen/Player_F_Wizard.png"
			max_health = 5
			health = max_health
			speed = 130
			jump_height = -350
			klasse = "magier"
			gender = "female"
			aktivplayersounds = playersounds["magier"]
	#print(_klasse, _gender, klasse, gender)