extends Node2D


func _ready() -> void:
	visible = false
	SignalBus.ID_show.connect(signal_handler)


func signal_handler(value : int) -> void :
	if value == 0:
		Global.Triple_show = true
		visible = true
		$"../MiniID".visible = false
	else:
		Global.Triple_show = false
		visible = false
		$"../MiniID".visible = true
