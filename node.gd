extends Node



func _ready() -> void:
	SignalBus.Mistake_test.connect(Mistake_handler)
	SignalBus.End_game.connect(End_handler)

func Mistake_handler(value : bool) -> void :	
	Global.Total_count += 1
	if not value	:
		Global.Mistakes_count += 1
	print("Correct: ", Global.Total_count - Global.Mistakes_count, " out of ", Global.Total_count)

func End_handler(value : bool) -> void :	
	print(Global.Total_count)
	print(Global.Mistakes_count)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
