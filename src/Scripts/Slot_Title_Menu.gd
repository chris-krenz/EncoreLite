extends Control

var scene_path_to_load


func _ready(): #Set up the menu
	for button in $Container.get_children():
		button.connect("pressed", self, "_on_button_pressed", [button.scene_to_load])
	$BackGroundMusic.play()


func _on_button_pressed(scene_to_load): #Select target scenes and fade black
	scene_path_to_load = scene_to_load
	$ButtonMusic.play()
	$FadeIn.show()
	$FadeIn._transition()


func _on_FadeIn_transitioned(): #Change scenes
	get_tree().change_scene(scene_path_to_load)	# Warning: Returns unused val: OK
