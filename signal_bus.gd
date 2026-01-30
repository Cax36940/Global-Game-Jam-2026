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
signal test_signal(value : int)
