extends Node2D

## The amount of seconds that it takes for the hand of the clock to complete 
## one revolution
const GAME_DURATION_MINUTES : int = 12
const SECONDS_IN_MINUTE: int = 60

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 
	
func _on_timer_of_minutes_timeout() -> void:
	$Face/Minutes.rotate(2*PI/GAME_DURATION_MINUTES)

func _on_timer_of_seconds_timeout() -> void:
	$Face/Seconds.rotate(2*PI/SECONDS_IN_MINUTE)
	
