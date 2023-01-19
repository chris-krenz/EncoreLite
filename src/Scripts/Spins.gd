extends RichTextLabel

var spins : int
var string = "[b][color=black][center]%s[/center][/color][/b]"
var actual = ""

signal returned()


func _ready():
	spins = 5
	actual = string % 5
	bbcode_text = actual


func _process(_delta):
	if spins <= 0:
		spins = 0
		actual = "[b][color=red][center]NONE![/center][/color][/b]"
		bbcode_text = actual


func _on_Lever_pulled(_rand_base):
	if spins > 0:
		spins -= 1
		actual = string % spins
	bbcode_text = actual


func _on_Wallet_freespins(number):
	spins += number
	actual = string % spins
	bbcode_text = actual


func _on_CoinReturn_animation_finished():
	if spins > 0:
		spins -= 1
		actual = string % spins
		emit_signal("returned")
	bbcode_text = actual


func _on_drop_coin_insert_coin_inserted():
	spins += 1
	actual = string % spins
	bbcode_text = actual
	$InsertingCoins.play()
