# Template for all menus that cover the screen
extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func show_wrapper() -> void:
	show()
	$Start.grab_focus.call_deferred()
