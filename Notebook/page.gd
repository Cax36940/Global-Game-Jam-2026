extends Node2D
class_name Page

@onready var item_positions : Node2D = $ItemPositions

var page_index : int = -1
var constrain_count : int = 0

func add_constrain(node : Node2D):
	if constrain_count >= item_positions.get_child_count():
		push_error("To much contraint set in page ", page_index)
		return
	
	item_positions.get_children()[constrain_count].add_child(node)
	constrain_count += 1
