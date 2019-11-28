extends CanvasLayer

func _on_Retry_pressed():
	Main.save()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://GUI/Menus/MainMenu.tscn")
	Player.isdead = false


func _on_MM_pressed():
	
	# warning-ignore:return_value_discarded
	get_tree().change_scene(Player.level)
