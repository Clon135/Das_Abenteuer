extends "res://GUI/Menus/Scripts/BaseMenu.gd"

var gamesettings = load("res://Engine/Settings/GameSettings.tres")

# warning-ignore:unused_argument
func _input(event):
	
	Main.inoptions = true
	
	if Input.is_action_just_pressed("ui_cancel"):
		_on_TextureButton_pressed()

func _ready():
	
	$title.text = langindex.SelectedLanguage["option"]
	
	$Optionbuttons/Musik/Label2.text = langindex.SelectedLanguage["music"]
	$Optionbuttons/effekte/Label2.text = langindex.SelectedLanguage["effekts"]
	
	$Optionbuttons/Showfps/Label3.text = langindex.SelectedLanguage["showfps"]
	$Optionbuttons/Fullscreen/Label3.text = langindex.SelectedLanguage["fullscreen"]
	$Optionbuttons/Borderless/Label3.text = langindex.SelectedLanguage['borderless']
	$Optionbuttons/Vsync/Label3.text = langindex.SelectedLanguage["vsync"]
	$Optionbuttons/autosave/Label3.text = langindex.SelectedLanguage["autosave"]
	
	gamesettings.load_settings()
	$Optionbuttons/Musik.value = gamesettings.musik
	$Optionbuttons/effekte.value = gamesettings.effekts
	
	$Optionbuttons/Showfps.pressed = gamesettings.showfps
	$Optionbuttons/Fullscreen.pressed = gamesettings.fullscreen
	$Optionbuttons/Borderless.pressed = gamesettings.borderless
	$Optionbuttons/Vsync.pressed = gamesettings.vsync
	$Optionbuttons/autosave.pressed = gamesettings.autosave

func _on_TextureButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://GUI/Menus/MainMenu.tscn")
	gamesettings.save_settings()
	
	if Main.inpausemenu == true:
# warning-ignore:return_value_discarded
		get_tree().change_scene(Player.level)
	else:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://GUI/Menus/MainMenu.tscn")

func _on_Musik_value_changed(value):
	gamesettings.musik = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Musik"), gamesettings.musik)

func _on_effekte_value_changed(value):
	gamesettings.effekts = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Effekte"), gamesettings.effekts)

func _on_Showfps_toggled(button_pressed):
	gamesettings.showfps = button_pressed
	Main.showfps = button_pressed
	
	if Main.showfps == true:
		var fpscounter = load("res://Engine/Settings/FPS.tscn")
		var fps = fpscounter.instance()
		$".".add_child(fps)

func _on_Fullscreen_toggled(button_pressed):
	gamesettings.fullscreen = button_pressed
	OS.set_window_fullscreen(button_pressed)

func _on_Borderless_toggled(button_pressed):
	gamesettings.borderless = button_pressed
	OS.set_borderless_window(button_pressed)

func _on_Vsync_toggled(button_pressed):
	gamesettings.vsync = button_pressed
	OS.set_use_vsync(button_pressed)

func _on_autosave_toggled(button_pressed):
	Main.autosave = button_pressed
	gamesettings.autosave = button_pressed
