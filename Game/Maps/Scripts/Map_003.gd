extends "res://Maps/Scripts/BaseMap.gd"

var current_dialog = 0
var dialog = [
"Guck mal…. Da ist schon wieder eine Schatztruhe!!!",
"Jaaa….hast du noch den Schlüssel?",
"Ja klar…hier",
"JAAAAAAAA!!!!!!! Wir haben den Schatz!!!!!",
"Das ist ja so viel Gold…..endlich haben wir die Monster besiegt!!!!!"
]

func _ready():
	
	Main.load_game()
	
	time_start = OS.get_unix_time()
	set_process(true)
	
	$Props/Dialog/Control.hide()
	
	if Game.level003_obj != true:
		$Player/Player/PlayerHUD/PlayerStats.new_objektiv("Finde Die Truhe")
	else:
		$Player/Player/PlayerHUD/PlayerStats.new_objektiv("Beende Das Level!")
# warning-ignore:unused_argument
func _input(event):
	if current_dialog >= 1:
		if Input.is_action_just_pressed("ui_accept"):
			new_dialog()

func new_dialog():
	
	if current_dialog == 0:
		$Props/Dialog/Control.show()
		$Props/Dialog/Control/Panel/NPC1.hide()
		$Props/Dialog/Control/Panel/Player/DialogPlayer.text = str(dialog[current_dialog])
		current_dialog += 1
		Player.isdead = true
	else:
		if current_dialog == 1:
			$Props/Dialog/Control/Panel/NPC1.show()
			$Props/Dialog/Control/Panel/Player.hide()
			$Props/Dialog/Control/Panel/NPC1/DialogNPC.text = str(dialog[current_dialog])
			current_dialog += 1
		else:
			if current_dialog == 2:
				$Props/Dialog/Control/Panel/NPC1.hide()
				$Props/Dialog/Control/Panel/Player.show()
				$Props/Dialog/Control/Panel/Player/DialogPlayer.text = str(dialog[current_dialog])
				current_dialog += 1
			else:
				if current_dialog == 3:
					$Chest.open()
					$Props/Dialog/Control/Panel/NPC1.show()
					$Props/Dialog/Control/Panel/Player.hide()
					$Props/Dialog/Control/Panel/NPC1/DialogNPC.text = str(dialog[current_dialog])
					yield($Chest/AnimationPlayer, "animation_finished")
					
					current_dialog += 1
				else:
					if current_dialog == 4:
						$Props/Dialog/Control/Panel/NPC1.hide()
						$Props/Dialog/Control/Panel/Player.show()
						$Props/Dialog/Control/Panel/Player/DialogPlayer.text = str(dialog[current_dialog])
						current_dialog += 1
						$Player/Player/PlayerHUD/PlayerStats.new_objektiv("Beende Das Level!")
						Game.level003_obj = true
					else:
						$Props/Dialog/Control.hide()
						Player.isdead = false
						$Player/Player/PlayerHUD/PlayerStats.new_objektiv("Beende Das Level!")
						Game.level003_obj = true

func _on_Area2D2_body_entered(body):
	if body.name == "Player":
		new_dialog()


func _on_NextLevel_body_entered(body):
	if body.name == "Player":
		Game.level003 = true
		add_time()
# warning-ignore:return_value_discarded
		get_tree().change_scene(nextlevel)

func add_time():
	time_now = OS.get_unix_time()
	Game.total_time += time_now - time_start
	#print("Minuten: ", Game.total_time / 60, "Sekunden: ", Game.total_time % 60)

func _on_Player_isdead():
	add_time()
