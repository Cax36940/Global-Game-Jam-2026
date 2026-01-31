extends Node2D


func _ready() -> void:
	modulate = Color(1, 1, 1, 0)
	SignalBus.test_signal.connect(signal_handler)


func signal_handler(value : int) -> void :
	if value == 0:
		modulate = Color(1, 1, 1, 1)
	else:
		modulate = Color(1, 1, 1, 0)


func _process(delta: float) -> void:
	pass
