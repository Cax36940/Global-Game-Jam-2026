extends Node


var ispaused

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$GUI/MainMenu.connect("start_game", _on_start_game)
	$GUI/PauseMenu.process_mode = Node.PROCESS_MODE_DISABLED
	$GUI/PauseMenu.connect("pause_game", pause_game)
	$GUI/Overlay/PauseButton.pressed.connect(pause_game)
	
	SignalBus.End_game.connect(_on_end_game)

	$GUI/Overlay.hide()
	$GUI/PauseMenu.hide()

	# Set up first screen
	get_tree().paused = true
	ispaused = true
	$GUI/MainMenu.show()

func _on_start_game():
	$GUI/MainMenu.hide()
	$GUI/MainMenu.process_mode = Node.PROCESS_MODE_DISABLED
	$GUI/PauseMenu.process_mode = Node.PROCESS_MODE_ALWAYS
	$GUI/Overlay.show()
	get_tree().paused = false

	# Fixes issue with ingame clock
	SignalBus.start_game.emit()

func pause_game():
	pass

func _on_end_game():
	# TODO: Pause game
	$GUI/GameOver.show()
	# Stop game and goto Gameover screen
