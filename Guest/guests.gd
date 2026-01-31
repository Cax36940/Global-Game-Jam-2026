extends Node2D

@export var shapes_list : Array[PackedScene]
@export var masks_list : Array[PackedScene]

func _ready():
	if masks_list.size():
		var shape_scene : PackedScene = shapes_list.pick_random()
		var shape : Shape = shape_scene.instantiate()
		add_child(shape)
		
	if masks_list.size() > 0:
		var mask_scene : PackedScene = masks_list.pick_random()
		var mask : Mask = mask_scene.instantiate()
		add_child(mask)
