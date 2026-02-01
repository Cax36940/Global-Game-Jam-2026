extends Node2D



var is_in : bool = false
var is_pressed_out : bool = false
var is_pressed_in : bool = false
var is_shown : bool = false
var actual_color = Color(1, 1, 1, 1)


@export var tex : Texture2D

	
#Actions au démarrage------------------------------------------------------------------------------
func _ready() -> void:
	modulate = actual_color
	$NextPageButton.texture = tex


#Déclencheurs--------------------------------------------------------------------------------------
func _on_area_2d_mouse_entered() -> void:
	is_in = true
	modulate = Color(0.5, 0.5, 0.5, 1)


func _on_area_2d_mouse_exited() -> void:
	is_in = false
	modulate = actual_color


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
					SignalBus.Previous_page.emit()
			is_pressed_in = false
			is_pressed_out = false
