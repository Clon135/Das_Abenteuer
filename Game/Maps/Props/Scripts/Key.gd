extends Node2D

signal collected

func _on_Area2D_body_entered(body):
	
	if body.name == "Player":
		
		Game.level001_obj = true
		$AnimationPlayer.play("collected")
		yield($AnimationPlayer, "animation_finished")
		emit_signal("collected")
		queue_free()
