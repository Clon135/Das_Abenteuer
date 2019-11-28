extends StaticBody2D

var isaktiv = false
var isopend = false

signal closed

# warning-ignore:unused_argument
func _physics_process(delta):
	
	if isaktiv:
		if Input.is_action_just_pressed("ui_interact"):
			if not isopend:
				$AnimationPlayer.play("Opend")
				isopend = true
				yield($AnimationPlayer, "animation_finished")
				Player.isdead = true
		if Input.is_action_just_pressed("ui_cancel"):
			if isopend:
				$AnimationPlayer.play("Close")
				Player.isdead = false
				isopend = false

func _on_Area2D_body_entered(body):
	
	if body.name == "Player":
		
		$Label.show()
		isaktiv = true

func _on_Area2D_body_exited(body):
	
	if body.name == "Player":
		$Label.hide()
		isaktiv = false

func closed():
	emit_signal("closed")
	$AnimationPlayer.play("Close")