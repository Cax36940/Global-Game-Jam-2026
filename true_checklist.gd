extends Node2D


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
