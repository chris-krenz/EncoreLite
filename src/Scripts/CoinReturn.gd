extends AnimatedSprite

#Coin returned sound playing
func _on_Button_pressed():
	playing = true
	$CoinSound.play()

func _on_CoinReturn_animation_finished():
	playing = false
	$CoinSound.stop()
