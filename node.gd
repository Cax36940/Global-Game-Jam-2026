extends Node



func _ready() -> void:
	SignalBus.Mistake_test.connect(Mistake_handler)
	SignalBus.gameover.connect(End_handler)

func Mistake_handler(value : bool) -> void :	
	Global.Total_count += 1
	if not value	:
		Global.Mistakes_count += 1
	print("Correct: ", Global.Total_count - Global.Mistakes_count, " out of ", Global.Total_count)

func End_handler() -> void :
	var m =0
	if Global.Mistakes_count < 2:
		m = 1
	else:
		m = Global.Mistakes_count3
	@warning_ignore('integer_division')
	Global.Score = min(max(0,round(30-8*log(m*50/(Global.Total_count+5)-1))), 100)
	print("Correct: ", Global.Total_count - Global.Mistakes_count, " out of ", Global.Total_count)
	print("Score : ", Global.Score)
 
