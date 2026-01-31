extends Node2D


var is_in : bool = false
var is_pressed_out : bool = false
var is_pressed_in : bool = false


#Actions au démarrage------------------------------------------------------------------------------
func _ready() -> void:
	modulate = Color(1, 1, 1, 1)
	visible = true


#Déclencheurs--------------------------------------------------------------------------------------
func _on_area_2d_mouse_entered() -> void:
	is_in = true
	modulate = Color(0.0, 0.0, 0.705, 0.502)


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
					if not Global.Triple_show:
						SignalBus.ID_show.emit(0)
						visible = false
			is_pressed_in = false
			is_pressed_out = false

func hide_mini():
	SignalBus.ID_show.emit(0)
	visible = false

func show_mini():
	SignalBus.ID_show.emit(1)
	visible = true

func _process(_delta: float) -> void:
	if visible:
		if Input.is_action_just_pressed("ui_down"):
			if not Global.Triple_show:
				hide_mini.call_deferred()
	elif Input.is_action_just_pressed("any"):
		show_mini.call_deferred()
