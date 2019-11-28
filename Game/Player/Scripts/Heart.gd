extends Node2D

var aktiv = false

func add_heart():
	
	if not aktiv:
		aktiv = true
		$AnimationPlayer.play("add")
		yield($AnimationPlayer, "animation_finished")
		$AnimationPlayer.play("idle")

func sub_heart():
	
	if aktiv:
		aktiv = false
		$AnimationPlayer.play("sub")
