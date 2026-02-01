extends VBoxContainer

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	$Resume.pressed.connect(_on_resume_button_pressed)
	$"Main Menu".pressed.connect(_on_exit_button_pressed)

func display():
	show()
	# https://docs.godotengine.org/en/stable/tutorials/ui/gui_navigation.html
	$Resume.grab_focus.call_deferred()

func _input(event):
	if event.is_action_pressed("ui_close_dialog"):
		SignalBus.pause_game.emit(not get_tree().paused)

func _on_exit_button_pressed() -> void:
	get_tree().reload_current_scene()

func _on_resume_button_pressed():
	SignalBus.pause_game.emit(not get_tree().paused)
