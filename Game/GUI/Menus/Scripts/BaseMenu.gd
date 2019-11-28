extends Control

func _ready():
	
	if Main.showfps == true:
			var fpscounter = load("res://Engine/Settings/FPS.tscn")
			var fps = fpscounter.instance()
			$".".add_child(fps)
