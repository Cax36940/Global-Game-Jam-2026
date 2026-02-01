extends VBoxContainer


func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	$"Try Again".pressed.connect(_on_try_again_button_pressed)
	$"Main Menu".pressed.connect(_on_main_menu_button_pressed)

func display():
	show()
	# https://docs.godotengine.org/en/stable/tutorials/ui/gui_navigation.html
	$"Try Again".grab_focus.call_deferred()

func _on_try_again_button_pressed():
	SignalBus.start_game.emit()

func _on_main_menu_button_pressed():
	SignalBus.mainmenu.emit()
