extends Node


func _ready() -> void:
	SignalBus.Mistake_test.connect(Mistake_handler)
	SignalBus.gameover.connect(End_handler)

func Mistake_handler(value : bool) -> void :	
	Global.Total_count += 1
	if not value	:
		Global.Mistakes_count += 1
	Global.update_score()
	print("Correct: ", Global.Total_count - Global.Mistakes_count, " out of ", Global.Total_count)

func End_handler() -> void :
	print("Correct: ", Global.Total_count - Global.Mistakes_count, " out of ", Global.Total_count)
	print("Score : ", Global.Score)
 

#for debugging
func _process(_delta: float) -> void:
	if Input.is_action_pressed("ui_text_backspace"):
		print(Global.Triple_show)
