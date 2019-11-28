extends "res://GUI/Menus/Scripts/BaseMenu.gd"

# warning-ignore:unused_argument
func _input(event):
	
	if Input.is_action_just_pressed("ui_cancel"):
		_on_TextureButton_pressed()

func _ready():
	
	$title.text = langindex.SelectedLanguage["credits"]

func _on_RichTextLabel_meta_clicked(meta):
# warning-ignore:return_value_discarded
	OS.shell_open(meta)

func _on_TextureButton_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://GUI/Menus/MainMenu.tscn")
