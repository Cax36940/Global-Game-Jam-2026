extends Node2D

var is_in = false
var is_pressed_in = false
var is_pressed_out = false

func _ready() -> void:
	visible = false
	SignalBus.checklist_show.connect(signal_handler)


func signal_handler(value : int) -> void :
	if value == 0:
		visible = true
		Global.Triple_show = true
	else:
		visible = false
		Global.Triple_show = false


func _process(_delta: float) -> void:
	pass

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
			if not is_in:
				if is_pressed_out:
					SignalBus.checklist_show.emit(1)
					$"../Mini_Checklist".visible = true
			is_pressed_in = false
			is_pressed_out = false

func _on_area_2d_mouse_entered() -> void:
	is_in = true


func _on_area_2d_mouse_exited() -> void:
	is_in = false
