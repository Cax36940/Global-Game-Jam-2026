extends Node


var ispaused
var d = 0

@onready var menu_music : AudioStreamPlayer = $MenuMusic

func _ready() -> void:
	SignalBus.start_game.connect(_on_start_game)
	SignalBus.pause_game.connect(_on_pause_game)
	SignalBus.gameover.connect(_on_gameover)
	SignalBus.mainmenu.connect(_on_main_menu)

	$GUI/PauseMenu.process_mode = Node.PROCESS_MODE_DISABLED
	# Set up first screen
	get_tree().paused = true
	ispaused = true
	menu_music.play()
	$GUI.display("MainMenu")

func _on_main_menu() -> void:
	get_tree().reload_current_scene()

func _on_start_game():
	$GUI/MainMenu.process_mode = Node.PROCESS_MODE_DISABLED
	$GUI/PauseMenu.process_mode = Node.PROCESS_MODE_ALWAYS
	$GUI.display("Overlay")
	get_tree().paused = false

func _on_pause_game(bpaused: bool):
	if bpaused:
		d = Time.get_ticks_msec()
		$GUI.display("PauseMenu")
		get_tree().paused = true
	else:
		$GUI.display("Overlay")
		get_tree().paused = false
		SignalBus.delta_pause.emit(Time.get_ticks_msec()-d)
		print(Time.get_ticks_msec()-d)

func _on_gameover():
	get_tree().paused = true
	$GUI.display("GameOver")
