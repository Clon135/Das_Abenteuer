extends Control

func _ready():
	
	var f = File.new()
	if f.file_exists(Main.game_file):
		$Buttons/LoadGame.disabled = false
	
	if Main.showfps == true:
		var fpscounter = load("res://Engine/Settings/FPS.tscn")
		var fps = fpscounter.instance()
		$".".add_child(fps)
	
	$Label.text = langindex.SelectedLanguage["titel"]
	$Buttons/NewGame.text = langindex.SelectedLanguage["new_game"]
	$Buttons/LoadGame.text = langindex.SelectedLanguage["play"]
	$Buttons/Options.text = langindex.SelectedLanguage["options"]
	$Buttons/Credits.text = langindex.SelectedLanguage["credits"]
	$Buttons/Exit.text = langindex.SelectedLanguage["exit"]

func _on_Bottom_body_entered(body):
	
	if body.name == "Player":
		body.new_player_sprite()
		body.position.x = $Top/Position2D2.global_position.x
		body.position.y = $Top/Position2D2.global_position.y

func _on_Top_body_entered(body):
	
	if body.name == "Player":
		body.new_player_sprite()
		body.position.x = $Bottom/Position2D.global_position.x
		body.position.y = $Bottom/Position2D.global_position.y

func _on_Exit_pressed():
	
	get_tree().quit()


func _on_Options_pressed():
	
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://GUI/Menus/OptionMenu.tscn")

func _on_Credits_pressed():
	
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://GUI/Menus/Credits.tscn")


func _on_NewGame_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Maps/TutorialMap.tscn")
	Player.load_preset()

func _on_LoadGame_pressed():
	
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Maps/SelectionMap.tscn")
