extends Node2D
class_name Guest

static var colors_list : Array[Color] = [Color(0.9647059, 0, 0, 1), Color(1, 0.54901963, 0, 1), Color(1, 0.93333334, 0, 1), Color(0.3019608, 0.9137255, 0.29803923, 1), Color(0.21568628, 0.5137255, 1, 1), Color(0.6108052, 0.13755152, 0.8282306, 1), Color(1, 1, 1, 1)]
@onready var shape : AnimatedSprite2D = $Shape

var mask_index : int = -1
var eye_index : int = -1
var color_index : int = -1

func _ready():
	shape.frame = randi_range(0, 4)
	mask_index = random_mask()
	($Masks as Masks).set_mask(mask_index)
	if colors_list.size() > 0:
		color_index = random_color()
		$Masks.modulate = colors_list[color_index]
	else :
		push_error("There is no color in the colors_list of the guest scene")

	eye_index = random_eye()
	($Eyes as Eyes).set_eyes(eye_index)

func random_eye() -> int:
	var r = randi_range(0,9)
	if r < 8:
		return Global.valid_eye.pick_random()
	return Global.invalid_eye.pick_random()

func random_mask() -> int:
	var r = randi_range(0,9)
	if r < 8:
		return Global.valid_mask.pick_random()
	return Global.invalid_mask.pick_random()

func random_color() -> int:
	var r = randi_range(0,9)
	if r < 8:
		return Global.valid_color.pick_random()
	return Global.invalid_color.pick_random()
