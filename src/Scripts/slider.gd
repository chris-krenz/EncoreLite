extends VSlider

onready var wheel1 : AnimatedSprite = get_node("/root/Machine/Machine/Wheel1")
onready var wheel2 : AnimatedSprite = get_node("/root/Machine/Machine/Wheel2")
onready var wheel3 : AnimatedSprite = get_node("/root/Machine/Machine/Wheel3")
onready var spinsleft : RichTextLabel = get_node("/root/Machine/Spins")

func _process(_delta):
	if (spinsleft.spins > 0 \
	and wheel1.ready == true and wheel1.playing == false \
	and wheel2.ready == true and wheel2.playing == false \
	and wheel3.ready == true and wheel3.playing == false):
		editable = true
	else:
		editable = false
