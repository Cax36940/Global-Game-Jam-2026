extends CustomButton

func on_mouse_overing():
	modulate = Color(0.5, 0.5, 0.5, 0.5)
	
func on_button_pressed():
	if not Global.Triple_show:
		print("Look closer !")

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		if not Global.Triple_show:
			print("Look closer !")
