extends Control

func _ready():
	$PauseMenu.process_mode = Node.PROCESS_MODE_DISABLED
	$PauseMenu.connect("pause_game", pause_game)
	$Overlay/PauseButton.pressed.connect(_on_pause_button_pressed)

func _on_pause_button_pressed() -> void:
	$PauseMenu.toggle_pause()

func pause_game(ispaused: bool) -> void:
	$PauseMenu.visible = ispaused
	$Overlay/PauseButton.visible = not ispaused
	get_tree().paused = ispaused
