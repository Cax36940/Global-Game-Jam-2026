extends Control


func _ready() -> void:
	hide_children()

func hide_children() -> void:
	for child in get_children():
		child.hide()

func display(name: String):
	hide_children()
	var child = get_node_or_null(name)
	child.show()
