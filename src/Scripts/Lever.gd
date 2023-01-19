extends AnimatedSprite

# CONTROL FLOW: Wheels ready -> Lever/slider active -> Lever_pulled -> Wheels spin...
# 			 ...stop after rand duration -> emit signals to Wallet -> Calcs result

onready var slider : VSlider = get_node("slider")

var rng : RandomNumberGenerator = RandomNumberGenerator.new()

var dragging : bool = false   # TODO: remove?

signal pulled(rand_base)

var rand_base : int = 0

#Use a slider as lever
func _on_slider_drag_started():

	dragging = true
#	$Spinning.play()


func _on_slider_drag_ended(_value_changed):	# triggered when mouse button released
	if dragging == true:
		dragging = false
		if slider.value > 20:
			frame = (slider.value/10) as int + 50
			self.playing = true
			
	slider.value = 60


func _on_Lever_animation_finished():
	self.playing = false


func _on_slider_value_changed(value):
	if (dragging == true) and (value > 20):
		frame = 60 - value
	elif (dragging == true) and (value <= 20):
		self.playing = true
		dragging = false
		rng.seed  = hash("FooBar")
		rng.randomize()
		rand_base = rng.randi_range(0, 119)
		emit_signal("pulled", rand_base)	# Picked up by Wheel(s)
