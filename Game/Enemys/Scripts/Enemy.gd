extends KinematicBody2D

# warning-ignore:unused_class_variable
export (int) var leben = 2
export (int) var damage = 1
export (int) var speed = 20

var direction = 1
var velocity = Vector2()
var body = null
var oncooldown = false
var isdead = false

const FLOOR = Vector2(0, -1)

# warning-ignore:unused_argument
func _physics_process(delta):
	
	if not isdead:
		if body == null:
			
			velocity.x = speed * direction
			$AnimationPlayer.play("walk")
			
			if is_on_wall():
				direction = direction * -1
				$RayCast2D.position.x *= -1
				$Attackarea/CollisionShape2D.position.x *= -1
				if $Sprite.flip_h == true:
					$Sprite.flip_h = false
				else:
					$Sprite.flip_h = true
			
			if $RayCast2D.is_colliding() == false:
				direction = direction * -1
				$RayCast2D.position.x *= -1
				$Attackarea/CollisionShape2D.position.x *= -1
				if $Sprite.flip_h == true:
					$Sprite.flip_h = false
				else:
					$Sprite.flip_h = true
			
			velocity.x = speed * direction
			
		else:
			if not oncooldown:
				$AnimationPlayer.play("attack")
		
		velocity = move_and_slide(velocity, FLOOR)
		velocity.y += 10

func attack():
	
	if body != null:
		body.take_damage(damage)
		$attack_cooldown.start()
		oncooldown = true
		yield($attack_cooldown, "timeout")
		oncooldown = false
		if body != null:
			$AnimationPlayer.play("attack")
			$attack.play()

func take_damage(amount):
	leben -= amount
	if leben <= 0:
		died()
	else:
		$hit.play()

func died():
	isdead = true
	$AnimationPlayer.play("died")
	yield($AnimationPlayer, "animation_finished")
	queue_free()

func _on_Attackarea_body_exited(_body):
	
	if _body.name == "Player":
		body = null

func _on_Attackarea_body_entered(_body):
	
	if _body.name == "Player":
		body = _body

