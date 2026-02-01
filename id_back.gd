extends CustomButton

func on_mouse_overing():
	modulate = Color(0.5, 0.5, 0.5, 0.5)
	
func on_button_pressed():
	SignalBus.ID_show.emit(1)

func _process(delta: float) -> void:
	if Input.is_action_pressed("any"):
		SignalBus.ID_show.emit(1)
