extends MenuScreen


func _on_exit_button_pressed() -> void:
	SignalBus.exit_game.emit()

func _on_start_button_pressed() -> void:
	SignalBus.start_game.emit()


func _on_texture_button_pressed():
	SignalBus.start_game.emit()
	pass # Replace with function body.


func _on_texture_button_2_pressed():
	SignalBus.exit_game.emit()
	pass # Replace with function body.
