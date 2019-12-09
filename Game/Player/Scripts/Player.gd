extends KinematicBody2D

const FLOOR = Vector2(0 ,-1)

const PLASMABALL = preload("res://Player/PlasmaBall.tscn")

signal isdead

var speed = Player.speed
var velocity = Vector2()
var gravity = 20
var jump_height = Player.jump_height
var can_jump = true
var max_health = 5
var health = 0
var attackcooldown = false
var attack = 2
var look_dir = "right"
var klasse 
var gender

# warning-ignore:unused_argument
func _physics_process(delta):
	
	if Player.isdead == false:
		if Input.is_action_pressed("ui_right"):
			$anim.play("walk")
			look_dir = "right"
			$Sprite.flip_h = false
			velocity.x = speed
			$Position2D.position = Vector2(8.3 , 9.5)
		
		elif Input.is_action_pressed("ui_left"):
			$anim.play("walk")
			look_dir = "left"
			$Sprite.flip_h = true
			velocity.x = -speed
			$Position2D.position = Vector2(-8.3 , 9.5)
		
		else:
			if can_jump == true:
				$anim.play("idle")
			velocity.x = 0
		
		if Input.is_action_just_pressed("ui_up"):
			if can_jump == true:
				velocity.y = jump_height
				can_jump = false
		
		if Input.is_action_just_pressed("ui_attack"):
			
			if not attackcooldown:
				if klasse == "magier":
					var p = PLASMABALL.instance()
					get_parent().add_child(p)
					$AttackCooltime.start()
					attackcooldown = true
					p.position = $Position2D.global_position 
					p.set_plasmaball_stats(sign($Position2D.position.x), attack)
					#print($Position2D.position, p.position, sign($Position2D.position.x))
				if klasse == "ritter":
					if look_dir == "left":
						$attack.play("attack_l")
					else:
						$attack.play("attack_r")
		
		if is_on_floor():
			can_jump = true
		elif is_on_wall():
			can_jump = true
		else:
			can_jump = false
			if velocity.y < 0:
				$anim.play("jump")
			else:
				$anim.play("fall")
		
		
		velocity.y += gravity
		
		velocity = move_and_slide(velocity, FLOOR)
	#else:
		#$anim.play("idle")

func take_damage(amount):
	
	if not Player.isdead:
		health -= amount
		Player.health = health
		$PlayerHUD/PlayerStats.sub_live(health)
		if health <= 0:
			health = 0
			died()

func heal(amount):
	
	if health != max_health:
		health += amount
		Player.health = health
		$PlayerHUD/PlayerStats.add_live(health)

func died():
	if Player.isdead == false:
		
		$PlayerHUD/PlayerStats.sub_live(health)
		Player.isdead = true
		health = max_health
		$anim.play("died")
		yield($anim, "animation_finished")
		$PlayerHUD/PlayerStats/MediumHealth.visible = false
		$PlayerHUD/PlayerStats/HighHealth.visible = false
		$PlayerHUD/isdead/AnimationPlayer.play("init")
		emit_signal("isdead")

func _on_AttackCooltime_timeout():
	attackcooldown = false

func _on_Area2D_body_entered(body):
	
	if body.name != "Player":
		if "Demon" in body.name:
			body.take_damage(attack)

func load_player(_klasse, _gender):
	
	if klasse != _klasse:
		health = max_health
		
		Player.loadplayer(_klasse, _gender)
		
		health = Player.health
		max_health = Player.max_health
		speed = Player.speed
		jump_height = Player.jump_height
		
		$Sprite.texture = load(Player.sprite)
		
		$PlayerHUD/PlayerStats.load_in(_klasse, _gender)
		
		klasse = _klasse
		gender = _gender