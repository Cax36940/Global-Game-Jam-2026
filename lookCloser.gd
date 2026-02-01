extends CustomButton

func _ready():
	super._ready()
	eternal_border = true

func on_button_pressed():
	SignalBus.zoom_toggle.emit()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		SignalBus.zoom_toggle.emit()
