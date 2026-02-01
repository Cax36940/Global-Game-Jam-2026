extends Node2D
class_name CustomButton


var is_in : bool = false
var is_pressed_out : bool = false
var is_pressed_in : bool = false

var sprite

#Actions au démarrage------------------------------------------------------------------------------
func _ready() -> void:
	modulate = Color(1, 1, 1, 1)
	for c in get_children():
		if c is Sprite2D or c is AnimatedSprite2D:
			sprite = c


#Déclencheurs--------------------------------------------------------------------------------------
func _on_area_2d_mouse_entered() -> void:
	is_in = true
	if sprite :
		(sprite.material as ShaderMaterial).set_shader_parameter("outline_thickness", 5)
	on_mouse_overing()


func _on_area_2d_mouse_exited() -> void:
	is_in = false
	if sprite :
		(sprite.material as ShaderMaterial).set_shader_parameter("outline_thickness", 0)
	modulate = Color(1, 1, 1, 1)


func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			if is_in:
				if is_pressed_out:
					is_pressed_in = false
				else:
					is_pressed_in = true
			else:
				if is_pressed_in:
					is_pressed_out = false
				else:
					is_pressed_out = true
		else:
			if is_in:
				if is_pressed_in:
					on_button_pressed()
			is_pressed_in = false
			is_pressed_out = false

func on_button_pressed():
	pass

func on_mouse_overing():
	pass
