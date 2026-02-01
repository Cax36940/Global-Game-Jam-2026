extends Node2D


var is_in : bool = false
var is_pressed_out : bool = false
var is_pressed_in : bool = false
var is_shown : bool = false
var Actual_Color = Color(1, 1, 1, 1)


#Actions au démarrage------------------------------------------------------------------------------
func _ready() -> void:
	modulate = Actual_Color


#Déclencheurs--------------------------------------------------------------------------------------

func _on_area_checklist_mouse_entered() -> void:
	is_in = true
	($Sprite_Checklist.material as ShaderMaterial).set_shader_parameter("outline_thickness", 5)
	if not is_shown:
		modulate = Color(0.478, 0.331, 0.0, 0.502)


func _on_area_checklist_mouse_exited() -> void:
	is_in = false
	($Sprite_Checklist.material as ShaderMaterial).set_shader_parameter("outline_thickness", 0)
	modulate = Actual_Color


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
						Actual_Color = Color(1, 1, 1, 1)
					else:
						if not Global.Triple_show:
							is_shown = true
							SignalBus.checklist_show.emit(0)
							Actual_Color = Color(1, 1, 1, 0)
			modulate = Actual_Color
			is_pressed_in = false
			is_pressed_out = false

func hide_mini():
	SignalBus.checklist_show.emit(0)
	visible = false

func show_mini():
	SignalBus.checklist_show.emit(1)
	visible = true

func _process(_delta: float) -> void:
	if visible:
		if Input.is_action_just_pressed("rshift"):
			if not Global.Triple_show:
				hide_mini.call_deferred()
	elif Input.is_action_just_pressed("any"):
		show_mini.call_deferred()
