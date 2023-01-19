extends Control

#Set up credit menu and play background music
func _on_Credits_ready():
	$BackGroundMusic.play()
#Change scene when button is pressed
func _on_Button_pressed():
	$ButtonSound.play()	
	get_tree().change_scene("res://Slot_Title_Menu.tscn")
