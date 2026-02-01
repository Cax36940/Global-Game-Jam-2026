extends MenuScreen


func _input(event):
	if event.is_action_pressed("ui_close_dialog"):
		SignalBus.pause_game.emit(not get_tree().paused)

func _on_exit_button_pressed() -> void:
	SignalBus.mainmenu.emit()

func _on_resume_button_pressed():
	SignalBus.pause_game.emit(false)


func _on_texture_button_pressed():
	SignalBus.pause_game.emit(false)
	pass # Replace with function body.


func _on_texture_button_2_pressed():
	SignalBus.mainmenu.emit()
	pass # Replace with function body.
