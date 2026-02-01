extends MenuScreen

func _ready() -> void:
	$VBoxContainer/Start.pressed.connect(_on_start_button_pressed)
	$VBoxContainer/Exit.pressed.connect(_on_exit_button_pressed)


func _on_exit_button_pressed() -> void:
	SignalBus.exit_game.emit()

func _on_start_button_pressed() -> void:
	SignalBus.start_game.emit()
