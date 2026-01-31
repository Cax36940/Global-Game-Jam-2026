extends CustomButton

func on_mouse_overing():
	modulate = Color(0.5, 0.5, 0.5, 0.5)
	
func on_button_pressed():
	print("Look closer !")
	modulate = Color(0, 0, 0, 1)
