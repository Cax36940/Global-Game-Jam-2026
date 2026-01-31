extends Node2D
class_name ColorPoint

@onready var point : Sprite2D = $Icon

func set_color(new_color : Color):
	modulate = new_color
