extends VBoxContainer


func _ready() -> void:
	$Start.pressed.connect(_on_start_button_pressed)
	$Exit.pressed.connect(_on_exit_button_pressed)


func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_start_button_pressed() -> void:
	SignalBus.start_game.emit()
