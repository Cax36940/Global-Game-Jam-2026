extends Button

const GAME = preload("res://main.tscn")

func _ready() -> void:
	pressed.connect(_pressed)

func _pressed() -> void:
	get_tree().change_scene_to_packed(GAME)
# set_process_input(false)
