extends Node2D

var cur = 0
var pages = [0,1]
var sprites: Array

var is_in = false
var is_pressed_in = false
var is_pressed_out = false


var started : bool = false

func _ready() -> void:
	visible = false
	SignalBus.Notebook_show.connect(signal_handler)
	SignalBus.Next_page.connect(next)
	SignalBus.Previous_page.connect(previous)	
	SignalBus.update_notebook.connect(update_page_position)


func signal_handler(value : int) -> void :
	if value == 0:
		if visible == false:
			Global.Triple_show = true
			visible = true
			$"../Mini_Notebook".visible = false
			$"../Mini_Notebook/Checklist1".play(0.06)
			
	else:
		if visible == true:
			Global.Triple_show = false
			visible = false
			if started == false:
				started = true
				SignalBus.start_guest.emit()
				
			$"../Mini_Notebook".visible = true
			$"../Mini_Notebook/Checklist2".play(0.03)

func update_page_position():
	cur = 0
	sprites = $Pages.get_children()
	pages_update()

func next():
	if cur < len(pages) - 1:
		cur += 1
		pages_update()

func previous():
	if cur > 0:
		cur -= 1
		pages_update()

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
	# (De)Activate buttons if at beginning/end
	# XXX: this is very ugly
	$Previous_notebook.visible = true
	$Next_notebook.visible = true
	if cur + 1 >= len(pages):
		$Next_notebook.visible = false
	elif cur == 0:
		$Previous_notebook.visible = false
	pages_reset()
	put_left(left)
	put_right(right)

func _process(_delta: float) -> void:
	if visible:
		if Input.is_action_just_pressed("ui_right"):
			next()
		elif Input.is_action_just_pressed("ui_right"):
			previous()


func _on_area_2d_mouse_entered() -> void:
	is_in = true

func _on_area_2d_mouse_exited() -> void:
	is_in = false

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			if is_in:
				if is_pressed_out:
					is_pressed_in = false
				else:
					is_pressed_in = true
			else:
				if is_pressed_in:
					is_pressed_out = false
				else:
					is_pressed_out = true
		else:
			if visible and not is_in and is_pressed_out:
					SignalBus.Notebook_show.emit(1)
			is_pressed_in = false
			is_pressed_out = false
