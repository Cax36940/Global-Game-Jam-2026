extends Node2D



var is_in : bool = false
var is_pressed_out : bool = false
var is_pressed_in : bool = false
var is_shown : bool = false


#Actions au démarrage------------------------------------------------------------------------------
func _ready() -> void:
	modulate = Color(1, 1, 1, 1)


#Déclencheurs--------------------------------------------------------------------------------------
func _on_area_checklist_mouse_entered() -> void:
	is_in = true
	modulate = Color(0.478, 0.331, 0.0, 0.502)


func _on_area_checklist_mouse_exited() -> void:
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
					if is_shown:
						is_shown = false
						SignalBus.checklist_show.emit(1)
					else:
						is_shown = true
						SignalBus.checklist_show.emit(0)
			is_pressed_in = false
			is_pressed_out = false
