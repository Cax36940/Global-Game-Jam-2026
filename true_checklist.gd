extends Node2D


func _ready() -> void:
	modulate = Color(1, 1, 1, 0)
	SignalBus.checklist_show.connect(signal_handler)


func signal_handler(value : int) -> void :
	if value == 0:
		visible = true
		modulate = Color(1, 1, 1, 1)
	else:
		visible = false
		modulate = Color(1, 1, 1, 0)


func _process(delta: float) -> void:
	pass
