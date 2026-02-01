extends Node2D
class_name Pages

@export var page_scene : PackedScene
@export var color_point_scene : PackedScene

@export var eyes_scene : PackedScene
@export var masks_scene : PackedScene

var page_count : int = 0

func _ready():
	SignalBus.write_constrain.connect(write_constrain)

func write_constrain():
	add_page()
	var page1 : Page = add_page()
	for mask_index in Global.invalid_mask:
		var masks : Masks = masks_scene.instantiate()
		masks.set_mask(mask_index) 
		masks.modulate = Color.BLACK
		masks.scale = Vector2(0.5, 0.5)
		page1.add_constrain(masks)
		
	var page3 : Page = add_page()
	for color_index in Global.invalid_color:
		var color : Color = Global.color_list[color_index]
		var color_point : ColorPoint = color_point_scene.instantiate()
		color_point.set_color.call_deferred(color)
		page3.add_constrain(color_point)

	var page2 : Page = add_page()
	for eye_index in Global.invalid_eye:
		var eyes : Eyes = eyes_scene.instantiate()
		eyes.set_eyes(eye_index)
		page2.add_constrain(eyes)
		
	SignalBus.update_notebook.emit()

func add_page() -> Page:
	var page : Page = page_scene.instantiate()
	page.page_index = page_count
	page_count += 1
	add_child(page)
	return page
