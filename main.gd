extends Node


var ispaused

@onready var menu_music : AudioStreamPlayer = $MenuMusic
@onready var game_music : AudioStreamPlayer = $GameMusic
@onready var game_music2 : AudioStreamPlayer = $GameMusic2
func _ready() -> void:
	SignalBus.start_game.connect(_on_start_game)
	SignalBus.pause_game.connect(_on_pause_game)
	SignalBus.gameover.connect(_on_gameover)
	SignalBus.mainmenu.connect(_on_main_menu)
	
	if !SignalBus.exit_game.is_connected(get_tree().quit):
		SignalBus.exit_game.connect(get_tree().quit)
	$GUI/MainMenu.process_mode = Node.PROCESS_MODE_ALWAYS
	$GUI/GameOver.process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	$GUI/PauseMenu.process_mode = Node.PROCESS_MODE_DISABLED

	# Set up first screen
	get_tree().paused = true
	ispaused = true
	menu_music.play()

	# The first time, we want to menu to appear instantly
	$GUI/MainMenu.show()
	$GUI/MainMenu.reset_position()
#	$GUI/MainMenu/VBoxContainer.get_child(1).grab_focus.call_deferred()
	$GUI.current_component = "MainMenu"

func _on_main_menu() -> void:
	get_tree().reload_current_scene()

func _on_start_game():
	#$GUI/MainMenu.process_mode = Node.PROCESS_MODE_DISABLED
	$GUI/PauseMenu.process_mode = Node.PROCESS_MODE_ALWAYS
	$GUI.display("Overlay")
	get_tree().paused = false
	menu_music.stop()
	game_music.play()

func _on_pause_game(bpaused: bool):
	if bpaused:
		$GUI.display("PauseMenu")
		get_tree().paused = true
		game_music.stop()
		game_music2.play()
	else:
		$GUI.display("Overlay")
		get_tree().paused = false
		game_music2.stop()
		game_music.play()

func _on_gameover():
	get_tree().paused = true
	$GUI.display("GameOver")
