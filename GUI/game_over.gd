extends "res://menu_screen.gd"


func _ready():
	$"Try Again".pressed.connect(_on_try_again_button_pressed)
	$"Main Menu".pressed.connect(_on_main_menu_button_pressed)

func _on_try_again_button_pressed():
	SignalBus.start_game.emit()

func _on_main_menu_button_pressed():
	SignalBus.mainmenu.emit()
