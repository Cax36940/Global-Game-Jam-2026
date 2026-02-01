extends CustomButton

func _ready() -> void:
	super._ready()
	outline_thickness = 4
	eternal_border = false

func on_button_pressed():
	if Global.is_zoomed:
		eternal_border = false
	else:
		eternal_border = true
	SignalBus.zoom_toggle.emit()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		SignalBus.zoom_toggle.emit()
