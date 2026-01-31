extends CustomButton

func on_mouse_overing():
	modulate = Color(0.0, 1.0, 0.0, 0.5)

func on_button_pressed():
	if not Global.Triple_show:
		SignalBus.valid_guest.emit()

func _process(_delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		if not Global.Triple_show:
			SignalBus.valid_guest.emit()
