extends Node2D

var time_start = 0
var time_now = 0

export var camera_limit_left = 100000
export var camera_limit_right = 100000
export var camera_limit_top = 100000
export var camera_limit_bottom = 100000

export(String) var path = "res://Maps/BaseMap.tscn"
export(String) var nextlevel = "res://Maps/SelectionMap.tscn"

func _ready():
	
	if path != "res://Maps/TutorialMap.tscn":
		
		$Player/Player.load_player(Player.klasse, Player.gender)
	
	if Player.level == path:
		if not Player.isdead:
			$Player/Player.global_position = Player.levelposition
		Player.isdead = false
	
	Player.level = path
	
	$Player/Player/Camera2D.limit_left = camera_limit_left
	$Player/Player/Camera2D.limit_right = camera_limit_right
	$Player/Player/Camera2D.limit_top = camera_limit_top
	$Player/Player/Camera2D.limit_bottom = camera_limit_bottom
	
	if Main.showfps == true:
		var fpscounter = load("res://Engine/Settings/FPS.tscn")
		var fps = fpscounter.instance()
		$Player.add_child(fps)

# warning-ignore:unused_argument
func _process(delta):
	
	Player.levelposition = $Player/Player.global_position

func _on_NextLevel_body_entered(body):
	
	if body.name == "Player":
# warning-ignore:return_value_discarded
		get_tree().change_scene(nextlevel)


func _on_DeathZone_body_entered(body):
	
	print(body.name)
	
	if body.name == "Player":
		body.died()

func _on_Pausenmenu_closed():
	
	if Player.klasse == "elf" || Player.klasse == "magier":
		$Player/Player/PlayerHUD/PlayerStats/MediumHealth.show()
	else:
		$Player/Player/PlayerHUD/PlayerStats/HighHealth.show()
	
	$Player/Player/PlayerHUD/PlayerStats/Objektiv.show()

func _on_Pausenmenu_opend():
	
	$Player/Player/PlayerHUD/PlayerStats/HighHealth.hide()
	$Player/Player/PlayerHUD/PlayerStats/MediumHealth.hide()
	$Player/Player/PlayerHUD/PlayerStats/Objektiv.hide()

func add_time():
	time_now = OS.get_unix_time()
	Game.total_time += time_now - time_start
	print("Minuten: ", Game.total_time / 60, "Sekunden: ", Game.total_time % 60)

func _on_Player_isdead():
	add_time()
