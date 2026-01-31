extends Node2D


func _ready() -> void:
	visible = false
	SignalBus.checklist_show.connect(signal_handler)


func signal_handler(value : int) -> void :
	if value == 0:
		visible = true
		Triple.Triple_show = true
	else:
		visible = false
		Triple.Triple_show = false


func _process(delta: float) -> void:
	pass
