extends Node

@onready var animation_player : AnimationPlayer = $AnimationPlayer



func _ready():
	SignalBus.start_game.connect(curtain_up)
	SignalBus.End_game.connect(curtain_down)
	SignalBus.mainmenu.connect(curtain_down)
	SignalBus.pause_game.connect(curtain_toggle)
	


func curtain_up():
	animation_player.play("Start")

func curtain_down():
	animation_player.play("End")

func curtain_toggle(b : bool):
	if b :
		animation_player.play("End")
	else :
		animation_player.play("Start")
