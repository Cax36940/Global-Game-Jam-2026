extends VBoxContainer


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	$Start.pressed.connect(_on_start_button_pressed)
	$Exit.pressed.connect(_on_exit_button_pressed)


func appear():
	show()
	$Start.grab_focus.call_deferred()

func disappear():
	# TODO: animation
	hide()

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_start_button_pressed() -> void:
	SignalBus.start_game.emit()
