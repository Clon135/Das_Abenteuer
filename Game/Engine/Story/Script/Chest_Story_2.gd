extends Node2D

var isopend = false

func open():
	if not isopend:
		$AnimationPlayer.play("Opend")
		isopend = true
		yield($AnimationPlayer, "animation_finished")
