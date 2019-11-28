extends "res://Maps/Scripts/BaseMap.gd"

var current_dialog = 0
# warning-ignore:unused_class_variable
var current_speaker = "k"

var dialog = [
"Ja geschafft…und jetzt machen wir die Schatztruhe auf.",
"WAAAAASSSSS???!!!",
"Mist…..na dann nichts wie los !!!",
"Du hast recht…los geht’s!"
]

var overlapped = false

func _ready():
	
	time_start = OS.get_unix_time()
	set_process(true)
	
	if Game.level002_obj != true:
		$Player/Player/PlayerHUD/PlayerStats.new_objektiv("Finde Die Truhe")
	else:
		$Player/Player/PlayerHUD/PlayerStats.new_objektiv("Beende Das Level!")
	
	$Props/Dialog/Control.hide()

# warning-ignore:unused_argument
func _input(event):
	
	if overlapped == true:
		if Input.is_action_just_pressed("ui_accept"):
			new_dialog()

func _on_NextLevel_body_entered(body):
	
	if body.name == "Player" && Game.level002_obj == true:
		
		Player.lastlevel = "level3"
		Game.level002 = true
		Main.save()
		add_time()
# warning-ignore:return_value_discarded
		get_tree().change_scene(nextlevel)


func new_dialog():
	
	if current_dialog == 0:
		$Props/Dialog/Control.show()
		$Props/Dialog/Control/Panel/NPC1.hide()
		if current_dialog <= 3:
			$Props/Dialog/Control/Panel/Player/DialogPlayer.text = str(dialog[current_dialog])
		current_dialog += 1
	else:
		if current_dialog == 1:
			$Props/Chest/AnimationPlayer.play("Opend")
			yield($Props/Chest/AnimationPlayer, "animation_finished")
			if current_dialog <= 3:
				$Props/Dialog/Control/Panel/Player/DialogPlayer.text = str(dialog[current_dialog])
			current_dialog += 1
		else:
			if current_dialog == 2:
				$Props/Dialog/Control/Panel/NPC1.show()
				$Props/Dialog/Control/Panel/Player.hide()
				if current_dialog <= 4:
					$Props/Dialog/Control/Panel/NPC1/DialogNPC.text = str(dialog[current_dialog])
				current_dialog += 1
			else:
				if current_dialog == 3:
					$Props/Dialog/Control/Panel/NPC1.hide()
					$Props/Dialog/Control/Panel/Player.show()
					if current_dialog <= 3:
						$Props/Dialog/Control/Panel/Player/DialogPlayer.text = str(dialog[current_dialog])
					current_dialog += 1
				else:
					if current_dialog == 4:
						$Props/Chest/AnimationPlayer.play("Close")
						yield($Props/Chest/AnimationPlayer, "animation_finished")
						$Props/Dialog/Control.hide()
						Player.isdead = false
						current_dialog += 1
						Game.level002_obj = true
						$Player/Player/PlayerHUD/PlayerStats.new_objektiv("Beende Das Level!")
					else:
						$Props/Chest/AnimationPlayer.play("Close")
						yield($Props/Chest/AnimationPlayer, "animation_finished")
						Player.isdead = false
						overlapped = false
						$Props/Dialog/Control.hide()
						Game.level002_obj = true
						$Player/Player/PlayerHUD/PlayerStats.new_objektiv("Beende Das Level!")

func _on_Area2D_body_entered(body):
	
	if body.name == "Player":
		new_dialog()
		Player.isdead = true
		overlapped = true

func _on_Chest_closed():
	overlapped = false

func add_time():
	time_now = OS.get_unix_time()
	Game.total_time += time_now - time_start
	print("Minuten: ", Game.total_time / 60, "Sekunden: ", Game.total_time % 60)

func _on_Player_isdead():
	add_time()

