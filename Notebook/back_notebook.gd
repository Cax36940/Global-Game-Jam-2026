extends CustomButton

func on_mouse_overing():
	modulate = Color(0.419, 0.0, 0.086, 1.0)
	
func on_button_pressed():
	SignalBus.Notebook_show.emit(1)
