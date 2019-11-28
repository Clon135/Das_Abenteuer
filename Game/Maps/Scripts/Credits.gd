extends Control

func _ready():
	$Text/Label.text = str("Minuten: ", Game.highscore / 60, "  Sekunden: ", Game.highscore % 60)

func _on_RichTextLabel_meta_clicked(meta):
# warning-ignore:return_value_discarded
	OS.shell_open(meta)

# warning-ignore:unused_argument
func _input(event):
	
	if Input.is_action_just_pressed("ui_cancel"):
		
		$AnimationPlayer.play("close")