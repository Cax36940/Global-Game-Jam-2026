extends Node2D
class_name Guest

@export var shapes_list : Array[PackedScene]
@export var masks_list : Array[PackedScene]
@export var eyes_list : Array[PackedScene]
@export var colors_list : Array[Color]

func _ready():
	if shapes_list.size() > 0:
		var shape_scene : PackedScene = shapes_list.pick_random()
		var shape : Shape = shape_scene.instantiate()
		add_child(shape)
	else :
		push_error("There is no shape in the shape_list of the guest scene")
		
	if masks_list.size() > 0:
		var mask_scene : PackedScene = masks_list.pick_random()
		var mask : Mask = mask_scene.instantiate()
		if colors_list.size() > 0:
			mask.set_color.call_deferred(colors_list.pick_random())
		else :
			push_error("There is no color in the colors_list of the guest scene")
		add_child(mask)
		mask.z_index = -1
	else :
		push_error("There is no mask in the masks_list of the guest scene")
		
	if eyes_list.size() > 0:
		var eye_scene : PackedScene = eyes_list.pick_random()
		var eye_l : Eye = eye_scene.instantiate()
		$EyeL.add_child(eye_l)
		var eye_r : Eye = eye_scene.instantiate()
		$EyeR.add_child(eye_r)
	else :
		push_error("There is no shape in the shape_list of the guest scene")
