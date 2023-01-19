extends CheckButton

func _on_CheckButton_toggled(button_pressed):
	if(!button_pressed):
		$BackGroundMusic.stop()
	else:
		$BackGroundMusic.play()
