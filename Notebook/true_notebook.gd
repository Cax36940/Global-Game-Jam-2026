extends Node2D

var cur = 0

var pages = [0,1,2,3,4,5,6]

func _ready() -> void:
	visible = false
	SignalBus.Notebook_show.connect(signal_handler)

	$Previous.pressed.connect(previous)
	$Next.pressed.connect(next)
	pages_update()


func signal_handler(value : int) -> void :
	if value == 0:
		visible = true
		Global.Triple_show = true
	else:
		visible = false
		Global.Triple_show = false
		$"../Mini_Notebook".visible = true

func next():
	if cur < len(pages):
		cur += 1
		pages_update()
	# TODO: else: deactivate button

func previous():
	if cur > 0:
		cur -= 1
		pages_update()
	# TODO: else: deactivate button

func pages_update():
	$Textbox.text = "cur = {cur}".format($".")
	$LeftPage.text = "page" + str(2*cur + 1)
	$RightPage.text = "page" + str(2*cur + 2)

func _process(delta: float) -> void:
	pass

 
