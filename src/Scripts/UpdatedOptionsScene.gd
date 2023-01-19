extends Control

export (NodePath) var dropdown_path
onready var dropdown = get_node(dropdown_path)

onready var difficulty = get_node("/root/Difficulty")


func _ready():
	add_options()
	
	
func add_options():
	dropdown.add_item("Normal")
	dropdown.add_item("Easier")
	dropdown.add_item("Very Easy")
	dropdown.add_item("Auto Win")
	dropdown.add_item("Impossible")

func _on_Button_pressed():
#	difficulty.difficulty = dropdown.selected
#	emit_signal("difficulty", dropdown.selected)
	get_tree().change_scene("res://Slot_Title_Menu.tscn")
