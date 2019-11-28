extends Area2D




func _on_GoldCoin_body_entered(body):
	if body.name == "Player":
		$AnimationPlayer.play("Collected")
		yield($AnimationPlayer, "animation_finished")
		queue_free()
