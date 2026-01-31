extends CustomButton

func on_button_pressed():
	SignalBus.checklist_show.emit(1)
	$"../../Mini_Checklist".is_shown = false
