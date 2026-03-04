extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.timeout.connect(_on_timeout)
	$Timer.wait_time = Global.GAME_TIME
	SignalBus.start_guest.connect(start_timer)
	update()

func start_timer():
	$Timer.start()

func _on_timeout():
	SignalBus.gameover.emit()

func update():
	var d = 2*PI*($Timer.wait_time - $Timer.time_left)/60
	$Face/Minutes.look_at($Face/Minutes.offset + 10000*Vector2(cos(d/12),sin(d/12)))
	$Face/Seconds.look_at($Face/Seconds.offset + 10000*Vector2(cos(d),sin(d)))
	Global.time = $Timer.wait_time - $Timer.time_left
	Global.update_score()

func _process(_unused) -> void:
	update()
