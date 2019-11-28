extends CanvasLayer

func load_game():
	
	#Load Settings
	
		#Load Language
	$Control/Label.text = langindex.SelectedLanguage['start_settings']
	
	#Load Settings
# warning-ignore:return_value_discarded
	var gs = load("res://Engine/Settings/GameSettings.tres")
	gs.load_settings()
	Main.showfps = gs.showfps
	Main.autosave = gs.autosave
	
	Main.load_game()
	
	
	$Timer.start()
	yield($Timer, "timeout")
	
	
	
	
	
	
	
	
	
	
	#Fertig
	$Control/Label.text = langindex.SelectedLanguage['start_fertig']
	$Timer.start()
	yield($Timer, "timeout")
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://GUI/Menus/MainMenu.tscn")