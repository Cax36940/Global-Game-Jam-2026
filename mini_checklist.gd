extends Node2D


var is_in : bool = false
var is_pressed_out : bool = false
var is_pressed_in : bool = false


#Actions au démarrage------------------------------------------------------------------------------
func _ready() -> void:
	modulate = Color(1, 1, 1, 1)
	visible = true


#Déclencheurs--------------------------------------------------------------------------------------

func _on_area_checklist_mouse_entered() -> void:
	is_in = true
	($Sprite_Checklist.material as ShaderMaterial).set_shader_parameter("outline_thickness", 5)

func _on_area_checklist_mouse_exited() -> void:
	is_in = false
	($Sprite_Checklist.material as ShaderMaterial).set_shader_parameter("outline_thickness", 0)


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
			if is_in and is_pressed_in and not Global.Triple_show:
				SignalBus.checklist_show.emit(0)
				visible = false
			is_pressed_in = false
			is_pressed_out = false

func show_mini():
	SignalBus.checklist_show.emit(1)
	visible = true

func _process(_delta: float) -> void:
	if visible:
		if Input.is_action_just_pressed("rshift") and not Global.Triple_show:
			SignalBus.checklist_show.emit(0)
			visible = false
		if is_in:
			modulate = Color(0.478, 0.331, 0.0, 0.5)
		else:
			modulate = Color(1, 1, 1, 1)
	elif Input.is_action_just_pressed("any"):
		show_mini.call_deferred()
