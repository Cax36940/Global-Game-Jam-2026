extends Node



func _ready() -> void:
	SignalBus.Mistake_test.connect(Mistake_handler)
	SignalBus.End_game.connect(End_handler)

func Mistake_handler(value : bool) -> void :	
	Global.Total_count += 1
	if not value	:
		Global.Mistakes_count += 1
	print("Correct: ", Global.Total_count - Global.Mistakes_count, " out of ", Global.Total_count)

func End_handler() -> void :	
	Global.Score = max(0,round(30-8*log(Global.Mistakes_count*50/(Global.Total_count+5)-1)))
	print(Global.Score)
 
