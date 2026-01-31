extends CustomButton

func on_mouse_overing():
	modulate = Color(1.0, 0.0, 0.0, 0.5)

func on_button_pressed():
	print("Refused !")
	modulate = Color(0, 0, 0, 1)
