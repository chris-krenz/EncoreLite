extends Button


func _on_Button_pressed():
	disabled = true


func _on_CoinReturn_animation_finished():
	disabled = false
