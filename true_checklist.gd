extends Node2D

var is_in = false
var is_pressed_in = false
var is_pressed_out = false

func _ready() -> void:
	visible = false
	SignalBus.checklist_show.connect(check_handler)


func check_handler(value : int) -> void :
	if value == 0:
		if visible == false:
			Global.Triple_show = true
			visible = true
			$"../Mini_Checklist".visible = false
			$"../Mini_Checklist/Checklist1".play(0.06)
			
	else:
		if visible == true:
			Global.Triple_show = false
			visible = false
			$"../Mini_Checklist".visible = true
			$"../Mini_Checklist/Checklist2".play(0.03)


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
			if visible and not is_in and is_pressed_out:
					SignalBus.checklist_show.emit(1)
			is_pressed_in = false
			is_pressed_out = false

func _on_area_2d_mouse_entered() -> void:
	is_in = true

func _on_area_2d_mouse_exited() -> void:
	is_in = false
