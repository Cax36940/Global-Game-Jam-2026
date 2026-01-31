extends CustomButton

func on_mouse_overing():
	modulate = Color(0.5, 0.5, 0.5, 0.5)
	
func on_button_pressed():
	SignalBus.checklist_show.emit(1)
	$"../../Mini_Checklist".is_shown = false
	$"../../Mini_Checklist".Actual_Color = Color(1, 1, 1, 1)
