extends "res://Maps/Scripts/BaseMap.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	time_start = OS.get_unix_time()
	set_process(true)
	
	if Game.level001_obj != true:
		
		$Player/Player/PlayerHUD/PlayerStats.new_objektiv("Finde denn Key")
	else:
		$Player/Player/PlayerHUD/PlayerStats.new_objektiv("Beende Das Level")



func _on_NextLevel_body_entered(body):
	
	if body.name == "Player":
		if Game.level001_obj == true:
			Player.lastlevel = "level2"
			Main.save()
			Game.level001 = true
			add_time()
# warning-ignore:return_value_discarded
			get_tree().change_scene(nextlevel)
			

func _on_objektiv_collected():
	$Player/Player/PlayerHUD/PlayerStats.new_objektiv("Beende Das Level")
