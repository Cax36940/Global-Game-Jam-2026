extends Control

func _ready():
	$PauseMenu.process_mode = Node.PROCESS_MODE_DISABLED
	$MainMenu.connect("start_game", _on_start_game)

	$PauseMenu.connect("pause_game", pause_game)
	$PauseButton.pressed.connect(_on_pause_button_pressed)
	$PauseButton.hide()

func _on_pause_button_pressed() -> void:
	$PauseMenu.toggle_pause()

func pause_game(ispaused: bool) -> void:
	$PauseMenu.visible = ispaused
	$PauseButton.visible = not ispaused
	get_tree().paused = ispaused

func _on_start_game():
	$MainMenu.hide()
	$MainMenu.process_mode = Node.PROCESS_MODE_DISABLED
	$PauseMenu.process_mode = Node.PROCESS_MODE_ALWAYS
	$PauseButton.show()

	get_tree().paused = false
