extends MenuScreen

func _ready():
	$"VBoxContainer/Exit".pressed.connect(_on_exit_button_pressed)
	$"VBoxContainer/Main Menu".pressed.connect(_on_main_menu_button_pressed)

func _on_exit_button_pressed():
	SignalBus.exit_game.emit()

func _on_main_menu_button_pressed():
	SignalBus.mainmenu.emit()
