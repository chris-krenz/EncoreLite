extends RichTextLabel

var string    = "[b][right]%s[/right][/b]"
var displayed = ""

onready var wallet : AnimatedSprite = get_node("/root/Machine/Wallet")
onready var coin   : Node2D         = get_node("/root/Machine/Node2D")

var current = 0


func _process(delta):
	if wallet.winnings > 9999999:
		displayed = "Overflow"
		current = wallet.winnings
	else:
		current = lerp(current, wallet.winnings, 25 * delta) as int
		if abs(wallet.winnings - current) <= 5:
			current = wallet.winnings
		displayed = string % current
	bbcode_text = displayed
