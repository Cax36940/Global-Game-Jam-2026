extends Node2D

var cur = 0
var pages = ["page0", "page1", "page2", "page3", "page4"]

func _ready() -> void:
	visible = false
	SignalBus.Notebook_show.connect(signal_handler)

	$Previous.pressed.connect(previous)
	$Next.pressed.connect(next)
	textbox_update()


func signal_handler(value : int) -> void :
	if value == 0:
		visible = true
		Global.Triple_show = true
	else:
		visible = false
		Global.Triple_show = false
		$"../Mini_Notebook".visible = true

func next():
	if cur + 2 < len(pages):
		cur += 1
		textbox_update()
	# TODO: else: deactivate button

func previous():
	if cur > 1:
		cur -= 1
		textbox_update()
	# TODO: else: deactivate button

func textbox_update():
	$Textbox.text = pages[cur] + "+" + pages[cur+1]

func _process(delta: float) -> void:
	pass

 
