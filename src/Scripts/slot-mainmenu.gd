extends Button

#Press button to return to menu in slot machine scene
func _on_slotmainmenu_pressed():
	$ButtonSound.play()
	get_tree().change_scene("res://Slot_Title_Menu.tscn") # Warning: Return unused: OK
