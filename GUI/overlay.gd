extends Control

func _ready():
	SignalBus.update_dislpayed_score.connect(set_score)
	SignalBus.update_displayed_timer.connect(set_timer)
# Common interface with whole screen menus
func appear():
	show()
func disappear():
	hide()

func set_score():
	$Score.text = "Score : " + str(Global.Score)

func set_timer():
	var time_left : float = Global.GAME_TIME - Global.time
	var sec_str : String = str(int(time_left) % 60)
	if sec_str.length() < 2:
		sec_str = "0" + sec_str
	
	var min_str : String = str(int(time_left / 60))
	if min_str.length() < 2:
		min_str = "0" + min_str
	
	$Timer.text = min_str + " : " + sec_str
