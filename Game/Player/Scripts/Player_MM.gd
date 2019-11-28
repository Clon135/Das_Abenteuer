extends KinematicBody2D

const FLOOR = Vector2(0 ,-1)

var speed = Player.speed
var velocity = Vector2()
var gravity = 20
var jump_height = Player.jump_height
var can_jump = true

func _ready():
	
	Player.loadplayer("elf", "male")
	
	$Sprite.texture = load(Player.playersprites[randi() % Player.playersprites.size()])

func new_player_sprite():
	$Sprite.texture = load(Player.playersprites[randi() % Player.playersprites.size()])

# warning-ignore:unused_argument
func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		$anim.play("walk")
		$Sprite.flip_h = false
		velocity.x = speed
	
	elif Input.is_action_pressed("ui_left"):
		$anim.play("walk")
		$Sprite.flip_h = true
		velocity.x = -speed
	
	else:
		if can_jump == true:
			$anim.play("idle")
		velocity.x = 0
	
	if Input.is_action_just_pressed("ui_up"):
		if can_jump == true:
			velocity.y = jump_height
			can_jump = false
	
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