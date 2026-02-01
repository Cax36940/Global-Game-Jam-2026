extends Node2D

var is_in : bool = false
var is_pressed_out : bool = false
var is_pressed_in : bool = false

@onready var animation_player : AnimationPlayer = $AnimationPlayer

var started : bool = false

func _ready() -> void:
	animation_player.current_animation = "Idle"
	a.call_deferred()
	visible = true
	SignalBus.start_guest.connect(classic_handler)

func classic_handler():
	started = true

func a():
	Global.Triple_show = true

func _on_area_2d_mouse_entered() -> void:
	if (not Global.Triple_show or not started):
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
			if visible and is_in and is_pressed_in and (not Global.Triple_show or not started):
				SignalBus.Notebook_show.emit(0)
				animation_player.current_animation = ""
			is_pressed_in = false
			is_pressed_out = false


func show_mini():
	SignalBus.Notebook_show.emit(1)

func _process(_delta: float) -> void:
	if visible:
		if Input.is_action_just_pressed("ui_select") and (not Global.Triple_show or not started):
				SignalBus.Notebook_show.emit(0)
	elif Input.is_action_just_pressed("any"):
		show_mini.call_deferred()
