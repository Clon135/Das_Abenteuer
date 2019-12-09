extends Control

func _ready():
	
	if Game.total_time <= Game.highscore:
		Game.highscore = Game.total_time
	elif Game.highscore == 0:
		Game.highscore = Game.total_time
		Main.save()
	
	Player.loadplayer(Player.klasse, Player.gender)
	$Text/Label.text = str("M: ", Game.total_time / 60, " S: ", Game.total_time % 60)
	$Text/HS.text = str("Highscore M: ", Game.highscore / 60, " S: ", Game.highscore % 60)
	$other/Sprite.texture = load(Player.sprite)

func _on_RichTextLabel_meta_clicked(meta):
# warning-ignore:return_value_discarded
	OS.shell_open(meta)

# warning-ignore:unused_argument
func _input(event):
	
	if Input.is_action_just_pressed("ui_cancel"):
		
		$AnimationPlayer.play("close")