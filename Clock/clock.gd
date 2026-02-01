extends Node2D


const GAME_DURATION : int = 60

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.timeout.connect(_on_timeout)
	$Timer.wait_time = GAME_DURATION
	$Timer.start()

func _on_timeout():
	SignalBus.gameover.emit()

func _process(_unused) -> void:
	var d = 2*PI*($Timer.wait_time - $Timer.time_left)/60

	# That's not what a real clock would do
	$Face/Minutes.look_at($Face/Minutes.offset + 10000*Vector2(cos(d/12),sin(d/12)))
	$Face/Seconds.look_at($Face/Seconds.offset + 10000*Vector2(cos(d),sin(d)))
