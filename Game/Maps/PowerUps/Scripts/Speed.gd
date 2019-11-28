extends Area2D

var collected = false

func _on_Speed_body_entered(body):
	
	if body.name == "Player":
		if not collected:
			collected = true
			body.speed += 30
			$Timer.start()
			$AnimationPlayer.play("collected")
			yield($Timer, "timeout")
			body.speed -= 30


