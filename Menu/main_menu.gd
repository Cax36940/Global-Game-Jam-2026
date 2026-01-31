# Pause mechanism based on
# https://docs.godotengine.org/en/stable/tutorials/scripting/pausing_games.html
extends VBoxContainer

signal start_game

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	$Start.pressed.connect(_on_start_button_pressed)
	$Exit.pressed.connect(_on_exit_button_pressed)
	get_tree().paused = true

	$Start.grab_focus.call_deferred()
	show()

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_start_button_pressed() -> void:
	start_game.emit()
