extends Node2D

var cur = 0
var pages = [0,1]

var sprites: Array

func _ready() -> void:
	visible = false
	SignalBus.Notebook_show.connect(signal_handler)
	
	$Previous.pressed.connect(previous)
	$Next.pressed.connect(next)
	SignalBus.update_notebook.connect(update_page_position)

func update_page_position():
	cur = 0
	sprites = $Pages.get_children()
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
	if cur < len(pages) - 1:
		cur += 1
		pages_update()
	# TODO: else: deactivate button

func previous():
	if cur > 0:
		cur -= 1
		pages_update()
	# TODO: else: deactivate button

func pages_reset():
	for sprite in sprites:
		sprite.visible = false
		sprite.position = Vector2(0,0)


func put_left(sprite):
	sprite.position = Vector2(-200, 0)
	sprite.visible = true
func put_right(sprite):
	sprite.position = Vector2(200, 0)
	sprite.visible = true

func pages_update():
	var left = sprites[2*cur]
	var right = sprites[2*cur+1]
	pages_reset()
	put_left(left)
	put_right(right)
	# (De)Activate buttons if at beginning/end
	# XXX: this is very ugly
	if cur + 1 == len(pages):
		$Next.visible = false
	elif cur == 0:
		$Previous.visible = false
	else:
		$Previous.visible = true
		$Next.visible = true
