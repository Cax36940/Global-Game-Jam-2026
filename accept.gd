extends CustomButton

func on_mouse_overing():
	modulate = Color(0.0, 1.0, 0.0, 0.5)

func on_button_pressed():
	print("Accepted !")
	modulate = Color(0, 0, 0, 1)
