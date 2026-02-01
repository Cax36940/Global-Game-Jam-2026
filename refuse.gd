extends CustomButton

func on_button_pressed():
	if not Global.Triple_show:
		SignalBus.reject_guest.emit()

func _process(_delta: float) -> void:
	if is_pressed_in :
		sprite.frame = 1
	else :
		sprite.frame = 0
	if Input.is_action_pressed("ui_left"):
		if not Global.Triple_show:
			SignalBus.reject_guest.emit()
			sprite.frame = 1
