extends Node


var ispaused

func _ready() -> void:
	SignalBus.start_game.connect(_on_start_game)
	SignalBus.pause_game.connect(_on_pause_game)
	SignalBus.gameover.connect(_on_gameover)
	SignalBus.mainmenu.connect(_on_main_menu)

	$GUI/Overlay.hide()
	$GUI/PauseMenu.hide()
	$GUI/PauseMenu.process_mode = Node.PROCESS_MODE_DISABLED

	# Set up first screen
	get_tree().paused = true
	ispaused = true
	$GUI/MainMenu.display()

func _on_main_menu() -> void:
	get_tree().reload_current_scene()

func _on_start_game():
	$GUI/MainMenu.hide()
	$GUI/MainMenu.process_mode = Node.PROCESS_MODE_DISABLED
	$GUI/PauseMenu.hide()
	$GUI/PauseMenu.process_mode = Node.PROCESS_MODE_ALWAYS
	$GUI/Overlay.show()
	get_tree().paused = false

func _on_pause_game(ispaused: bool):
	if ispaused:
		$GUI/PauseMenu.display()
		$GUI/Overlay.hide()
		get_tree().paused = true
	else:
		$GUI/PauseMenu.hide()
		$GUI/Overlay.show()
		get_tree().paused = false

func _on_gameover():
	get_tree().paused = true
	$GUI/GameOver.display()
