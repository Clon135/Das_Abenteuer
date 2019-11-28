extends Control

var lang = "English"
var languagefile = "res://language.save"

func _ready():
	
	lang = "German"
	load_game()
	
	#var f = File.new()
	#if f.file_exists(languagefile):
	#	f.open(languagefile, File.READ)
	#	lang = f.get_var()
	#	f.close()
	
	if lang == "German":
		$Startmenu/Language/Eng/Eng.pressed = false
		$Startmenu/Language/Ger/Ger.pressed = true
		
		$Startmenu/Language/Label.text = str("Sprache")
		$Startmenu/Language/Eng.text = str("Englisch")
		$Startmenu/Language/Ger.text = str("Deutsch")
		$Startmenu/aktion.text = str("Druecke Eine Taste")
	
	elif lang == "English":
		$Startmenu/Language/Eng/Eng.pressed = true
		$Startmenu/Language/Ger/Ger.pressed = false
		
		$Startmenu/Language/Label.text = str("Language")
		$Startmenu/Language/Eng.text = str("English")
		$Startmenu/Language/Ger.text = str("German")
		$Startmenu/aktion.text = str("Press A Button")
	
	randomize()
	

func _input(event):
	
	if event is InputEventKey:
		
		load_game()

func load_game():
	
	$anim.play("load")
	yield($anim, "animation_finished")
	
	var f = File.new()
	f.open(languagefile, File.WRITE)
	f.store_var(lang)
	f.close()
	
	langindex.SelectedLanguage = langindex.Language[str(lang)]
	$Load.load_game()
	

func _on_Eng_pressed():
	
	$Startmenu/Language/Eng/Eng.pressed = true
	$Startmenu/Language/Ger/Ger.pressed = false
	
	lang = "English"
	
	$Startmenu/Language/Label.text = str("Language")
	$Startmenu/Language/Eng.text = str("English")
	$Startmenu/Language/Ger.text = str("German")
	$Startmenu/aktion.text = str("Press A Button")

func _on_Ger_pressed():
	
	$Startmenu/Language/Eng/Eng.pressed = false
	$Startmenu/Language/Ger/Ger.pressed = true
	
	lang = "German"
	
	$Startmenu/Language/Label.text = str("Sprache")
	$Startmenu/Language/Eng.text = str("Englisch")
	$Startmenu/Language/Ger.text = str("Deutsch")
	$Startmenu/aktion.text = str("Druecke Eine Taste")