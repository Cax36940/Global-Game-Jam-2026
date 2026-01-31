extends VBoxContainer


func _ready():
	$"Try again".pressed.connect(_on_try_again_button_pressed)
	$"Main Menu".pressed.connect(_on_main_menu_button_pressed)

func _on_try_again_button_pressed():
	print("TODO: Restart Game")
	

func _on_main_menu_button_pressed():
	get_tree().reload_current_scene()
