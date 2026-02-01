extends CustomButton

func _ready() -> void:
	super._ready()
	outline_thickness = 4

func on_button_pressed():
	if not Global.Triple_show:
		SignalBus.zoom_toggle.emit()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		if not Global.Triple_show:
			SignalBus.zoom_toggle.emit()
