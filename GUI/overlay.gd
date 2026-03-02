extends Control

func _ready():
	SignalBus.update_dislpayed_score.connect(set_score)
# Common interface with whole screen menus
func appear():
	show()
func disappear():
	hide()

func set_score():
	$Score.text = "Score : " + str(Global.Score)
