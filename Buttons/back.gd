extends CustomButton

func on_mouse_overing():
	modulate = Color(0.5, 0.5, 0.5, 0.5)
	
func on_button_pressed():
	SignalBus.checklist_show.emit(1)
	$"../../Mini_Checklist".visible = true
