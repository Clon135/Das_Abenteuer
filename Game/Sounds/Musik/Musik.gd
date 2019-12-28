extends AudioStreamPlayer

var gamesettings = load("res://Engine/Settings/GameSettings.tres")

# warning-ignore:unused_argument
func _process(delta):
	
	volume_db = gamesettings.musik