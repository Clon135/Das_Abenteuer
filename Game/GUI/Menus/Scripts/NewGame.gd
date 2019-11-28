extends "res://GUI/Menus/Scripts/BaseMenu.gd"

var klasse = "elf"
var gender = "male"

func _ready():
	
	$title.text = langindex.SelectedLanguage["newgame"]
	$Optionbuttons/Charakter/Elf/elf.text = langindex.SelectedLanguage["elf"]
	$Optionbuttons/Charakter/Ritter/ritter.text = langindex.SelectedLanguage["ritter"]
	$Optionbuttons/Charakter/Magier/magier.text = langindex.SelectedLanguage["magier"]
	$Optionbuttons/Gender/gender.text = langindex.SelectedLanguage["Gender"]
	$Optionbuttons/Gender/Male/male.text = langindex.SelectedLanguage["male"]
	$Optionbuttons/Gender/Female/female.text = langindex.SelectedLanguage["female"]

func _on_beginn_pressed():
	Player.klasse = klasse
	Player.gender = gender
	Main.save()
	
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Maps/SelectionMap.tscn")

# warning-ignore:unused_argument
func _on_Elf_toggled(button_pressed):
	
	if klasse == "elf":
		$Optionbuttons/Charakter/Elf.pressed = true
	
	$Optionbuttons/Charakter/Ritter.pressed = false
	$Optionbuttons/Charakter/Magier.pressed = false
	
	klasse = "elf"

# warning-ignore:unused_argument
func _on_Ritter_toggled(button_pressed):
	
	if klasse == "ritter":
		$Optionbuttons/Charakter/Ritter.pressed = true
	
	$Optionbuttons/Charakter/Elf.pressed = false
	$Optionbuttons/Charakter/Magier.pressed = false
	
	klasse = "ritter"

# warning-ignore:unused_argument
func _on_Magier_toggled(button_pressed):
	
	if klasse == "magier":
		$Optionbuttons/Charakter/Magier.pressed = true
	
	$Optionbuttons/Charakter/Elf.pressed = false
	$Optionbuttons/Charakter/Ritter.pressed = false
	
	klasse = "magier"

# warning-ignore:unused_argument
func _on_Male_toggled(button_pressed):
	
	if gender == "male":
		
		$Optionbuttons/Gender/Male.pressed = true
	
	$Optionbuttons/Gender/Female.pressed = false
	
	gender = "male"

# warning-ignore:unused_argument
func _on_Female_toggled(button_pressed):
	
	if gender == "female":
		
		$Optionbuttons/Gender/Female.pressed = true
	
	$Optionbuttons/Gender/Male.pressed = false
	
	gender = "female"

func _on_TextureButton_pressed():
	
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://GUI/Menus/MainMenu.tscn")
