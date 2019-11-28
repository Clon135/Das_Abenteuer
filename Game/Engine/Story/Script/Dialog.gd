extends CanvasLayer


func _ready():
	
	
	Player.loadplayer(Player.klasse, Player.gender)
	$Control/Panel/Player/Sprite.texture = load(Player.sprite)
	$Control/Panel/NPC1/Sprite.texture = load(Player.marvin)

