extends CustomButton

func on_button_pressed():
	if not Global.Triple_show:
		SignalBus.valid_guest.emit()

func _process(_delta: float) -> void:
	if Input.is_action_pressed("ui_right") and not Global.Triple_show:
		SignalBus.valid_guest.emit()
		sprite.frame = 1
	if is_pressed_in :
		sprite.frame = 1
	else :
		sprite.frame = 0
		
