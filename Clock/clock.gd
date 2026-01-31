extends Node2D

## The amount of seconds that it takes for the hand of the clock to complete 
## one revolution
const GAME_DURATION_MINUTES : int = 12
const MINUTE_IN_SECONDS : int = 60
var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 
	
func _on_timer_of_minutes_timeout() -> void:
	$Face/Minutes.rotate(2*PI/GAME_DURATION_MINUTES)

func _on_timer_of_seconds_timeout() -> void:
	$Face/Seconds.rotate(2*PI/MINUTE_IN_SECONDS)
	timer += 1
	if timer == GAME_DURATION_MINUTES:
		SignalBus.End_game.emit()
