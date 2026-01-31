extends Control

var paused = false

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	$Resume.pressed.connect(_on_resume_button_pressed)
	$Exit.pressed.connect(_on_exit_button_pressed)
	hide()

func _on_game_start():
	pass


func toggle_pause():
	paused = !paused
	visible = paused
	get_tree().paused = paused
	if paused:
		$Resume.grab_focus.call_deferred()

func _input(event):
	if event.is_action_pressed("ui_close_dialog"):
		toggle_pause()

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_resume_button_pressed():
	toggle_pause()
