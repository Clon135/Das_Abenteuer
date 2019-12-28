extends CanvasLayer

var paused = Main.inpausemenu

signal opend
signal closed

# warning-ignore:unused_argument
func _input(event):
	
	if Player.isdead == false:
		Main.inoptions = false
		
		if Input.is_action_just_pressed("ui_cancel"):
			if not paused:
				PauseEntered()
				
			else:
				PauseExited()
				

func _ready():
	
	$Control/VBoxContainer/Play.text = langindex.SelectedLanguage["play"]
	$Control/VBoxContainer/Options.text = langindex.SelectedLanguage["options"]
	$Control/VBoxContainer/Save.text = langindex.SelectedLanguage["save"]
	$Control/VBoxContainer/Quit.text = langindex.SelectedLanguage["exit"]
	
	if Player.level == "res://Maps/TutorialMap.tscn":
		$Control/VBoxContainer/Save.disabled = true
	"res://Maps/TutorialMap.tscn"
	if Main.inoptions:
		offset.x = 0
		$AnimationPlayer.play("inpaused")
		get_tree().paused = true
		paused = true
	else:
		offset.x = 500
		$AnimationPlayer.play("Beginn")
		get_tree().paused = false
		paused = false

func PauseEntered():
	emit_signal("opend")
	offset.x = 0
	$AnimationPlayer.play("Entered")
	get_tree().paused = true
	Main.inpausemenu = true
	paused = Main.inpausemenu

func PauseExited():
	emit_signal("closed")
	$AnimationPlayer.play("Exited")
	get_tree().paused = false
	yield($AnimationPlayer, "animation_finished")
	offset.x = 500
	Main.inpausemenu = false
	paused = Main.inpausemenu

func _on_Options_pressed():
	
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://GUI/Menus/OptionMenu.tscn")

func _on_Play_pressed():
	
	PauseExited()

func _on_Save_pressed():
	
	if Player.level != "res://Maps/TutorialMap.tscn":
		Main.save()

func _on_Quit_pressed():
	if Player.level != "res://Maps/TutorialMap.tscn":
		Main.save()
	get_tree().quit()
