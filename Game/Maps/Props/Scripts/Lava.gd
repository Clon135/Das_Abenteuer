extends Area2D

var body = null

func _on_Lava_body_entered(_body):
	
	if _body.name == "Player":
		
		body = _body
		
		$Timer.start()

func _on_Lava_body_exited(_body):
	
	if _body.name == "Player":
		
		body = null

func _on_Timer_timeout():
	
	if body:
		
		body.take_damage(1)
		$Timer.start()
