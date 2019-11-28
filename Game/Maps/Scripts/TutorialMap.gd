extends "res://Maps/Scripts/BaseMap.gd"

var checkpoint1 = "cp1"
var checkpoint2 = "cp2"

func _ready():
	
	if Player.checkpoint == null or Player.checkpoint == "":
		$Player/Player.load_player("ritter", "male")
	elif Player.checkpoint == checkpoint1:
		$Player/Player.position = Vector2(832, 8)
		$Player/Player.load_player("magier", "female")
	elif Player.checkpoint == checkpoint2:
		$Player/Player.position = Vector2(1040, 8)
		$Player/Player.load_player("elf", "male")

func _on_Magier_body_entered(body):
	
	if body.name == "Player":
		
		$Player/Player.load_player("magier", "female")
		Player.checkpoint = checkpoint1

func _on_Elf_body_entered(body):
	
	if body.name == "Player":
		
		$Player/Player.load_player("elf", "male")
		Player.checkpoint = checkpoint2


func _on_NextLevel_body_entered(body):
	
	if body.name == "Player":
# warning-ignore:return_value_discarded
		get_tree().change_scene(nextlevel)
