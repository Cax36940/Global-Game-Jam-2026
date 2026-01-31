extends Node2D

var cur = 0
var pages = [0,1,2,3,4,5,6]

var sprites: Array

func _ready() -> void:
	visible = false
	SignalBus.Notebook_show.connect(signal_handler)
	
	# TODO: put into resource tree
	for i in range(len(pages)*2):
		var node = Sprite2D.new()
		var gradient = Gradient.new()
		gradient.colors = [
			Color(float(i)/len(pages), 0, float(i)/len(pages)),
			Color(float(i)/len(pages), 0, float(i)/len(pages))
		]
		var texture = GradientTexture2D.new()
		texture.width = 64
		texture.height = 64
		texture.gradient = gradient
		node.texture = texture
		node.visible = false
		add_child(node)
		sprites.append(node)

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
	var left = sprites[cur]
	left.visible = true
	#left.position = Vector2(400, 300)

func _process(delta: float) -> void:
	pass

 
