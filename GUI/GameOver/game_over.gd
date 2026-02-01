extends MenuScreen

func _on_exit_button_pressed():
	SignalBus.exit_game.emit()

func _on_main_menu_button_pressed():
	SignalBus.mainmenu.emit()


func _on_main_menu_pressed():
	SignalBus.mainmenu.emit()
	pass # Replace with function body.


func _on_exit_pressed():
	SignalBus.exit_game.emit()
	pass # Replace with function body.
