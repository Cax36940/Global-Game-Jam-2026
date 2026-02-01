extends CustomButton
	
func on_button_pressed():
	SignalBus.checklist_show.emit(1)
