extends CanvasLayer

#Defining fading function and load new scene

signal transitioned

signal load_new

func _transition():
	$AnimationPlayer.play("fade_to_black")
#	print("Fading to black")
	
func _load():
	$AnimationPlayer.play("Fade_to_next")
#	print("going to next")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_to_black":
#		print("Test")
		emit_signal("transitioned")
	if anim_name == "Fade_to_next":
		emit_signal("load_new")
#		print("Done")
	
