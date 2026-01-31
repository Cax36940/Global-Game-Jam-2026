extends VBoxContainer


func _ready():
	$"Try again".pressed.connect(_on_try_again_button_pressed)
	$Exit.pressed.connect(_on_exit_button_pressed)

func _on_try_again_button_pressed():
	print("TODO: Restart Game")

func _on_exit_button_pressed():
	get_tree().quit()
