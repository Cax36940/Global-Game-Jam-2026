extends CustomButton

func on_button_pressed():
	if not Global.Triple_show:
		SignalBus.valid_guest.emit()

func _process(_delta: float) -> void:
	var p : bool = false
	
	if Input.is_action_pressed("ui_right") and not Global.Triple_show:
		SignalBus.valid_guest.emit()
		p = true

	if is_pressed_in or p :
		if sprite.frame != 1:
			sprite.frame = 1
			($Click2 as AudioStreamPlayer).play(0.03)
	else :
		if sprite.frame != 0:
			sprite.frame = 0
			($Click1 as AudioStreamPlayer).play(0.05)
