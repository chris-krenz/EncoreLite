extends AnimatedSprite

# ICON LOOKUP TABLE
# 0: Diamond
# 1: Clover
# 2: Question
# 3: Bar
# 4: Banana
# 5: Watermelon
# 6: Grapes
# 7: Lemon
# 8: Peach
# 9: Cherry

var dict      : Dictionary = \
{ \
	0: [20000, 25000], \
	1: [16000, 19000], \
	2: [13000, 16000], \
	3: [10000, 13000], \
	4: [ 7500, 10000], \
	5: [ 4500,  6000], \
	6: [ 1500,  3000], \
	7: [ 6000,  7500], \
	8: [ 3000,  4500], \
	9: [ 1000,  1500]
}

var icon1     : int = 0
var icon2     : int = 0
var icon3     : int = 0
var match1_2  : int = 0
var match2_3  : int = 0
var match3_1  : int = 0
var matches   : int = 0
var free_spin : int = 0
var multiply  : int = 0
var winnings  : int = 0		# Also set in WalletAmount...
var total     : int = 0

#var CoinWin : bool = false #For lever to stop the coin gained sound

onready var coin : Node2D = get_node("/root/Machine/Node2D")

signal freespins(number)


func _ready():
	total = 0


func _process(_delta):
	winnings = total - (1000*((coin.selected == true) as int))
	frame = winnings / 1000		# Warning: Int div precision loss: OK


func _on_Wheel1_left_icon(left_icon):
	icon1 = left_icon


func _on_Wheel2_middle_icon(middle_icon):
	icon2 = middle_icon


func _on_Wheel3_right_icon(right_icon):
	icon3 = right_icon
	_identify_result(icon1, icon2, icon3)


func _identify_result(icon1, icon2, icon3):		# Warning: Shadow-named: OK
	match1_2  = 0
	match2_3  = 0
	match3_1  = 0
	matches   = 0
	free_spin = 0
	multiply  = 0

	# Cherry check
	if (icon1 == 9):
		free_spin += 1
	if (icon2 == 9):
		free_spin += 1
	if (icon3 == 9):
		free_spin += 1
	emit_signal("freespins", free_spin)

	# Prep for dict lookup (all unique combinations)
	if (icon1 == icon2):
		match1_2 = 1
	if (icon2 == icon3):
		match2_3 = 2
	if (icon3 == icon1):
		match3_1 = 4
	matches = match1_2 + match2_3 + match3_1

	# Clover check
	if matches > 0:
		if (icon1 == 1 or icon2 == 1 or icon3 == 1):
			multiply = 1
			total *= 2
			$CoinGained.play()

	if matches == 0:
		pass
	elif matches < 3:
		total += dict[icon2][0]
		$CoinGained.play()
		#CoinWin = true
	elif matches == 4:
		total += dict[icon3][0]
		$CoinGained.play()
		#CoinWin = true
	else:
		total += dict[icon3][1]
		$CoinGained.play()
		#CoinWin = true


func _on_Spins_returned():
	total += 1000
