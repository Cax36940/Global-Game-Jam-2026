extends Node2D


func _ready() -> void:
	visible = false
	SignalBus.ID_show.connect(signal_handler)


func signal_handler(value : int) -> void :
	if value == 0:
		visible = true
	else:
		visible = false
		$"../MiniID".visible = true


func _process(delta: float) -> void:
	pass
