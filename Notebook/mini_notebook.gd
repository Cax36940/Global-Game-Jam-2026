extends Node2D

var is_in : bool = false
var is_pressed_out : bool = false
var is_pressed_in : bool = false


func _ready() -> void:
	visible = true

func _on_area_2d_mouse_entered() -> void:
	if not Global.Triple_show:
		is_in = true
		(($Sprite2D as Sprite2D).material as ShaderMaterial).set_shader_parameter("outline_thickness", 5)

func _on_area_2d_mouse_exited() -> void:
	is_in = false
	(($Sprite2D as Sprite2D).material as ShaderMaterial).set_shader_parameter("outline_thickness", 0)


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
			if visible and is_in and is_pressed_in and not Global.Triple_show:
				SignalBus.Notebook_show.emit(0)
			is_pressed_in = false
			is_pressed_out = false


func show_mini():
	SignalBus.Notebook_show.emit(1)

func _process(_delta: float) -> void:
	if visible:
		if Input.is_action_just_pressed("ui_select") and not Global.Triple_show:
				SignalBus.Notebook_show.emit(0)
	elif Input.is_action_just_pressed("any"):
		show_mini.call_deferred()
