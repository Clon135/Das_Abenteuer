extends Node

var player = load("res://Sounds/Musik/Musik.tscn").instance()

func load_musik():
	
	self.add_child(player)
