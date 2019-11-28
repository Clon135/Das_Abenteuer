extends Area2D

var collected = false

func _on_Heart_body_entered(body):
	
	if body.name == "Player":
		if not collected:
			if Player.health != Player.max_health:
				collected = true
				body.heal(1)
				$AnimationPlayer.play("collected")
				yield($AnimationPlayer, "animation_finished")
				queue_free()
