extends Node2D



var is_in : bool = false
var is_pressed_out : bool = false
var is_pressed_in : bool = false


#Actions au démarrage------------------------------------------------------------------------------
func _ready() -> void:
	modulate = Color(1, 1, 1, 1)


#Déclencheurs--------------------------------------------------------------------------------------
func _on_area_2d_mouse_entered() -> void:
	is_in = true
	modulate = Color(1.0, 0.0, 0.0, 0.5)


func _on_area_2d_mouse_exited() -> void:
	is_in = false
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
					print("Button pressed")
					modulate = Color(0, 0, 0, 1)
			is_pressed_in = false
			is_pressed_out = false
