# Contains the logic to coordinate main menu and pause menu
extends Control

func _ready():
	$PauseMenu.process_mode = Node.PROCESS_MODE_DISABLED
	$MainMenu.connect("start_game", _on_start_game)

func _on_start_game():
	$MainMenu.hide()
	$MainMenu.process_mode = Node.PROCESS_MODE_DISABLED
	$PauseMenu.process_mode = Node.PROCESS_MODE_ALWAYS
	
	get_tree().paused = false
