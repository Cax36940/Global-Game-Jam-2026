extends CustomButton

func on_button_pressed():
	SignalBus.zoom_toggle.emit()
	eternal_border = true

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		SignalBus.zoom_toggle.emit()
