extends "res://Maps/Scripts/BaseMap.gd"

var dialog_lvl1 = [
"Puh….das war knapp…fast hätten uns die Monster in Gefangenschaft genommen",
"Ja auf jeden Fall !!!",
"Lass mal den Schlüssel suchen, da soll es so eine Kiste geben in der richtig viel Gold drin ist.",
"Ja…du hast Recht aber wir müssen aufpassen hier sind noch viele Monster die uns suchen!!!",
"Also Marvin…. nehmen wir es auf uns!"
]

var dialog_lvl2 = [
"jetzt mussen wir nur noch die truhe dafur finden. Viel gluck"
]

var level
var current_dialog = 0
var current_speaker = "k"

func _ready():
	
	Main.save()
	
	level = Player.lastlevel
	current_dialog = 0
	
	new_dialog()
	
	if Player.klasse == "ritter":
		
		$NPC/NPC1/Dialog/Control/Panel/NPC1/Sprite.texture = load("res://Player/Texturen/Player_M_Elf.png")

# warning-ignore:unused_argument
func _input(event):
	
	if Input.is_action_just_pressed("ui_accept"):
		new_dialog()

func new_dialog():
	
	if level == "level1":
		if current_dialog != 5:
			if current_speaker == "k":
				$NPC/NPC1/Dialog/Control/Panel/Player/DialogPlayer.text = str(dialog_lvl1[current_dialog])
				$NPC/NPC1/Dialog/Control/Panel/Player.show()
				$NPC/NPC1/Dialog/Control/Panel/NPC1.hide()
				current_dialog += 1
				current_speaker = "m"
				Player.isdead = true
			elif current_speaker == "m":
				$NPC/NPC1/Dialog/Control/Panel/NPC1/DialogNPC.text = str(dialog_lvl1[current_dialog])
				$NPC/NPC1/Dialog/Control/Panel/Player.hide()
				$NPC/NPC1/Dialog/Control/Panel/NPC1.show()
				current_dialog += 1
				current_speaker = "k"
		else:
			$NPC/NPC1/Dialog/Control.hide()
			nextlevel = "res://Maps/Map_001.tscn"
			Player.isdead = false
	elif level == "level2":
		if current_dialog != 1:
			if current_speaker == "k":
				$NPC/NPC1/Dialog/Control/Panel/Player/DialogPlayer.text = str(dialog_lvl2[current_dialog])
				$NPC/NPC1/Dialog/Control/Panel/Player.show()
				$NPC/NPC1/Dialog/Control/Panel/NPC1.hide()
				current_dialog += 1
				current_speaker = "m"
				Player.isdead = true
		else:
			$NPC/NPC1/Dialog/Control.hide()
			nextlevel = "res://Maps/Map_002.tscn"
			Player.isdead = false
	elif level == "level3":
		$NPC/NPC1/Dialog/Control.hide()
		nextlevel = "res://Maps/Map_003.tscn"


func _on_NextLevel_body_entered(body):
	
	if body.name == "Player":
# warning-ignore:return_value_discarded
		get_tree().change_scene(nextlevel)
