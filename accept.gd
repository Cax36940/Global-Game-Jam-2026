extends CustomButton

func on_mouse_overing():
	modulate = Color(0.0, 1.0, 0.0, 0.5)

func on_button_pressed():
	if not Global.Triple_show:
		SignalBus.Mistake_test.emit(Global.is_guest_valid)
		modulate = Color(0, 0, 0, 1)
		SignalBus.valid_guest.emit()
