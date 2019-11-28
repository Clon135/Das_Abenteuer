extends Area2D

const SPEED = 200
var velocity = Vector2()
var direction = 1
var damage = 0

func _ready():
	
	$Timer.start()

func _physics_process(delta):
	
	velocity.x = SPEED * delta * direction
	translate(velocity)
	

func _on_Timer_timeout():
	
	queue_free()

func set_plasmaball_stats(dir, dmg):
	direction = dir
	if dir == -1:
		$Sprite.flip_h = true
	damage = dmg

func _on_PlasmaBall_body_entered(body):
	
	if body.name != "Player":
		if "Demon" in body.name:
			body.take_damage(damage)
			queue_free()
		else:
			queue_free()

