extends Position2D

signal coin_inserted()


func _draw():
	draw_circle(Vector2.ZERO, 25, Color.blue)


func select():
	for child in get_tree().get_nodes_in_group("zone"):
		child.deselect()
	emit_signal("coin_inserted")
	#$InsertingCoins.play()
	modulate = Color.red


func deselect():
	modulate = Color.white
