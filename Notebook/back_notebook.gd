extends CustomButton
	
func on_button_pressed():
	SignalBus.Notebook_show.emit(1)
