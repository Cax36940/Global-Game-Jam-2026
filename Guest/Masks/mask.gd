extends Node2D
class_name Mask

@onready var mask : Sprite2D = $Icon

func set_color(new_color : Color):
	(mask.material as ShaderMaterial).set_shader_parameter("color", new_color)
