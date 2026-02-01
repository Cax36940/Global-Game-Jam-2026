extends Node

# How to use :
#	Where you want to emit the signal:
#		SignalBus.test_signal.emit(1234)
#
#	Where you want to receive the signal:
#		# Connect the signal
#		func _ready() -> void:
#			SignalBus.test_signal.connect(signal_handler)
#
#		# Handle the signal
#		func signal_handler(value : int) -> void :
#			# Do something

@warning_ignore('unused_signal')
signal checklist_show(value : int)

@warning_ignore('unused_signal')
signal ID_show(value : int)

@warning_ignore('unused_signal')
signal Notebook_show(value : int)

@warning_ignore('unused_signal')
signal Mistake_test(value : bool)

signal mainmenu()
signal start_game()
signal pause_game(ispaused: bool)
signal gameover()
signal exit_game()

# Guests signals
@warning_ignore('unused_signal')
signal spawn_guest()

@warning_ignore('unused_signal')
signal valid_guest()

@warning_ignore('unused_signal')
signal reject_guest()


@warning_ignore('unused_signal')
signal write_constrain()

@warning_ignore('unused_signal')
signal update_notebook()

@warning_ignore('unused_signal')
signal End_game()


# Camera
@warning_ignore('unused_signal')
signal zoom_in()
@warning_ignore('unused_signal')
signal zoom_out()
@warning_ignore('unused_signal')
signal zoom_toggle()
#player
#_ready
#epee.signal_name.connect(signal_handler)
#func signal_handler(ennemis);
#	print(ennemis)
#epee
#process
#signal_name.emit(ennemis)
