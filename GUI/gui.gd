# Basic idea:
# At any point in time it will display at most one of its children.
extends Control

var current_component: String = ""

func _ready() -> void:
	hide_children()

func hide_children() -> void:
	for child in get_children():
		child.hide()

func display(component: String) -> void:
	if current_component:
		print(current_component)
		get_node_or_null(current_component).disappear()

	current_component = component
	var child = get_node_or_null(component)
	child.appear()
