extends Node2D
class_name Guest

@export var colors_list : Array[Color]
@onready var shape : AnimatedSprite2D = $Shape

var mask_index : int = -1
var eye_index : int = -1
var color_index : int = -1

func _ready():
	shape.frame = randi_range(0, 4)
	mask_index = randi_range(0, 6)
	($Masks as Masks).set_mask(mask_index)
	if colors_list.size() > 0:
		color_index = randi_range(0, colors_list.size()-1)
		$Masks.modulate = colors_list[color_index]
	else :
		push_error("There is no color in the colors_list of the guest scene")

	eye_index = randi_range(0, 6)
	($Eyes as Eyes).set_eyes(eye_index)
