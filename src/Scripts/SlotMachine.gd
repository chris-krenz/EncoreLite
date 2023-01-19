extends Node2D

#export (NodePath) var dropdown_path
onready var dropdown = get_node("OptionButton")
var option


func _ready():
	
	dropdown.connect("item_selected", self, "_on_OptionButton_item_selected")
	add_options()


func add_options():
	dropdown.add_item("Guarantee Win")
	dropdown.add_item("Hacker")
	dropdown.add_item("Lucky")
	dropdown.add_item("Normal")
	dropdown.add_item("Guarantee Loss")
	dropdown.select(3)


func _on_OptionButton_item_selected(index):
	option = dropdown.get_item_text(index)
