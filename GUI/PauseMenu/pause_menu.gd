extends MenuScreen


func _ready() -> void:
	$VBoxContainer/Resume.pressed.connect(_on_resume_button_pressed)
	$"VBoxContainer/Main Menu".pressed.connect(_on_exit_button_pressed)


func _input(event):
	if event.is_action_pressed("ui_close_dialog"):
		SignalBus.pause_game.emit(not get_tree().paused)

func _on_exit_button_pressed() -> void:
	SignalBus.mainmenu.emit()

func _on_resume_button_pressed():
	SignalBus.pause_game.emit(false)
