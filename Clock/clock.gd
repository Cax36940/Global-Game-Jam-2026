extends Node2D

## The amount of seconds that it takes for the hand of the clock to complete 
## one revolution
const GAME_DURATION_MINUTES : int = 12
var timer = 0
var delta = Time.get_ticks_msec()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.start_game.connect(signal_handler)
	SignalBus.delta_pause.connect(pause_handler)
	delta = Time.get_ticks_msec()

func signal_handler() -> void :
	delta = Time.get_ticks_msec()

func pause_handler(dp):
	delta += dp

func _process(_nope) -> void:
	var d = PI*(Time.get_ticks_msec()-delta)/360000
	$Face/Minutes.look_at($Face/Minutes.offset + 10000*Vector2(cos(d),sin(d)))
	$Face/Seconds.look_at($Face/Seconds.offset + 10000*Vector2(cos(12*d),sin(12*d)))
	if d > 0.1:# REMETTRE 2*PI !!! ------------------------------------------------------------------------------------------------------------------------------------------------------------------
		SignalBus.gameover.emit()
