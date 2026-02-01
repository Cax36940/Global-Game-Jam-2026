extends CustomButton

func start():
	eternal_border = true

func _ready() -> void:
	super._ready()
	outline_thickness = 4
	eternal_border = false
	SignalBus.start_guest.connect(start)

func on_button_pressed():
	SignalBus.zoom_toggle.emit()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		SignalBus.zoom_toggle.emit()
