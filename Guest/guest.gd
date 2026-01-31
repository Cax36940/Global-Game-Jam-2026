extends Node2D
class_name Guest

@export var shapes_list : Array[PackedScene]
@export var masks_list : Array[PackedScene]
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
		mask.z_index = 10
		if colors_list.size() > 0:
			mask.modulate = colors_list.pick_random()
		else :
			push_error("There is no color in the colors_list of the guest scene")
		add_child(mask)
	else :
		push_error("There is no mask in the masks_list of the guest scene")
