extends CanvasLayer

# warning-ignore:unused_argument
func _process(delta):
	
	if Main.showfps == false:
		queue_free()
	
	$Control/Label.text = str("FPS: ", Engine.get_frames_per_second())
	

